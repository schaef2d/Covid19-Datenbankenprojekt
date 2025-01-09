SELECT 
    c.location,
    EXTRACT(QUARTER FROM c.date) AS quarter,
    -- Calculate the total number of new cases for the quarter and round to 2 decimal places
    ROUND(SUM(c.new_cases), 2) AS quarterly_cases,
    -- Calculate the total number of new deaths for the quarter and round to 2 decimal places
    ROUND(SUM(d.new_deaths), 2) AS quarterly_deaths
FROM 
    cases c
-- Perform a left join with the deaths table on location and date
LEFT JOIN 
    deaths d ON c.location = d.location AND c.date = d.date
-- Filter the records to include only those between January 1, 2020, and December 31, 2021
WHERE 
    c.date BETWEEN '2020-01-01' AND '2021-12-31'
-- Group the results by location and quarter
GROUP BY 
    c.location, EXTRACT(QUARTER FROM c.date)
-- Order the results by location and quarter
ORDER BY 
    c.location, quarter;
