SELECT 
    cd.location,
    ROUND(cd.population_density, 2) AS population_density,
    TO_CHAR(SUM(v.total_vaccinations::numeric), 'FM999G999G999G999G999') AS total_vaccinations,
    TO_CHAR(SUM(c.new_cases::numeric), 'FM999G999G999G999G999') AS total_cases,
    CASE
        WHEN cd.population_density < 100 THEN 'Low Density'
        WHEN cd.population_density BETWEEN 100 AND 500 THEN 'Medium Density'
        ELSE 'High Density'
    END AS density_category
FROM 
    country_data cd
JOIN 
    vaccinations v USING (location)
JOIN 
    cases c USING (location)
WHERE 
    cd.location IN ('China', 'Germany', 'India', 'United States')
GROUP BY 
    cd.location, cd.population_density
ORDER BY 
    population_density DESC;