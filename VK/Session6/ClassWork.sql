SELECT * FROM catalogs;

UPDATE catalogs SET id = id - 10;

INSERT INTO catalogs VALUES();

INSERT INTO catalogs VALUES(NULL, 'Сетевое оборудование');

SELECT * FROM catalogs WHERE name is NULL;
SELECT * FROM catalogs WHERE name IS NOT NULL;

DELETE FROM catalogs WHERE id = 15;
DELETE FROM catalogs WHERE id = 14;

INSERT INTO catalogs VALUES (4, 'Жесткие диски'),(5, 'Оперативная память');

SELECT * FROM catalogs WHERE id > 2;
SELECT * FROM catalogs WHERE id > 2 AND id <=4;
SELECT 2 BETWEEN 2 AND 4;
SELECT * FROM catalogs WHERE id BETWEEN 3 AND 4;
SELECT * FROM catalogs WHERE id NOT BETWEEN 3 AND 4;
SELECT * FROM catalogs WHERE id IN (1 ,2 ,5);
SELECT * FROM catalogs WHERE id NOT IN (1, 2, 5);
SELECT * FROM catalogs WHERE name = 'процессоры';
SELECT * FROM catalogs WHERE name LIKE 'процессоры';
SELECT * FROM catalogs WHERE name LIKE '%Ы';
SELECT * FROM catalogs WHERE name NOT LIKE '%Ы';

INSERT INTO users (name, birthday_at) VALUES
	('Геннадий','1990-10-05'),
	('Наталья','1984-11-12'),
	('Александр','1985-05-20'),
	('Сергей','1988-02-14'),
	('Иван','1998-01-12'),
	('Мария','1992-08-29');
	
SELECT * FROM users WHERE birthday_at >= '1990-01-01' AND birthday_at < '2000-01-01';
SELECT * FROM users WHERE birthday_at BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM users WHERE birthday_at LIKE '199%'; 

SELECT * FROM users;
DELETE FROM users WHERE id = 1;
UPDATE users SET id = id - 1;


SELECT * FROM catalogs;
SELECT * FROM catalogs ORDER BY name;
SELECT * FROM catalogs ORDER BY name DESC;

INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
 ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров на платформе Intel.', 7890.00, 1),
 ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров на платформе Intel.', 12700.00, 1),
 ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров на платформе AMD.', 4780.00, 1),
 ('AMD FX-8320', 'Процессор для настольных персональных компьютеров на платформе AMD.', 7120.00, 1),
 ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX.', 19310.00, 2),
 ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX.', 4790.00, 2),
 ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.', 5060.00, 2);
 
SELECT * FROM products;

SELECT id, catalog_id, price, name FROM products;
SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id, price;
SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id, price DESC;
SELECT id, catalog_id, price, name FROM products ORDER BY catalog_id DESC, price DESC;

SELECT id, catalog_id, price, name FROM products LIMIT 2;
SELECT id, catalog_id, price, name FROM products LIMIT 2, 2;
SELECT id, catalog_id, price, name FROM products LIMIT 4, 2;
SELECT id, catalog_id, price, name FROM products LIMIT 2 OFFSET 4;

SELECT catalog_id FROM products ORDER BY catalog_id;
SELECT DISTINCT catalog_id FROM products ORDER BY catalog_id;
SELECT ALL catalog_id FROM products ORDER BY catalog_id;

SELECT id, catalog_id, price, name FROM products WHERE catalog_id = 2 AND price > 5000;
UPDATE products SET price = price * 0.9 WHERE catalog_id = 2 AND price > 5000;
SELECT id, catalog_id, price, name FROM products;
SELECT id, catalog_id, price, name FROM products ORDER BY price;
SELECT id, catalog_id, price, name FROM products ORDER BY price DESC;
SELECT id, catalog_id, price, name FROM products ORDER BY price DESC LIMIT 2;
DELETE FROM products ORDER BY price DESC LIMIT 2;

DESCRIBE users;

INSERT INTO users VALUES (NULL, 'Александр', '1986-01-20', NOW(), NOW());
SELECT name, created_at, updated_at FROM users WHERE name = 'Александр';
SELECT name, DATE(created_at), DATE(updated_at) FROM users WHERE name = 'Александр';

