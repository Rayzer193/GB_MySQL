USE dz4;
SELECT * FROM AUTO;
/*№1.Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA*/
SELECT color, mark, count(1)
FROM auto 
WHERE mark IN ('BMW','LADA') 
GROUP BY color, mark;

/*№2.Вывести на экран марку авто(количество) и количество авто не этой марки. 100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки*/

SELECT DISTINCT mark, (select count(1) 
FROM auto a1 
WHERE a1.mark = a.mark) AS count_of_this_mark, (select count(1) 
FROM auto a1 
WHERE a1.mark != a.mark) AS count_of_another_mark 
FROM auto a;

/*№3. Даны 2 таблицы Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.*/

create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values (10, 'A'), (20, 'A'), (30, 'F'), (40, 'D'), (50, 'C');
insert into test_b(id) values (10), (30), (50);
SELECT * FROM test_a;
SELECT * FROM test_b;
SELECT * FROM test_a NATURAL LEFT JOIN test_b WHERE test_b.id IS NULL;