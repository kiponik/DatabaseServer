SHOW VARIABLES LIKE 'date%_format';
SHOW VARIABLES LIKE 'time%_format';
SHOW VARIABLES LIKE 'system_time_zone';
SHOW VARIABLES LIKE 'tx_isolation';
SHOW VARIABLES LIKE 'tmp_table_size';
SET SESSION tmp_table_size = 16777216;
SET GLOBAL tmp_table_size = 16777216;

SHOW VARIABLES LIKE 'auto_increment_increment';
SELECT * FROM catalogs;

SET SESSION auto_increment_increment = 1;

INSERT INTO catalogs(name) VALUES ('Оперативная память');
INSERT INTO catalogs(name) VALUES ('Блоки Питания');

SHOW VARIABLES LIKE 'log_error';
SHOW VARIABLES LIKE 'general_log%';
SHOW VARIABLES LIKE 'slow_query_log%';
SHOW VARIABLES LIKE 'long_query_log%';

SELECT BENCHMARK(100000000, (SELECT COUNT(*) FROM products));

SELECT * FROM mysql.general_log gl;
SELECT * FROM mysql.slow_log;
SHOW VARIABLES LIKE 'log_output';
SHOW VARIABLES LIKE 'log_bin';
SHOW VARIABLES LIKE 'max_connections';
SHOW PROCESSLIST;

CREATE USER foo;
CREATE USER shop IDENTIFIED WITH sha256_password BY 'pass';
SELECT USER();

SELECT Host, User FROM mysql.user;
DROP USER foo;

RENAME USER shop TO foo;
GRANT ALL ON *.* TO 'foo'@'%';
REVOKE ALL ON *.* FROM 'foo'@'%';

GRANT SELECT, INSERT, DELETE, UPDATE ON *.* TO foo;
GRANT ALL ON *.* TO foo;
GRANT GRANT OPTION ON *.* TO foo;
GRANT USAGE, SELECT ON *.* TO foo;

SHOW GRANTS;

GRANT ALL ON shop.* TO 'foo'@'localhost'
WITH 
	MAX_CONNECTIONS_PER_HOUR 10
	MAX_QUERIES_PER_HOUR 1000
	MAX_UPDATES_PER_HOUR 200
	MAX_USER_CONNECTIONS 3;