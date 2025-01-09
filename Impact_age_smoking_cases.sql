SELECT 
    h.location,
    ROUND(AVG(h.median_age), 1) AS median_age,
    ROUND(AVG(h.smokers), 2) AS percent_smokers,
    ROUND(AVG(c.new_cases_per_million), 2) AS avg_new_cases_per_million
FROM 
    health_factors h
JOIN 
    cases c
USING (location)
WHERE 
    c.date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY 
    h.location
ORDER BY 
    avg_new_cases_per_million DESC;