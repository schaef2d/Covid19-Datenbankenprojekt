-- Cases Table
CREATE TABLE cases (
    case_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    week VARCHAR(10),
    total_cases BIGINT,
    new_cases BIGINT,
    total_cases_per_million NUMERIC,
    new_cases_per_million NUMERIC
);


