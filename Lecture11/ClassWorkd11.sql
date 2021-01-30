CREATE TABLE catalogs2(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Name of the catalog'
) COMMENT = 'Sections of online store' ENGINE=InnoDB;


SHOW ENGINES;
SHOW VARIABLES LIKE 'Key%';
SHOW STATUS LIKE 'Key%';
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';

SELECT * FROM users;

SELECT id, name FROM users;

SELECT id, name FROM users LIMIT 2;

SELECT id, name FROM catalogs ORDER BY id;

EXPLAIN SELECT id, name FROM catalogs ORDER BY id;

EXPLAIN SELECT id, name FROM catalogs UNION ALL SELECT id, name FROM catalogs;

CREATE TABLE logs(
	
)
