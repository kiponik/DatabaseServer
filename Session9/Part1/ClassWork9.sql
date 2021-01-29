CREATE TABLE accounts(
	id SERIAL PRIMARY KEY,
	user_id INT,
	total DECIMAL(11, 2) COMMENT '—чет',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '—чета пользователей и интернет магазина';

INSERT INTO accounts (user_id, total) VALUES
	(4, 5000.00),
	(3, 0.00),
	(2, 200.00),
	(NULL, 25000.00);
	
SELECT * FROM accounts;
SELECT id, user_id, total FROM accounts;

START TRANSACTION;

SELECT total FROM accounts WHERE user_id = 4;

UPDATE accounts SET total = total - 2000 WHERE user_id = 4;

UPDATE accounts SET total = total + 2000 WHERE user_id IS NULL;

SELECT * FROM accounts;

COMMIT;

START TRANSACTION;

SELECT total FROM accounts WHERE user_id = 4;

UPDATE accounts SET total = total - 2000 WHERE user_id = 4;

UPDATE accounts SET total = total + 2000 WHERE user_id IS NULL;

ROLLBACK;

START TRANSACTION;

SELECT total FROM accounts WHERE user_id = 4;

SAVEPOINT accounts_4;

UPDATE accounts SET total = total - 2000 WHERE user_id = 4;

ROLLBACK TO SAVEPOINT accounts_4;

ROLLBACK;

SHOW VARIABLES LIKE 'innodb_log_%';
SHOW VARIABLES LIKE 'datadir';
SHOW VARIABLES LIKE 'innodb_flush_log_at_trx_commit';
SET GLOBAL innodb_flush_log_at_trx_commit = 0;

SELECT @total := COUNT(*) FROM products;

SELECT @total;

SELECT @price := MAX(price) FROM products;

SELECT * FROM products WHERE price = @price;

SELECT * FROM products WHERE price = @price \G;

SELECT @id := id FROM products;

SELECT @id, @ID;

SET @last = NOW() - INTERVAL 7 DAY;

SELECT CURDATE(), @last;

SELECT * FROM tbl;

SHOW VARIABLES LIKE 'read_buffer_size';

SET GLOBAL read_buffer_size = 2097152;

SET @@global.read_buffer_size = 2087152;

SET SESSION read_buffer_size = 2097152;

CREATE TEMPORARY TABLE temp (id INT, name VARCHAR(255));

SHOW TABLES;

DESCRIBE temp;

PREPARE ver FROM 'SELECT VERSION()';

EXECUTE ver;

PREPARE prd FROM 'SELECT id, name, price FROM products WHERE catalog_id = ?';
SET @catalog_id = 1;

EXECUTE prd USING @catalog_id;

DROP PREPARE prd;
DROP PREPARE ver;

SELECT * FROM catalogs;
DROP TABLE IF EXISTS cats;
CREATE VIEW cat AS SELECT * FROM catalogs ORDER BY name;

SELECT * FROM cat;

CREATE VIEW cat_reverse (catalog, catalog_id)
AS SELECT name, id FROM catalogs;

SELECT * FROM cat_reverse;

CREATE OR REPLACE VIEW namecat (id, name, total)
AS SELECT id, name, LENGTH(name) FROM catalogs;

SELECT * FROM namecat ORDER BY total DESC;

CREATE ALGORITHM = TEMPTABLE VIEW cat2 AS SELECT * FROM catalogs;

DESCRIBE products;

CREATE OR REPLACE VIEW prod AS
SELECT id, name, price, catalog_id
FROM products
ORDER BY catalog_id, name;

SELECT * FROM prod;

SELECT * FROM prod ORDER BY name DESC;

SELECT id, name, price, catalog_id FROM products;

CREATE OR REPLACE VIEW processors AS
SELECT id, name, price, catalog_id
FROM products
WHERE catalog_id = 1;

SELECT * FROM processors;

SELECT * FROM tbl;

CREATE VIEW v1 AS
SELECT * FROM tbl WHERE id < 6
WITH CHECK OPTION;

INSERT INTO v1 VALUES (6,NULL);

ALTER VIEW v1 AS
SELECT * FROM tbl WHERE id > 5
WITH CHECK OPTION;

CREATE OR REPLACE VIEW v1 AS
SELECT * FROM tbl WHERE id > 5
WITH CHECK OPTION;

DROP VIEW IF EXISTS cat, cat_reverse, namecat, prod, processors, v1;

