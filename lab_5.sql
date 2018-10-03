CREATE DATABASE lab5;

CREATE TABLE customers2 (
  cusomer_id  INT,
  cust_name   VARCHAR(30),
  city        VARCHAR(30),
  grade       INT,
  salesman_id INT
);

INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3001, 'Brad Guzan', 'London', NULL , 5005);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers2 (cusomer_id, cust_name, city, grade, salesman_id) VALUES (3008, 'Julian Green', 'London', 300, 5002);


--3
SELECT * FROM customers2 WHERE grade > 100;
--4
SELECT * FROM customers2 WHERE city = 'New York' and grade > 100;
--5
SELECT * FROM customers2 WHERE city = 'New York' or grade > 100;
--6
SELECT * FROM customers2 WHERE city = 'Paris' or city = 'Rome';
--7
SELECT * FROM customers2 WHERE cust_name LIKE 'B%';
--8
CREATE TABLE orders2(
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  description VARCHAR(30),
  purch_amt INT
);
--9
SELECT * FROM orders2 WHERE customer_id=(SELECT customer_id FROM customers2 WHERE city = 'New York');
--10
SELECT * FROM customers2 WHERE cusomer_id=(SELECT cusomer_id FROM orders2 HAVING sum(order_id) > 10);
--11
SELECT sum(purch_amt) FROM orders2;
--12
SELECT avg(purch_amt) FROM orders2;
--13
SELECT GREATEST(purch_amt) FROM orders2;
