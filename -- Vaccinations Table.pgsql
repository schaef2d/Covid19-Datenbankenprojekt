-- Vaccinations Table
CREATE TABLE vaccinations (
    vaccination_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    week VARCHAR(10),
    total_vaccinations BIGINT,
    total_boosters BIGINT
);