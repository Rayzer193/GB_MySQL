CREATE SCHEMA dz3;
USE dz3;

-- Таблица "Продавцы"
CREATE TABLE salespeople (
    PRIMARY KEY (snum),
    snum    INT,
    sname   VARCHAR(50)    NOT NULL,
    city    VARCHAR(50)    NOT NULL,
    comm    VARCHAR(4)
);

INSERT  salespeople (snum, sname, city, comm)
VALUES
	 (01, 'Peel', 'London', '.12'),
	 (02, 'Serres', 'San Jose', '.13'),
	 (05, 'Motika', 'London', '.11'),
	 (07, 'Rifkin', 'Barcelona', '.15'),
	 (10, 'Axelrod', 'New York', '.10');
 
SELECT * FROM salespeople;

-- Таблица "Заказчики"
CREATE TABLE customers (
  PRIMARY KEY (cnum),
  cnum    INT,
  cname   VARCHAR(50)    NOT NULL,
  city    VARCHAR(50)    NOT NULL,
  rating  INT            NOT NULL,
  snum    INT,
          FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
    (2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'SanJose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);
    
SELECT * FROM customers;

-- Таблица "Заказы"
CREATE TABLE orders (
  PRIMARY KEY(onum),
  onum    INT,
  amt     DECIMAL(8, 2),
  odate   DATE,
  cnum    INT,
  snum    INT,
          FOREIGN KEY (cnum) REFERENCES customers(cnum),
		  FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
    (3001, 18.69, '1990-10-03', 2008, 1007),
    (3003, 767.19, '1990-10-03', 2001, 1001),
    (3002, 1900.10, '1990-10-03', 2007, 1004),
    (3005, 5160.45, '1990-10-03', 2003, 1002),
    (3006, 1098.16, '1990-10-03', 2008, 1007),
    (3009, 1713.23, '1990-10-04', 2002, 1003),
    (3007, 75.75, '1990-10-04', 2004, 1002),
    (3008, 4723.00, '1990-10-05', 2006, 1001),
    (3010, 1309.95, '1990-10-06', 2004, 1002),
    (3011, 9891.88, '1990-10-06', 2006, 1001);

SELECT * FROM orders;
-- Задание 1
-- Для таблицы "Продавцы"
SELECT city, sname, snum, comm FROM salespeople;
-- Задание 2
SELECT rating, cname FROM customers WHERE city = 'SanJose';
-- Задание 3
SELECT DISTINCT snum FROM orders;
-- Задание 4
SELECT * FROM customers WHERE cname LIKE 'G%';
-- Задание 5
SELECT * FROM orders WHERE amt > 1000;
-- Задание 6
SELECT MIN(amt) AS min_amt FROM orders;
-- Задание 7
SELECT * FROM customers WHERE rating > 100 AND city <> 'Rome';


CREATE TABLE employees (
  PRIMARY KEY(id),
  id        INT AUTO_INCREMENT,
  name      VARCHAR(50),
  surname   VARCHAR(50),
  specialty VARCHAR(50),
  seniority INT,
  salary    INT,
  age       INT
);

INSERT INTO employees (id, name, surname, specialty, seniority, salary, age)
VALUES
  (1, 'Вася', 'Васькин', 'начальник', 40, 100000, 60),
  (2, 'Петя', 'Петькин', 'начальник', 8, 70000, 30),
  (3, 'Катя', 'Каткина', 'инженер', 2, 70000, 25),
  (4, 'Саша', 'Сашкин', 'инженер', 12, 50000, 35),
  (5, 'Иван', 'Иванов', 'рабий', 40, 30000, 59),
  (6, 'Петр', 'Петров', 'рабочий', 20, 25000, 40),
  (7, 'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
  (8, 'Антон', 'Антонов', 'рабочий', 8, 19000, 28),
  (9, 'Юрв', 'Юркин', 'рабочий', 5, 15000, 25),
  (10, 'Максим', 'Воронин', 'рабочий', 2, 11000, 22),
  (11, 'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
  (12, 'Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM employees;
-- Задание 1
-- В порядке убывания
SELECT * FROM employees ORDER BY salary DESC;

-- В порядке возрастания
SELECT * FROM employees ORDER BY salary ASC;

-- Задание 2
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Задание 3
SELECT specialty, SUM(salary) AS total_salary FROM employees
GROUP BY specialty
HAVING total_salary > 100000;