CREATE DATABASE lab7;

CREATE TABLE location(
  location_id SERIAL PRIMARY KEY ,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

INSERT INTO location (street_address, postal_code, city, state_province) VALUES ('123asd', '000110', 'Astana', 'qwerty');
INSERT INTO location (street_address, postal_code, city, state_province) VALUES ('456asd', '000100', 'Almaty', 'asdfgh');
INSERT INTO location (street_address, postal_code, city, state_province) VALUES ('789asd', '000110', 'Astana', 'zxcvbn');

CREATE TABLE department(
  department_id SERIAL PRIMARY KEY ,
  derpartment_name VARCHAR(50) UNIQUE ,
  budget INT,
  location_id INT REFERENCES location
);

INSERT INTO department (derpartment_name, budget) VALUES ('Dname', 42000);
INSERT INTO department (derpartment_name, budget) VALUES ('Bname', 80000);
INSERT INTO department (derpartment_name, budget) VALUES ('Gname', 19500);

CREATE TABLE employee(
  employee_id VARCHAR(50),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(20),
  salary INT,
  department_id INT REFERENCES department
);

INSERT INTO employee (employee_id, first_name, last_name, phone_number, salary, department_id) VALUES (1, 'Mark', 'Markenson', '555-123654', 42, 1);
INSERT INTO employee (employee_id, first_name, last_name, phone_number, salary, department_id) VALUES (2, 'Dark', 'Darkenson', '555-012045', 924, 2);
INSERT INTO employee (employee_id, first_name, last_name, phone_number, salary, department_id) VALUES (3, 'Clark', 'Calarkenson', '555-466665', 67, 3);

--3
SELECT employee.first_name, employee.last_name, employee.department_id, department.derpartment_name FROM employee LEFT JOIN department on employee.department_id = department.department_id;
--4
SELECT employee.first_name, employee.last_name, employee.department_id, department.derpartment_name FROM employee LEFT JOIN department on employee.department_id = department.department_id WHERE department.department_id = 80 or department.department_id = 40;
--5
SELECT employee.first_name, employee.last_name, employee.department_id, location.city, location.state_province FROM employee LEFT JOIN location on employee.department_id = location.location_id;
--6
SELECT department.* FROM department LEFT JOIN employee on department.department_id = employee.department_id;
--7
SELECT employee.first_name, employee.last_name, department.department_id, department.derpartment_name FROM employee FULL JOIN department on employee.department_id = department.department_id;


