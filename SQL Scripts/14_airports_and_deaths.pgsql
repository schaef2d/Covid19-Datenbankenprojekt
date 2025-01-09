WITH airport_counts AS (
    SELECT 
        a.country AS country_code,
        COUNT(a.iatacode) AS total_airports
    FROM 
        public.airport a
    GROUP BY 
        a.country
),
covid_data_aggregated AS (
    SELECT 
        cd.location AS country,
        SUM(deaths.new_deaths) AS total_deaths
    FROM 
        country_data cd
    LEFT JOIN 
        deaths ON cd.location = deaths.location
    GROUP BY 
        cd.location
)
SELECT 
    c.name AS country,
    COALESCE(ac.total_airports, 0) AS total_airports,
    TO_CHAR(COALESCE(covid_data.total_deaths, 0), '999,999,999,999') AS total_deaths
FROM 
    covid_data_aggregated covid_data
JOIN 
    country_data cd ON covid_data.country = cd.location
JOIN 
    public.country c ON cd.mondial_country_code = c.code
LEFT JOIN 
    airport_counts ac ON c.code = ac.country_code
ORDER BY 
    ac.total_airports DESC;
