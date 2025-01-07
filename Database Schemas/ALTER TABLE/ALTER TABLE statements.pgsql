ALTER TABLE cases
ADD CONSTRAINT fk_cases_country
FOREIGN KEY (location)
REFERENCES country_data(location);


ALTER TABLE deaths
ADD CONSTRAINT fk_deaths_country
FOREIGN KEY (location)
REFERENCES country_data(location);

ALTER TABLE health_factors
ADD CONSTRAINT fk_health_factors_country
FOREIGN KEY (location)
REFERENCES country_data(location);

ALTER TABLE stringency
ADD CONSTRAINT fk_stringency_country
FOREIGN KEY (location)
REFERENCES country_data(location);

ALTER TABLE tests
ADD CONSTRAINT fk_tests_country
FOREIGN KEY (location)
REFERENCES country_data(location);

ALTER TABLE vaccinations
ADD CONSTRAINT fk_vaccinations_country
FOREIGN KEY (location)
REFERENCES country_data(location);


