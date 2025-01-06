-- Deaths Table
CREATE TABLE deaths (
    death_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    week VARCHAR(10),
    total_deaths BIGINT,
    new_deaths BIGINT,
    total_deaths_per_million NUMERIC,
    new_deaths_per_million NUMERIC
);