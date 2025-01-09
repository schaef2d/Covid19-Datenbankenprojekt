CREATE TABLE country_data (
    country_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL UNIQUE,
    political_system VARCHAR(255),
    gdp_per_capita NUMERIC,
    human_development_index NUMERIC,
    population_density NUMERIC
);

INSERT INTO "country_data" ("location", "political_system", "gdp_per_capita", "human_development_index", "population_density") VALUES ('China', 'communism', '15308.71', '0.76', '147.67');
INSERT INTO "country_data" ("location", "political_system", "gdp_per_capita", "human_development_index", "population_density") VALUES ('Germany', 'federal parliamentary republic', '45229.24', '0.95', '237.02');
INSERT INTO "country_data" ("location", "political_system", "gdp_per_capita", "human_development_index", "population_density") VALUES ('India', 'parliamentary secular democratic republic', '6426.67', '0.64', '450.42');
INSERT INTO "country_data" ("location", "political_system", "gdp_per_capita", "human_development_index", "population_density") VALUES ('United States', 'constitutional federal republic', '54225.45', '0.93', '35.61');