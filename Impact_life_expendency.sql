SELECT 
    h.location,
    ROUND(h.life_expectancy, 1) AS life_expectancy,
    ROUND(h.aged_70_older, 2) AS percent_aged_70_older,
    TO_CHAR(SUM(c.total_cases), 'FM999,999,999') AS total_cases,
    TO_CHAR(SUM(c.total_cases_per_million), 'FM999,999,999.00') AS total_cases_per_million
FROM 
    health_factors h
JOIN 
    cases c
USING (location)
GROUP BY 
    h.location, h.life_expectancy, h.aged_70_older
ORDER BY 
    total_cases DESC;