SELECT * FROM users WHERE id = 7;

SELECT 
	first_name,
	last_name,
	(SELECT city FROM profiles WHERE profiles.user_id = users.id) AS city,
	(SELECT filename FROM media WHERE id = 
		(SELECT photo_id FROM profiles WHERE profiles.user_id = users.id)
	) AS photo
FROM 
	users
WHERE
	id = 7;
	
SELECT filename
FROM media
	WHERE user_id = 5
		AND media_type_id = (
			SELECT id FROM media_types WHERE name = 'image'
		);
		
SELECT CONCAT(
	'Пользователь',
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = media.user_id),
	' добавил фото ',
	filename, ' ',
	created_at) AS news
FROM media
WHERE user_id = 5 AND media_type_id = (
	SELECT id FROM media_types WHERE name = 'image'
	);

SELECT user_id, filename, size 
FROM media 
ORDER BY size DESC 
LIMIT 10;

SELECT 
	(SELECT CONCAT(first_name, ' ', last_name) FROM users u WHERE u.id = m.user_id) AS owner,
	filename,
 	size 
FROM media m
ORDER BY size DESC 
LIMIT 10;

DESC friendship;

SELECT friend_id FROM friendship WHERE user_id =1
UNION
SELECT user_id FROM friendship WHERE friend_id = 1;

SELECT * FROM friendship_statuses fs;

SELECT filename FROM media WHERE user_id IN (
	(SELECT friend_id
	FROM friendship
		WHERE user_id = 1 AND status_id = (
			SELECT id FROM friendship_statuses WHERE name = 'confirmed' 
		)
	)
	UNION 
	(SELECT user_id
	FROM friendship
		WHERE friend_id = 1 AND status_id = (
			SELECT id FROM friendship_statuses WHERE name = 'confirmed'
		)
	)
);

SELECT user_id, SUM(size) AS total
	FROM media
	GROUP BY user_id WITH ROLLUP
	HAVING total > 100000000;
	
SELECT CONCAT(first_name, ' ', last_name) AS fullname
FROM users 
WHERE first_name LIKE 'M%';

SELECT CONCAT(first_name, ' ', last_name) AS fullname
FROM users 
WHERE last_name RLIKE '^R.*r$';