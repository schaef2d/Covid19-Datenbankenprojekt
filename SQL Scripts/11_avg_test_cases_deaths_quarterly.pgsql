-- Select the location and extract the quarter from the date
SELECT
    c.location,
    EXTRACT(QUARTER FROM c.date) AS quarter,

    -- Calculate the average tests per thousand, using COALESCE to handle null values, and round to 2 decimal places
    ROUND(COALESCE(AVG(t.total_tests_per_thousand), 0), 2) AS avg_tests_per_thousand,

    -- Calculate the average number of new cases per quarter and round to 2 decimal places
    ROUND(AVG(c.new_cases), 2) AS avg_quarterly_cases,

    -- Calculate the average number of new deaths per quarter and round to 2 decimal places
    ROUND(AVG(d.new_deaths), 2) AS avg_quarterly_deaths

-- From the cases table
FROM
    cases c

-- Left join with the tests table on location and date
LEFT JOIN
    tests t ON c.location = t.location AND c.date = t.date

-- Left join with the deaths table on location and date
LEFT JOIN
    deaths d ON c.location = d.location AND c.date = d.date

-- Filter for dates between January 1, 2020, and December 31, 2021
WHERE
    c.date BETWEEN '2020-01-01' AND '2021-12-31'

-- Group by location and quarter
GROUP BY
    c.location, EXTRACT(QUARTER FROM c.date)

-- Order by location and quarter
ORDER BY
    c.location, quarter;
