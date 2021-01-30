SELECT * FROM catalogs;

CREATE TABLE rubrics (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название раздела'
	) COMMENT = 'Разделы интернет-магазина';
	
INSERT INTO rubrics VALUES
	(NULL, 'Видеокарты'),
	(NULL, 'Память');
	
SELECT * FROM catalogs 
UNION
SELECT * FROM rubrics;

SELECT * FROM catalogs 
UNION ALL
SELECT * FROM rubrics;

SELECT name FROM catalogs c
UNION ALL
SELECT name FROM rubrics 
ORDER BY name;

SELECT name FROM catalogs c
UNION ALL
SELECT name FROM rubrics 
ORDER BY name DESC;

SELECT name FROM catalogs c
UNION ALL
SELECT name FROM rubrics 
ORDER BY name DESC
LIMIT 2;

(SELECT name FROM catalogs c 
ORDER BY name DESC 
LIMIT 2)
UNION ALL
(SELECT name FROM rubrics
ORDER BY name DESC
LIMIT 2);

SELECT * FROM catalogs c2 
UNION
SELECT id, name FROM products p2;

SELECT id FROM catalogs WHERE name = 'Процессоры';

SELECT 
	id, name, catalog_id
FROM 
	products
WHERE
	catalog_id = (SELECT id FROM catalogs WHERE name = 'Процессоры');
	
SELECT MAX(price) FROM products;

SELECT 
	id, name, catalog_id
FROM 
	products
WHERE
	price = (SELECT MAX(price) FROM products);
	
SELECT 
	id, name, catalog_id
FROM 
	products
WHERE
	price < (SELECT AVG(price) FROM products);
	
SELECT 
	id,
	name,
	(SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog'
FROM 
	products;
	
SELECT 
	products.id,
	products.name,
	(SELECT
		catalogs.name 
	FROM 
		catalogs
	WHERE
		catalogs.id = products.catalog_id) AS 'catalog'
FROM 
	products;
	
SELECT 
	id, name, catalog_id
FROM 
	products
WHERE
	catalog_id IN (SELECT id FROM catalogs);
	
SELECT 
	id, name, price, catalog_id
FROM 
	products
WHERE
	catalog_id = 2 AND 
	price < ANY (SELECT price FROM products WHERE catalog_id = 1);
	
SELECT 
	id, name, price, catalog_id
FROM 
	products
ORDER BY
	catalog_id, price;
	
SELECT 
	id, name, price, catalog_id
FROM 
	products
WHERE
	catalog_id = 2 AND 
	price < SOME (SELECT price FROM products WHERE catalog_id = 1);
	
SELECT 
	id, name, price, catalog_id
FROM 
	products
WHERE
	catalog_id = 2 AND 
	price > ALL (SELECT price FROM products WHERE catalog_id = 1);
	
SELECT * FROM catalogs
WHERE EXISTS (SELECT * FROM products WHERE catalog_id = catalogs.id);

SELECT * FROM catalogs
WHERE EXISTS (SELECT 1 FROM products WHERE catalog_id = catalogs.id);

SELECT * FROM catalogs
WHERE NOT EXISTS (SELECT 1 FROM products WHERE catalog_id = catalogs.id);

SELECT id, name, price, catalog_id FROM products
WHERE (catalog_id, 5060.00) IN (SELECT id, price FROM catalogs);

SELECT id, name, price, catalog_id FROM products WHERE catalog_id = 1;

SELECT 
	AVG(price)
FROM 
	(SELECT * FROM products WHERE catalog_id = 1) AS prod;
	
SELECT AVG(price)
FROM products
WHERE catalog_id = 1;

SELECT catalog_id, MIN(price)
FROM products
GROUP BY catalog_id;

SELECT 
	AVG(price)
FROM 
	(SELECT MIN(price) AS price
	FROM products
	GROUP BY catalog_id) as prod;

SELECT 
	p.name, p.price, c.name
FROM 
	catalogs c
JOIN
	products p;
	
SELECT 
	p.name, p.price, c.name
FROM 
	catalogs c
JOIN
	products p
WHERE 
 c.id = p.catalog_id;
 
SELECT 
	p.name, p.price, c.name
FROM 
	catalogs c
JOIN
	products p
ON
 c.id = p.catalog_id;
 
SELECT
	p.name,
 	p.price,
	c.name
FROM
	catalogs c
LEFT JOIN 
	products p
ON
	c.id = p.catalog_id;
	
UPDATE 
	catalogs 
JOIN
	products 
ON
	catalogs.id = products.catalog_id
SET 
	price = price * 0.9
WHERE 
	catalogs.name = 'Материнские платы';
	
