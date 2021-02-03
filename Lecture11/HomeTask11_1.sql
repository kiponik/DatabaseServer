-- 1

DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	itemID BIGINT UNSIGNED,
	tableType VARCHAR(255),
	name VARCHAR(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP 
) ENGINE = Archive;

DROP TRIGGER IF EXISTS check_user_insert;

DELIMITER //

CREATE TRIGGER check_user_insert BEFORE INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (itemID, tableType, name) 
	VALUES (id, 'users', NEW.name);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER check_user_catalogs BEFORE INSERT ON catalogs
FOR EACH ROW BEGIN
	INSERT INTO logs (itemID, tableType, name) 
	VALUES (id, 'catalogs', NEW.name);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER check_user_products BEFORE INSERT ON products
FOR EACH ROW BEGIN
	INSERT INTO logs (itemID, tableType, name) 
	VALUES (id, 'products', NEW.name);
END//

DELIMITER ;

SHOW TRIGGERS;

DESC users;
SELECT * FROM logs;
SELECT * FROM users;

INSERT INTO users (name) VALUES
	('Jon');
INSERT INTO users (name) VALUES
	('Bob');
	

-- 2

DELIMITER //

DESC users;
INSERT INTO users VALUE ();
CREATE PROCEDURE generate_date()
BEGIN
	DECLARE i INT DEFAULT 0;
	WHILE i < 1000000 DO
		INSERT INTO users VALUES ();
		SET i = i + 1;
	END WHILE;
END//

DELIMITER ;