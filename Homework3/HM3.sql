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
	 (01, 'Павлов', 'Воронеж', '.11'),
	 (02, 'Валидов', 'Питер', '.12'),
	 (05, 'Судник', 'Москва', '.15'),
	 (07, 'Матросов', 'Самара', '.16'),
	 (10, 'Плешин', 'Самара', '.17');
 
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
    (2011, 'Павлов', 'Питер', 100, 1002),
    (2002, 'Валидов', 'Москва', 200, 1006),
    (2023, 'Матросов', 'Воронеж', 100, 1007),
    (2015, 'Судник', 'Воркута', 200, 1003),
    (2022, 'Плешин', 'Питер', 300, 1005),
    (2000, 'Смирнов', 'Воронеж', 300, 1005),
    (2005, 'Иванова', 'Москва', 200, 1004);
    
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
    (3001, 17.22, '1990-10-03', 2009, 1007),
    (3002, 155.17, '1990-10-03', 2002, 1001),
    (3003, 316.22, '1990-10-03', 2006, 1004),
    (3004, 9999.99, '1990-10-03', 2004, 1002),
    (3005, 888.22, '1990-10-03', 2008, 1007),
    (3006, 1488.66, '1990-10-04', 2009, 1003),
    (3007, 175.75, '1990-10-04', 2001, 1002),
    (3008, 666.12, '1990-10-05', 2004, 1001),
    (3009, 1820.02, '1990-10-06', 2004, 1002),
    (3010, 1111.11, '1990-10-06', 2010, 1001);

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
  (1, 'Иван', 'Павлов', 'руководитель', 40, 100000, 60),
  (2, 'Егор', 'Лунин', 'руководитель', 8, 70000, 30),
  (3, 'Петр', 'Погудин', 'разработчик', 2, 80000, 22),
  (4, 'Александр', 'Логинов', 'разработчик', 12, 80000, 25),
  (5, 'Михаил', 'Шашкин', 'разработчик', 40, 60000, 18),
  (6, 'Сергей', 'Зверев', 'специалист', 20, 25000, 30),
  (7, 'Зинаида', 'Васильева', 'уборщик', 10, 20000, 47),
  (8, 'Антон', 'Макаров', 'специалист', 8, 19000, 28),
  (9, 'Макар', 'Антонов', 'специалист', 5, 15000, 33),
  (10, 'Юрий', 'Металов', 'специалист', 2, 11000, 29),
  (11, 'Эдгар', 'Инэров', 'специалист', 3, 12000, 24),
  (12, 'Артем', 'Пригожин', 'специалист', 10, 10000, 35);

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