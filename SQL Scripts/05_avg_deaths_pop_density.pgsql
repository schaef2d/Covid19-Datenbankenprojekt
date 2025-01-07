SELECT 
    d.location,
    ROUND(AVG(d.total_deaths_per_million), 2) AS avg_deaths_per_million,
    c.population_density AS population_density,
    CASE
        WHEN c.population_density < 100 THEN 'Low Density'
        WHEN c.population_density BETWEEN 100 AND 500 THEN 'Medium Density'
        ELSE 'High Density'
    END AS density_category
FROM 
    deaths d
JOIN 
    country_data c
ON 
    d.location = c.location
GROUP BY 
    d.location, c.population_density
ORDER BY 
    c.population_density DESC, avg_deaths_per_million DESC;