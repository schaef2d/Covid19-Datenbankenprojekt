SELECT 
    s.location,
    TO_CHAR(ROUND(AVG(s.stringency_index), 2), 'FM999.00') AS avg_stringency_index,
    TO_CHAR(ROUND(MAX(s.stringency_index), 2), 'FM999.00') AS max_stringency_index,
    TO_CHAR(ROUND(AVG((d.new_deaths::numeric / NULLIF(c.new_cases, 0)) * 100), 2), 'FM999.00') AS avg_death_rate_percentage,
    TO_CHAR(ROUND(MAX((d.new_deaths::numeric / NULLIF(c.new_cases, 0)) * 100), 2), 'FM999.00') AS max_death_rate_percentage
FROM 
    stringency s
JOIN 
    cases c USING (location, date, week)
JOIN 
    deaths d USING (location, date, week)
WHERE 
    s.location IN ('China', 'Germany', 'India', 'United States')
    AND c.date BETWEEN '2020-03-01' AND '2023-05-14'
GROUP BY 
    s.location
ORDER BY 
    avg_stringency_index DESC;
