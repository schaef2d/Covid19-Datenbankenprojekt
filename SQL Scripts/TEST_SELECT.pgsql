SELECT 
    c.week, 
    c.location, 
    TO_CHAR(SUM(c.new_cases), 'FM999,999,999') AS total_cases, 
    TO_CHAR(SUM(d.new_deaths), 'FM999,999,999') AS total_deaths,
    TO_CHAR(ROUND((SUM(d.new_deaths)::numeric / NULLIF(SUM(c.new_cases), 0)) * 100, 2), 'FM999,999,990.00') AS death_rate_percentage
FROM 
    cases c
JOIN 
    deaths d 
USING (location, date, week)
WHERE 
    c.location IN ('United States', 'China') 
    AND c.date BETWEEN '2021-01-15' AND '2021-01-30'
GROUP BY 
    c.week, c.location
ORDER BY 
    c.week, c.location;