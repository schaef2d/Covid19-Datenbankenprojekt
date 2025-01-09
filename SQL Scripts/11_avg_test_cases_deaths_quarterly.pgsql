SELECT
    c.location,
    EXTRACT(QUARTER FROM c.date) AS quarter,
    ROUND(COALESCE(AVG(t.total_tests_per_thousand), 0), 2) AS avg_tests_per_thousand,
    ROUND(AVG(c.new_cases), 2) AS avg_quarterly_cases,
    ROUND(AVG(d.new_deaths), 2) AS avg_quarterly_deaths
FROM
    cases c
LEFT JOIN
    tests t ON c.location = t.location AND c.date = t.date
LEFT JOIN
    deaths d ON c.location = d.location AND c.date = d.date
WHERE
    c.date BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY
    c.location, EXTRACT(QUARTER FROM c.date)
ORDER BY
    c.location, quarter;