-- 1

CREATE USER shop;
CREATE USER shop_read;
SELECT Host, User FROM mysql.user;

GRANT SELECT ON shop.* TO shop_read;
GRANT ALL ON shop.* TO shop;

-- 2

CREATE TABLE account(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	password VARCHAR(255)
);

CREATE OR REPLACE VIEW username AS
SELECT id, name
FROM account;

CREATE USER user_read;
REVOKE ALL ON shop.account TO user_read;
GRANT SELECT ON shop.username TO user_read;