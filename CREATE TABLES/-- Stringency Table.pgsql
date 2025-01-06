-- Stringency Table
CREATE TABLE stringency (
    stringency_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    week VARCHAR(10),
    stringency_index NUMERIC
);