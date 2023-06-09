CREATE SCHEMA dz6;
USE dz6;

-- №1 Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.  Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION converter_seconds(seconds INT)
RETURNS VARCHAR(100)
NO SQL
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE formatted_duration VARCHAR(100);

  SET days = floor(seconds / (24 * 3600));
  SET seconds = seconds % (24 * 3600);

  SET hours = floor(seconds / 3600);
  SET seconds = seconds % 3600;

  SET minutes = floor(seconds / 60);
  SET seconds = seconds % 60;

  SET formatted_duration = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

  RETURN formatted_duration;
END //

DELIMITER ;

SELECT converter_seconds(123456);

-- №2 Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER //

CREATE FUNCTION get_even_numbers(n INT)
RETURNS VARCHAR(100)
NO SQL
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE result VARCHAR(100) DEFAULT '';
  
  WHILE i <= n DO
    IF i % 2 = 0 THEN
      SET result = CONCAT(result, i, ', ');
    END IF;
    SET i = i + 1;
  END WHILE;
  
  RETURN SUBSTRING(result, 1, LENGTH(result) - 2);
END //

DELIMITER ;

SELECT get_even_numbers(10);
