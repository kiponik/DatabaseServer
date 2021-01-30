-- 1

DESC media;

CREATE INDEX filename_index ON media(filename);

DESC posts;

CREATE INDEX head_index ON posts(head);

DESC profiles;

CREATE INDEX country_index ON profiles(country);
CREATE INDEX city_index ON profiles(city);

DESC users;

CREATE INDEX phone_index ON users(phone);

-- 2 

-- Построить запрос, который будет выводить следующие столбцы: 
-- имя группы
-- среднее количество пользователей в группах 
-- самый молодой пользователь в группе 
-- самый старший пользователь в группе 
-- общее количество пользователей в группе 
-- всего пользователей в системе 
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

	SELECT DISTINCT
		c.name,
		((SELECT COUNT(DISTINCT cu2.user_id) FROM communities_users cu2) / COUNT(p.user_id) OVER()) AS 'average',
		MIN(p.birthday) OVER w AS 'youngest',
		MAX(p.birthday) OVER w AS 'oldest',
		COUNT(p.user_id) OVER w AS 'sum',
		COUNT(p.user_id) OVER() AS 'total',
		(COUNT(p.user_id) OVER w / COUNT(p.user_id) OVER()) * 100 AS 'percentage'
	FROM profiles p 
		JOIN communities_users cu 
		 	ON cu.user_id = p.user_id 
		 JOIN communities c
			ON cu.community_id = c.id 
		 	WINDOW w AS (PARTITION BY cu.community_id) ORDER BY name;