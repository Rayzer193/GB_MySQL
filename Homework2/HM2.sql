CREATE SCHEMA dz2;
USE dz2;
CREATE TABLE sales
(
id SERIAL PRIMARY KEY,
order_date DATE NOT NULL,
count_product INT UNSIGNED
);

SELECT * from sales;
INSERT INTO sales (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);


SELECT
	id,
	IF(count_product < 100, "Маленький заказ",
		IF(count_product BETWEEN 100 AND 300, "Средний заказ",
			"Большой заказ"))
	AS "тип заказа"
FROM sales;

CREATE TABLE orders
(
id SERIAL PRIMARY KEY,
employee_id VARCHAR(50) NOT NULL,
amount FLOAT,
order_status VARCHAR(50)
);

SELECT * from orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');


SELECT id, employee_id, amount, 
CASE
	WHEN order_status = 'OPEN' THEN "OPEN"
    WHEN order_status = 'CLOSED' THEN "CLOSED"
    ELSE "CANCELLED"
END AS full_order_status
FROM orders;
