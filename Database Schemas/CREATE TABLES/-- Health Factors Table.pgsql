-- Health Factors Table
CREATE TABLE health_factors (
    health_factor_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL UNIQUE,
    median_age NUMERIC,
    aged_70_older NUMERIC,
    life_expectancy NUMERIC,
    smokers NUMERIC
);