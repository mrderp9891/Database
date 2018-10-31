--1
SELECT * FROM countries WHERE name = 'string';
CREATE INDEX countries_name_index ON countries USING hash (name);

--2
SELECT * FROM employees WHERE name = ‘string’ AND surname = ‘string’;
CREATE INDEX countries_name_surname_index ON employees USING hash (name,surname);

--3
SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE UNIQUE INDEX salary_index ON employees USING btree(salary, salary);

--4
SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;
CREATE INDEX employees_substring_index  ON employees USING hash (substring(name));

--5
SELECT * FROM employees e JOIN departments d ON d.department_id = e.department_id WHERE d.budget > value2 AND e.salary < value2;
CREATE JOIN INDEX employees_department_index FOR employees e JOIN department d ON d.department_id = e.department.id;
