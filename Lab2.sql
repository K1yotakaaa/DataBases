--1st task
CREATE DATABASE lab2;

--2nd task
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INTEGER,
    population INTEGER
);

--3rd task
INSERT INTO countries (country_name, region_id, population)
VALUES ('Japan', 1, 126000000);

--4th task
INSERT INTO countries (country_id, country_name)
VALUES (2, 'India');

--5th task
INSERT INTO countries (region_id)
VALUES (NULL);

--6th task
INSERT INTO countries (country_name, region_id, population)
VALUES
    ('USA', 4, 340000000),
    ('Russia', 5, 144000000),
    ('China', 6, 141000000);

--7th task
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

--8th task
INSERT INTO countries (country_name, region_id, population)
VALUES (DEFAULT, 7, 20000000);

--9th task
INSERT INTO countries DEFAULT VALUES;

--10th task
CREATE TABLE countries_new (LIKE countries);

--11th task
INSERT INTO countries_new
SELECT * FROM countries;

--12th task
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

--13th task
SELECT country_name, population * 1.1 AS "New Population"
FROM countries;

--14th task
DELETE FROM countries
WHERE population < 100000;

--15th task
DELETE FROM countries_new
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING *;

--16th
DELETE FROM countries  -- 16 task
RETURNING *;







