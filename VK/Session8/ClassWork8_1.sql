USE vk;

SELECT 
	u.first_name , u.last_name, u.email, p.gender, p.birthday, p.city 
FROM 
	users u 
JOIN 
	profiles p 
ON 
	u.id = p.user_id
WHERE
	u.id = 10;

SELECT 
	m.id, u.first_name, u.last_name, m.user_id, m.filename, m.created_at 
FROM 
	media m
JOIN
	users u
ON
	m.user_id = u.id
WHERE
	m.user_id = 23 AND m.media_type_id = 3;
	
DESC media;
SELECT * FROM media_types mt;

SELECT 
	m.id, u.first_name, u.last_name, m.user_id, m.filename, m.created_at 
	FROM 
		media m
	JOIN
		users u
		ON
			m.user_id = u.id
	JOIN 
		media_types mt
		ON
			m.media_type_id = mt.id
	WHERE
		m.user_id = 23 AND mt.name = 'image';

SELECT DISTINCT m.id, m.user_id, m.filename, m.created_at 
	FROM 
		media m 
	JOIN
		friendship f 
		ON 
			m.user_id = f.user_id 
			OR
			m.user_id =f.friend_id 
	JOIN 
		users u 
		ON
			u.id = f.friend_id 
			OR 
			u.id = f.user_id
	WHERE 
	 u.id = 10 AND m.user_id != 10;
	
SELECT * FROM friendship f WHERE f.user_id = 10 OR f.friend_id = 10;
SELECT * FROM media m2 WHERE m2.user_id = 16;

SELECT m.body, u.first_name, u.last_name, m.created_at
	FROM messages m 
	JOIN users u 
		ON u.id = m.from_user_id
	WHERE m.from_user_id = 47;
		
SELECT m.body, u.first_name, u.last_name, m.created_at
	FROM messages m 
	JOIN users u 
		ON u.id = m.from_user_id
	WHERE m.to_user_id = 50;
	
SELECT m.body, u.first_name, u.last_name, m.created_at
	FROM messages m 
	JOIN users u 
		ON u.id = m.from_user_id
			OR u.id = m.from_user_id 
	WHERE u.id = 1;

SELECT u.id, u.first_name, u.last_name, COUNT(f2.created_at) AS total_friends
	FROM users u
		LEFT JOIN friendship f2 
		ON u.id = f2.user_id 
			OR u.id = f2.friend_id
	GROUP BY u.id
	ORDER BY total_friends DESC 
	LIMIT 100;

SELECT 
	l.target_id,
	m.filename,
	tt.name AS target_type,
	COUNT(DISTINCT(l.id)) AS total_likes,
	CONCAT(first_name, ' ', last_name) AS owner
FROM 
	media m
	LEFT JOIN likes l
		ON m.id = l.target_id 
	LEFT JOIN target_types tt
		ON l.target_type_id = tt.id
	LEFT JOIN users u
		ON u.id = m.user_id 
	WHERE u.id = 97 AND tt.name = 'media'
	GROUP BY m.id;

SELECT 
	u.id,
	u.first_name,
	u.last_name,
	COUNT(tt.id) AS total_likes
FROM 
	users u
	LEFT JOIN media m
		ON u.id = m.user_id
	LEFT JOIN likes l
		ON m.id = l.target_id 
	LEFT JOIN target_types tt
		ON l.target_type_id = tt.id
		AND tt.name = 'media'
GROUP BY 
	u.id 
ORDER BY 
	total_likes DESC
LIMIT 10;

