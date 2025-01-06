-- Country Data Table (Konstante Daten)
CREATE TABLE country_data (
    country_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL UNIQUE,
    political_system VARCHAR(255),
    gdp_per_capita NUMERIC,
    human_development_index NUMERIC,
    population_density NUMERIC
);
