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
('2022-01-01', 72),
('2022-03-12', 170),
('2022-05-13', 317),
('2022-05-22', 555),
('2022-01-05', 219);


SELECT
	id,
	IF(count_product < 100, "Мелкий",
		IF(count_product BETWEEN 100 AND 300, "Средний",
			"Большой"))
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
('e15143', 12.00, 'Открыт'),
('e20513', 22.40, 'Отменен'),
('e31531', 10.0, 'Закрыт'),
('e41355', 17.22, 'Открыт'),
('e51684', 2.80, 'Открыт');


SELECT id, employee_id, amount, 
CASE
	WHEN order_status = 'Открыт' THEN "Заказ в статусе открыт"
    WHEN order_status = 'Закрыт' THEN "Заказ закрыт"
    ELSE "Заказ отменен"
END AS full_order_status
FROM orders;