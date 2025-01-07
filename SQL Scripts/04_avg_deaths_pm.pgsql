SELECT 
    location,
    ROUND(AVG(total_deaths_per_million), 2) AS avg_deaths_per_million
FROM 
    deaths
GROUP BY 
    location
ORDER BY 
    avg_deaths_per_million DESC;







