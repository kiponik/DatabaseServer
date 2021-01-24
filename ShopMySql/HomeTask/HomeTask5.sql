-- 1.1 

-- Update of created_at triggers an update on the column "updated_at"
UPDATE users SET created_at = CURRENT_TIMESTAMP;

-- 1.2

-- Table creation with created_at and updated_at of VARCHAR TYPE 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
);

-- ADDING VALUES
INSERT INTO users (name, birthday_at) VALUES
 	 ('Геннадий','1990-10-05'),
	('Наталья','1984-11-12'),
	('Александр','1985-05-20'),
	('Сергей','1988-02-14'),
	('Иван','1998-01-12'),
	('Мария','1992-08-29');
 
-- CHECK THE TABLE
SELECT * FROM users;

-- RESOLUTION:
-- CREATING NEW COLUMNS
ALTER TABLE users ADD COLUMN created_at_new DATETIME;
ALTER TABLE users ADD COLUMN updated_at_new DATETIME;

-- UPDATING NEW COLUMNS BY A SPECIFIC COMMAND
UPDATE users SET created_at_new = str_to_date(created_at, '%d.%m.%Y %H:%i');
UPDATE users SET updated_at_new = str_to_date(updated_at, '%d.%m.%Y %H:%i');

-- REMOVING INCORRECT COLUMNS FROM THE TABLE
ALTER TABLE	users 
DROP COLUMN created_at, 
DROP COLUMN updated_at;

-- RENAMING THE CORRECT COLUMNS
ALTER TABLE users 
RENAME COLUMN created_at_new TO created_at,
RENAME COLUMN updated_at_new TO updated_at;

-- CHECK
SELECT * FROM users;

-- 1.3

-- ADDING VALUES
INSERT INTO storehouses_products
	(storehouse_id, product_id, value)
VALUES
	(1, 1, 0),
	(1, 2, 5),
	(1, 3, 2),
	(2, 1, 4),
	(2, 2, 0),
	(2, 3, 1);
	
-- CHECK
SELECT * FROM storehouses_products;

-- REQUESTED CHECK
SELECT 
	value 
FROM 
	storehouses_products 
ORDER BY 
	value != 0 DESC, value;

-- 1.4

-- ADDING NEW VALUES
INSERT INTO users (name, birthday_at) VALUES
 	('Геннадий','1990-10-05'),
	('Наталья','1984-11-12'),
	('Александр','1985-05-20'),
	('Сергей','1988-02-14'),
	('Иван','1998-01-12'),
	('Мария','1992-08-29');
	
-- CHECK
SELECT name, birthday_at FROM users;

-- SORT
SELECT 
	GROUP_CONCAT(name) AS names,
	SUBSTRING(birthday_at, 6, 2) AS months
FROM 
	users
GROUP BY
	months
HAVING
	months = 05 OR months = 08;

-- 1.5
-- CHECK
SELECT * FROM catalogs;

-- SORT
SELECT 
	id 
FROM 
	catalogs 
WHERE 
	id IN (5, 1, 2) 
ORDER BY 
	id = 5 DESC, id;
	
-- 2.1

SELECT * FROM users;

-- FILTER
SELECT 
	AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25)) AS age
FROM 
	users;
	
-- 2.2

DESC users;
SELECT * FROM users;

-- BIRTHDAY THIS YEAR
SELECT 
	birthday_at + INTERVAL (YEAR(NOW()) - YEAR(birthday_at)) YEAR
FROM 
	users;

-- FILTER BY DAY OF THE WEEK
-- STARTS FROM SUNDAY AS 1
SELECT
	DAYOFWEEK(DATE(birthday_at + INTERVAL (YEAR(NOW()) - YEAR(birthday_at)) YEAR)) AS dayOfTheWeek,
	COUNT(*)
FROM 
	users
GROUP BY 
	dayOfTheWeek
ORDER BY
	dayOfTheWeek;
	
-- 2.3

-- CHECK
SELECT * FROM storehouses_products;

-- COMBINATION OF ROUND, EXP, SUM AND LOG
SELECT 
	ROUND(EXP(SUM(LOG(id))),1)
FROM 
	storehouses_products;