SELECT 
	id,
	name,
	birthday_at,
	DATE(created_at) AS created_at,
	DATE(updated_at) AS updated_at
FROM 
	users;
	
SELECT 
	id,
	name,
	birthday_at,
	DATE(created_at) created_at,
	DATE(updated_at) updated_at
FROM 
	users;
	
SELECT name, DATE_FORMAT(birthday_at, '%d.%m.%Y') AS birthday_at FROM users;
TRUNCATE users; 

INSERT INTO users (name, birthday_at) VALUES
	('Геннадий','1990-10-05'),
	('Наталья','1984-11-12'),
	('Александр','1985-05-20'),
	('Сергей','1988-02-14'),
	('Иван','1998-01-12'),
	('Мария','2006-08-29');
	
SELECT * FROM users;
SELECT 
	name,
	(TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25 AS age
FROM 
	users;
	
SELECT 
	name,
	FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25) AS age
FROM 
	users;
	
SELECT 
	name,
	TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age
FROM 
	users;
	
SELECT * FROM users;
SELECT * FROM users ORDER BY RAND();
SELECT * FROM users ORDER BY RAND() LIMIT 1;

SELECT VERSION();
SELECT VERSION() FROM DUAL;

TRUNCATE catalogs;
TRUNCATE products;

INSERT INTO catalogs VALUES (NULL, 'Процессоры');
SELECT LAST_INSERT_ID();

INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
	('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров на платформе Intel.', 7890.00, LAST_INSERT_ID()),
	('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров на платформе Intel.', 12700.00, LAST_INSERT_ID()),
	('AMD FX-8320E', 'Процессор для настольных персональных компьютеров на платформе AMD.', 4780.00, LAST_INSERT_ID()),
 	('AMD FX-8320', 'Процессор для настольных персональных компьютеров на платформе AMD.', 7120.00, LAST_INSERT_ID());
 
INSERT INTO catalogs VALUES (NULL, 'Материнские платы');
INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
	('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX.', 19310.00, LAST_INSERT_ID()),
 	('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX.', 4790.00, LAST_INSERT_ID()),
 	('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.', 5060.00, LAST_INSERT_ID());
 	
 SELECT * FROM catalogs;
 SELECT id, name, description, price, catalog_id FROM products;
 
SELECT DATABASE();
USE shop;
SELECT USER();

SELECT RAND();

CREATE TABLE distances(
	id SERIAL PRIMARY KEY,
	x1 INT NOT NULL,
	y1 INT NOT NULL,
	x2 INT NOT NULL,
	y2 INT NOT NULL,
	distance DOUBLE AS (SQRT(POW(x1 - x2, 2) + POW(y1 - y2, 2)))
) COMMENT = 'Расстояние между двумя точками';

INSERT INTO distances
	(x1, y1, x2, y2)
VALUES
	(1, 1, 4, 5),
	(4, -1, 3, 2),
	(-2, 5, 1, 3);
	
SELECT * FROM distances;

DROP TABLE IF EXISTS distances;

CREATE TABLE distances(
	id SERIAL PRIMARY KEY,
	a JSON NOT NULL,
	b JSON NOT NULL,
	distance DOUBLE AS (SQRT(POW(a->>'$.x' - b->>'$.x', 2) + POW(a->>'$.y' - b->>'$.y', 2)))
) COMMENT = 'Расстояние между двумя точками';

INSERT INTO distances 
	(a, b)
VALUES
	('{"x": 1, "y": 1}', '{"x": 4, "y": 5}'),
	('{"x": 4, "y": -1}', '{"x": 3, "y": 2}'),
	('{"x": -2, "y": 5}', '{"x": 1, "y": 3}');
	
SELECT * FROM distances;

CREATE TABLE triangles (
	id SERIAL PRIMARY KEY,
	a DOUBLE NOT NULL COMMENT 'Сторона треугольника',
	b DOUBLE NOT NULL COMMENT 'Сторона треугольника',
	angle INT NOT NULL COMMENT 'Угол треугольника в градусах',
	square DOUBLE AS (a * b * SIN(RADIANS(angle)) / 2.0)
) COMMENT = 'Площадь треугольника';

