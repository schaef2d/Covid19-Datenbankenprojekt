-- Select the location
SELECT 
    s.location,

    -- Calculate the average stringency index, round it to 2 decimal places, and convert it to a string
    TO_CHAR(ROUND(AVG(s.stringency_index), 2), 'FM999.00') AS avg_stringency_index,

    -- Calculate the maximum stringency index, round it to 2 decimal places, and convert it to a string
    TO_CHAR(ROUND(MAX(s.stringency_index), 2), 'FM999.00') AS max_stringency_index,

    -- Calculate the average death rate percentage, round it to 2 decimal places, and convert it to a string
    TO_CHAR(ROUND(AVG((d.new_deaths::numeric / NULLIF(c.new_cases, 0)) * 100), 2), 'FM999.00') AS avg_death_rate_percentage,

    -- Calculate the maximum death rate percentage, round it to 2 decimal places, and convert it to a string
    TO_CHAR(ROUND(MAX((d.new_deaths::numeric / NULLIF(c.new_cases, 0)) * 100), 2), 'FM999.00') AS max_death_rate_percentage

-- From the stringency table
FROM 
    stringency s

-- Join with the cases table using location, date, and week
JOIN 
    cases c USING (location, date, week)

-- Join with the deaths table using location, date, and week
JOIN 
    deaths d USING (location, date, week)

-- Filter for specific locations and date range
WHERE 
    s.location IN ('China', 'Germany', 'India', 'United States')
    AND c.date BETWEEN '2020-03-01' AND '2023-05-14'

-- Group by location
GROUP BY 
    s.location

-- Order by average stringency index in descending order
ORDER BY 
    avg_stringency_index DESC;
