SELECT 
    location,
    -- Trennzeichen
    TO_CHAR(SUM(total_vaccinations), '999G999G999G999G999G999,FM999G999') AS total_vaccinations,
    ROUND(AVG(deaths.total_deaths_per_million), 2) AS avg_deaths_per_million
FROM 
    vaccinations
JOIN 
    deaths
USING (location)
GROUP BY 
    location
ORDER BY 
    SUM(total_vaccinations) DESC;
