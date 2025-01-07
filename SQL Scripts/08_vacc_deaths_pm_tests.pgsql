SELECT 
    v.location AS country,
    TO_CHAR(ROUND(AVG(v.total_vaccinations), 2), 'FM999G999G999D00') AS avg_total_vaccinations,
    TO_CHAR(ROUND(AVG(d.total_deaths_per_million), 2), 'FM999G999G999D00') AS avg_deaths_per_million,
    TO_CHAR(ROUND(AVG(t.total_tests_per_thousand), 2), 'FM999G999D00') AS avg_tests_per_thousand
FROM 
    vaccinations v
JOIN 
    deaths d USING (location, date, week)
JOIN 
    tests t USING (location, date, week)
GROUP BY 
    v.location
ORDER BY 
    avg_deaths_per_million DESC;






