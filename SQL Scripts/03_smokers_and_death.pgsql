SELECT 
    hf.location AS country,
    hf.smokers AS percentage_of_smokers,
    ROUND(AVG(d.total_deaths_per_million), 2) AS avg_deaths_per_million
FROM 
    health_factors hf
JOIN 
    deaths d
ON 
    hf.location = d.location
GROUP BY 
    hf.location, hf.smokers
ORDER BY 
    percentage_of_smokers DESC, avg_deaths_per_million DESC;

