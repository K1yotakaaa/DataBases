CREATE DATABASE lab7;


CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    population INT,
    region VARCHAR(50)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    budget DECIMAL(15, 2) NOT NULL
);


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    salary DECIMAL(15, 2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO countries (name, population, region) VALUES
('Kazakhstan', 19000000, 'Central Asia'),
('Russia', 144000000, 'Eastern Europe'),
('USA', 331000000, 'North America'),
('Japan', 126000000, 'East Asia'),
('France', 67000000, 'Western Europe');


INSERT INTO departments (name, budget) VALUES
('Engineering', 2000000.00),
('Sales', 1500000.00),
('Human Resources', 500000.00),
('Marketing', 1200000.00),
('Finance', 1750000.00);


INSERT INTO employees (name, surname, salary, department_id, hire_date) VALUES
('Alice', 'Johnson', 80000.00, 1, '2020-01-15'),
('Bob', 'Smith', 90000.00, 1, '2019-03-22'),
('Carol', 'Williams', 65000.00, 2, '2021-06-01'),
('David', 'Brown', 70000.00, 3, '2018-09-12'),
('Emma', 'Jones', 75000.00, 4, '2021-11-05'),
('Frank', 'Garcia', 85000.00, 5, '2017-04-18'),
('Grace', 'Martinez', 95000.00, 1, '2019-07-30'),
('Hank', 'Lee', 60000.00, 2, '2020-10-10'),
('Isabel', 'Davis', 88000.00, 4, '2018-05-25'),
('Jack', 'Wilson', 70000.00, 5, '2022-01-13');



-- 1st task
CREATE INDEX idx_countries_name ON countries(name);
-- Example
SELECT * FROM countries WHERE name = 'Kazakhstan';


-- 2nd task
CREATE INDEX idx_employees_name_surname ON employees(name, surname);
-- Example
SELECT * FROM employees WHERE name = 'Alice' AND surname = 'Johnson';


--3rd task
CREATE UNIQUE INDEX idx_employees_salary ON employees(salary);
--Example
SELECT * FROM employees WHERE salary < 90000 AND salary > 60000;


--4th task
CREATE INDEX idx_employees_name_substring ON employees((substring(name FROM 1 FOR 4)));
--Example
SELECT * FROM employees WHERE substring(name FROM 1 FOR 4) = 'Jack';


--5th task
CREATE INDEX idx_departments_budget ON departments(budget);
CREATE INDEX idx_employees_department_salary ON employees(department_id, salary);
--Example
SELECT * FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > 1000000 AND e.salary < 90000;