WITH covid_data_aggregated AS (
    SELECT 
        cd.location AS country,
        SUM(d.new_deaths) AS total_deaths
    FROM 
        country_data cd
    LEFT JOIN 
        deaths d ON cd.location = d.location
    GROUP BY 
        cd.location
),
inflation_data AS (
    SELECT 
        e.country AS country_code,
        e.inflation AS inflation_rate
    FROM 
        public.economy e
)
SELECT 
    c.name AS country,
    COALESCE(TO_CHAR(e.inflation_rate, 'FM999.99') || ' %', 'N/A') AS inflation_rate,
    TO_CHAR(COALESCE(cd.total_deaths, 0), '999,999,999') AS total_deaths
FROM 
    covid_data_aggregated cd
JOIN 
    country_data covid_country ON cd.country = covid_country.location
JOIN 
    public.country c ON covid_country.mondial_country_code = c.code
LEFT JOIN 
    inflation_data e ON c.code = e.country_code
ORDER BY 
    e.inflation_rate DESC NULLS LAST;
