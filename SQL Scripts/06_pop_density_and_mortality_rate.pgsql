SELECT 
    cd.location,
    ROUND(cd.population_density, 2) AS population_density,
    TO_CHAR(SUM(c.new_cases), 'FM999,999,999') AS total_cases,
    TO_CHAR(SUM(d.new_deaths), 'FM999,999,999') AS total_deaths,
    TO_CHAR(ROUND((SUM(d.new_deaths)::numeric / NULLIF(SUM(c.new_cases), 0)) * 100, 2), 'FM999,999,990.00') AS death_rate_percentage
FROM 
    country_data cd
JOIN 
    cases c 
USING (location)
JOIN 
    deaths d 
USING (location, date, week)
WHERE 
    c.date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY 
    cd.location, cd.population_density
ORDER BY 
    population_density DESC;