-- Tests Table
CREATE TABLE tests (
    test_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    week VARCHAR(10),
    total_tests_per_thousand NUMERIC,
    new_tests_per_thousand NUMERIC
);
