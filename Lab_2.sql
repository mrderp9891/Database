CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL,
  country_name VARCHAR(50),
  region_id INT,
  population INT,
  CONSTRAINT pKey PRIMARY KEY (country_id)
);

INSERT INTO countries VALUES (DEFAULT, 'NewLand', 01, 12345000);
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Dendyburg');
INSERT INTO countries VALUES (DEFAULT, 'China', NULL, 2123456000);
INSERT INTO countries (country_id, country_name, region_id, population) VALUES
(DEFAULT, 'Ruthland', 02, 125500000),
(DEFAULT, 'Gregerburg', 03, 78200000),
(DEFAULT, 'Nukecity', 04, 12300000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Bomiland';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 05, 3);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 12345000;

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;



SELECT * FROM countries;