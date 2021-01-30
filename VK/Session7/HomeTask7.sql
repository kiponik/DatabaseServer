-- 1

SELECT * FROM orders;
SELECT * FROM users;

INSERT INTO orders
	SELECT
		id,
		FLOOR(1 + (RAND() * 9)),
		CURRENT_TIMESTAMP,
		CURRENT_TIMESTAMP
	FROM users;
	

SELECT 
	*
FROM 
	users	
WHERE
	id
IN
	(SELECT user_id FROM orders);
	
-- 2

SELECT * FROM products;
SELECT * FROM catalogs;
SELECT * FROM orders_products;
DESC orders_products;

INSERT INTO orders_products
	SELECT
		id,
			FLOOR(1 + (RAND() * 9)),
			FLOOR(1 + (RAND() * 7)),
			FLOOR(1 + (RAND() * 100000)),
			CURRENT_TIMESTAMP,
			CURRENT_TIMESTAMP
	FROM orders;

SELECT id, name FROM products;
SELECT id, name FROM catalogs;
SELECT 
	id,
	name,
	(SELECT name FROM catalogs c WHERE c.id = p.catalog_id) AS category
FROM 
	products p;
	
SELECT * FROM orders_products;

SELECT 
	op.id,
	p.name,
	(SELECT name FROM catalogs c WHERE p.catalog_id = c.id)	AS category
FROM 
	orders_products op 
LEFT JOIN
	products p
ON 
	op.product_id = p.id;
	
-- 3

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fromCity VARCHAR(255),
	toCity VARCHAR(255)
);

INSERT INTO flights VALUES
	(NULL,'PRAGUE','MOSCOW'),
	(NULL,'MOSCOW','PRAGUE'),
	(NULL,'BERLIN','MADRID'),
	(NULL,'MADRID','LONDON');
	
SELECT * FROM flights;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(255),
	name VARCHAR(255)
);

INSERT INTO cities VALUES
	('PRAGUE','œ–¿√¿'),
	('MOSCOW','ÃŒ— ¬¿'),
	('BERLIN','¡≈–À»Õ'),
	('LONDON','ÀŒÕƒŒÕ'),
	('MADRID','Ã¿ƒ–»ƒ');
	
SELECT * FROM cities;
SELECT name FROM cities;

SELECT 
	(SELECT name FROM cities c WHERE f.fromCity = c.label) AS fromCity,
	(SELECT name FROM cities c WHERE f.toCity = c.label) AS toCity
FROM 
	flights f;