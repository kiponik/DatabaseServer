SELECT * FROM users;
SELECT * FROM orders;

SELECT 	u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u CROSS JOIN orders o;

SELECT 	u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u, orders o;

SELECT 	u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u, orders o
WHERE u.id = o.user_id;

SELECT 	u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u JOIN orders o
WHERE u.id = o.user_id;

SELECT 	u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u JOIN orders o
ON u.id = o.user_id;

SELECT u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u INNER JOIN orders o
ON u.id = o.user_id;

SELECT u.name, COUNT(o.user_id)
FROM users u INNER JOIN orders o
ON u.id = o.user_id
GROUP BY u.name;

SELECT u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u LEFT OUTER JOIN orders o
ON u.id = o.user_id
WHERE o.id IS NULL;

SELECT u.id, u.name, u.birthday_at, o.id, o.user_id 
FROM users u RIGHT OUTER JOIN orders o
ON u.id = o.user_id;