INSERT INTO triangles
	(a, b, angle)
VALUES
	(1.414, 1, 45),
	(2.707, 2.104, 60),
	(2.088, 2.112, 56),
	(5.014, 2.304, 23),
	(3.482, 4.708, 38);
	
SELECT * FROM triangles;
ALTER TABLE triangles CHANGE square square DOUBLE AS (ROUND(a * b * SIN(RADIANS(angle)) / 2.0, 4));


SELECT id, name FROM users;
SELECT id, SUBSTRING(name, 1, 5) AS name FROM users;
SELECT id, CONCAT(name, ' ', TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS name FROM users;
SELECT 
	name,
	IF(
		TIMESTAMPDIFF(YEAR, birthday_at, NOW()) >= 18,
		'совершеннолетний',
		'несовершеннолетний'
	) AS status
FROM 
	users;
	
CREATE TABLE rainbow(
	id SERIAL PRIMARY KEY,
	color VARCHAR(255)
) COMMENT = 'Цвета радуги';

INSERT INTO
	rainbow(color)
VALUES
	('red'),
	('orange'),
	('yellow'),
	('green'),
	('blue'),
	('indigo'),
	('violet');
	
SELECT * FROM rainbow;
SELECT 
	CASE
		WHEN color = 'red' THEN 'красный'
		WHEN color = 'orange' THEN 'оранжевый'
		WHEN color = 'yellow' THEN 'желтый'
		WHEN color = 'green' THEN 'зеленый'
		WHEN color = 'blue' THEN 'голубой'
		WHEN color = 'indigo' THEN 'синий'
		ELSE 'фиолетовый'
	END AS russian
FROM 
	rainbow;
	
SELECT catalog_id FROM products;
SELECT DISTINCT catalog_id FROM products;
SELECT id, name, id % 3 FROM products ORDER BY id % 3;
SELECT catalog_id FROM products GROUP BY catalog_id;

SELECT id, name, birthday_at FROM users;
SELECT id, name, SUBSTRING(birthday_at, 1, 3) FROM users;
SELECT id, name, SUBSTRING(birthday_at, 1, 3) AS decade FROM users;
SELECT id, name, SUBSTRING(birthday_at, 1, 3) AS decade FROM users ORDER BY decade;
SELECT SUBSTRING(birthday_at, 1, 3) AS decade FROM users GROUP BY decade;

SELECT 
	COUNT(*), 
	SUBSTRING(birthday_at, 1, 3) AS decade 
FROM 
	users 
GROUP BY 
	decade
ORDER BY
	decade DESC;
	
SELECT 
	COUNT(*) AS total, 
	SUBSTRING(birthday_at, 1, 3) AS decade 
FROM 
	users 
GROUP BY 
	decade
ORDER BY
	total DESC;
	
SELECT COUNT(*) FROM users;

SELECT
	GROUP_CONCAT(name),
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade;
	
SELECT
	GROUP_CONCAT(name SEPARATOR ' '),
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade;
	
SELECT
	GROUP_CONCAT(name ORDER BY name DESC SEPARATOR ' '),
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade;
	
SELECT COUNT(id) FROM catalogs;
SELECT COUNT(*) FROM catalogs;

SELECT catalog_id FROM products;
SELECT catalog_id FROM products GROUP BY catalog_id;
SELECT catalog_id, COUNT(*) AS total FROM products GROUP BY catalog_id;

DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl(
	id INT NOT NULL,
	value INT DEFAULT NULL
);

INSERT INTO tbl VALUES (1, 230);
INSERT INTO tbl VALUES (2, NULL);
INSERT INTO tbl VALUES (3, 405);
INSERT INTO tbl VALUES (4, NULL);

SELECT * FROM tbl;
SELECT COUNT(id), COUNT(value) FROM tbl;
SELECT COUNT(*) FROM tbl;

SELECT
	id,
	catalog_id
FROM 
	products;
	
SELECT
	COUNT(id) AS total_ids,
	COUNT(catalog_id) AS total_catalog_ids
FROM
	products;
	
SELECT
	COUNT(DISTINCT id) AS total_ids,
	COUNT(DISTINCT catalog_id) AS total_catalog_ids
FROM
	products;
	
SELECT 
	MIN(price) AS min,
	MAX(price) AS max
FROM 
	products;
	
SELECT
	catalog_id,
	MIN(price) AS min,
	MAX(price) AS max
FROM 
	products
GROUP BY
	catalog_id;
	
SELECT id, name, price FROM products ORDER BY price DESC LIMIT 1;
SELECT AVG(price) FROM products;
SELECT ROUND(AVG(price), 2) FROM products;
SELECT 
	catalog_id,
	ROUND(AVG(price), 2) AS price
FROM 
	products
GROUP BY
	catalog_id;
	
SELECT 
	catalog_id,
	ROUND(AVG(price * 1.2), 2) AS price
FROM 
	products
GROUP BY
	catalog_id;
	
SELECT SUM(price) FROM products;
SELECT catalog_id, SUM(price) FROM products GROUP BY catalog_id;

SELECT 
	GROUP_CONCAT(name),
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade;
	
SELECT
	COUNT(*) AS total,
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade;
	
SELECT
	COUNT(*) AS total,
	SUBSTRING(birthday_at, 1, 3) AS decade
FROM 
	users
GROUP BY
	decade
HAVING 
	total >= 2;
	
SELECT 
	*
FROM 
	users
HAVING
	birthday_at >= '1990-01-01';
	
TRUNCATE products;

INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
 ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров на платформе Intel.', 7890.00, 1),
 ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров на платформе Intel.', 12700.00, 1),
 ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров на платформе AMD.', 4780.00, 1),
 ('AMD FX-8320', 'Процессор для настольных персональных компьютеров на платформе AMD.', 7120.00, 1),
 ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX.', 19310.00, 2),
 ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX.', 4790.00, 2),
 ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.', 5060.00, 2);
 
INSERT INTO products 
	(name, description, price, catalog_id)
VALUES
 ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров на платформе Intel.', 7890.00, 1),
 ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров на платформе Intel.', 12700.00, 1),
 ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров на платформе AMD.', 4780.00, 1),
 ('AMD FX-8320', 'Процессор для настольных персональных компьютеров на платформе AMD.', 7120.00, 1),
 ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX.', 19310.00, 2),
 ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX.', 4790.00, 2),
 ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.', 5060.00, 2);
 
SELECT id, name, catalog_id FROM products;
SELECT 
	name, description, price, catalog_id
FROM 
	products
GROUP BY
	name, description, price, catalog_id;
	
CREATE TABLE products_new(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание',
	price DECIMAL (11,2) COMMENT 'Цена',
	catalog_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO
	products_new
SELECT
	NULL, name, description, price, catalog_id, NOW(), NOW()
FROM 
	products
GROUP BY
	name, description, price, catalog_id;
	
SELECT id, name, description, catalog_id FROM products_new;
DROP TABLE products;

ALTER TABLE products_new RENAME products;
SHOW TABLES;
SELECT id, name, description, catalog_id FROM products;
SELECT * FROM products;
SELECT name, birthday_at FROM users;

INSERT INTO users (name, birthday_at) VALUES
	('Светлана', '1988-02-04'),
	('Олег', '1998-03-20'),
	('Юлия', '2006-07-12');
	
SELECT name, birthday_at FROM users ORDER BY birthday_at;

SELECT YEAR(birthday_at) FROM users ORDER BY birthday_at; 
SELECT 
	YEAR(birthday_at) AS birthday_year
FROM 
	users
GROUP BY
	birthday_year 
ORDER BY
	birthday_year;
	
SELECT 
	MAX(name),
	YEAR(birthday_at) AS birthday_year
FROM 
	users
GROUP BY
	birthday_year 
ORDER BY
	birthday_year;
	
SELECT 
	ANY_VALUE(name),
	YEAR(birthday_at) AS birthday_year
FROM 
	users
GROUP BY
	birthday_year
ORDER BY
	birthday_year;
	
SELECT 
	SUBSTRING(birthday_at, 1, 3) AS decade,
	COUNT(*)
FROM 
	users
GROUP BY
	decade;
	
SELECT 
	SUBSTRING(birthday_at, 1, 3) AS decade,
	COUNT(*)
FROM 
	users
GROUP BY
	decade 
WITH ROLLUP;