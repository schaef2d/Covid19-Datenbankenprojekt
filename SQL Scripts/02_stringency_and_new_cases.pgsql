WITH stringency_cases AS (
    SELECT 
        s.location,
        s.week,
        s.stringency_index,
        c.new_cases
    FROM stringency s
    JOIN cases c USING (location, date, week)
    WHERE c.new_cases IS NOT NULL
),
max_stringency AS (
    SELECT DISTINCT ON (location) 
        location,
        week,
        stringency_index,
        new_cases
    FROM stringency_cases
    ORDER BY location, stringency_index DESC
),
min_stringency AS (
    SELECT DISTINCT ON (location) 
        location,
        week,
        stringency_index,
        new_cases
    FROM stringency_cases
    ORDER BY location, stringency_index ASC
)
SELECT 
    location,
    'Max Stringency' AS type,
    week,
    stringency_index,
    new_cases
FROM max_stringency

UNION ALL

SELECT 
    location,
    'Min Stringency' AS type,
    week,
    stringency_index,
    new_cases
FROM min_stringency
ORDER BY location, type DESC;
