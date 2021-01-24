-- 1

SELECT * FROM communities;
DESC posts;

INSERT INTO posts
	SELECT
		id,
		FLOOR(1 + (RAND() * 100)),
		FLOOR(1 + (RAND() * 100)),
		NULL,
		'TEST',
		FLOOR(1+ (RAND() * 100)),
		TRUE,
		FALSE,
		CURRENT_TIMESTAMP,
		CURRENT_TIMESTAMP
	FROM messages;
	
SELECT * FROM posts;

-- 2

ALTER TABLE profiles 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE profiles 
	ADD CONSTRAINT profiles_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id)
	ON DELETE CASCADE,
	ADD CONSTRAINT profiles_photo_id_fk
	FOREIGN KEY (photo_id) REFERENCES media(id)
	ON DELETE SET NULL;
-- ON DELETE RESTRICT

DESC messages;
ALTER TABLE messages
MODIFY from_user_id BIGINT 	UNSIGNED NOT NULL,
MODIFY to_user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_to_user_id_fk
	FOREIGN KEY (to_user_id) REFERENCES users(id);

-- COMMUNITIES_USERS FOREIGN KEYS

DESC users;
DESC communities;
DESC communities_users;

ALTER TABLE communities_users 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE communities_users 
	ADD CONSTRAINT communities_users_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT communities_users_community_id_fk
	FOREIGN KEY (community_id) REFERENCES communities(id);
	
-- LIKED_OBJECTS FOREIGN KEYS

DESC objects;
DESC liked_objects;

ALTER TABLE liked_objects 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE liked_objects 
	ADD CONSTRAINT liked_objects_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT liked_objects_object_id_fk
	FOREIGN KEY (object_id) REFERENCES objects(id);
	
-- COMMENT_OBJECTS FOREIGN KEYS
DESC comment_objects;

ALTER TABLE comment_objects 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE comment_objects 
	ADD CONSTRAINT comment_objects_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT comment_objects_object_id_fk
	FOREIGN KEY (object_id) REFERENCES objects(id);

-- MEDIA FOREIGN KEYS

DESC media;
DESC media_types;

ALTER TABLE media 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE media 
	ADD CONSTRAINT media_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT media_object_id_fk
	FOREIGN KEY (object_id) REFERENCES objects(id),
	ADD CONSTRAINT media_media_type_id_fk
	FOREIGN KEY (media_type_id) REFERENCES media_types(id);
	
-- TAG FOREIGN KEYS

DESC tags;
DESC tag_objects;

SELECT * FROM tags;

ALTER TABLE tag_objects
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE tag_objects 
	ADD CONSTRAINT tag_objects_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT tag_objects_object_id_fk
	FOREIGN KEY (object_id) REFERENCES objects(id);

ALTER TABLE tag_objects 
	ADD CONSTRAINT tag_objects_tag_id_fk
	FOREIGN KEY (tag_id) REFERENCES tags(id);
	
-- PROFILES FOREIGN KEYS

DESC profiles;
DESC user_statuses;
SELECT * FROM profiles;
ALTER TABLE profiles 
MODIFY user_statuses_id INT UNSIGNED;

ALTER TABLE profiles 
	ADD CONSTRAINT profiles_user_statuses_fk
	FOREIGN KEY (user_statuses_id) REFERENCES user_statuses(id)
	ON DELETE SET NULL;
	
-- FRIENDSHIP_STATUSES

DESC friendship;
DESC friendship_statuses;

ALTER TABLE friendship 
MODIFY user_id BIGINT UNSIGNED NOT NULL,
MODIFY friend_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE friendship 
	ADD CONSTRAINT friendship_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT friendship_friend_id_fk
	FOREIGN KEY (friend_id) REFERENCES users(id),
	ADD CONSTRAINT friendship_status_id_fk
	FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
	


SELECT * FROM followers;
SELECT * FROM followings;

DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS followings;

-- FOREING KEYS LIKES POSTS

DESC likes;
DESC target_types;
DESC posts;

ALTER TABLE likes 
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE likes 
	ADD CONSTRAINT likes_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT likes_target_type_id_fk
	FOREIGN KEY (target_type_id) REFERENCES target_types(id);
	
ALTER TABLE posts
MODIFY user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE posts 
	ADD CONSTRAINT posts_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT posts_community_id_fk
	FOREIGN KEY (community_id) REFERENCES communities(id);
	
-- 3

-- 3.1 OPTION
SELECT 
	COUNT(*) AS likes
FROM 
	likes
GROUP BY 
	(SELECT gender  FROM profiles WHERE profiles.user_id = likes.user_id);

-- 3.2 OPTION

SELECT 
	COUNT((SELECT gender FROM profiles WHERE profiles.user_id = l.user_id AND profiles.gender = 'f')) AS female,
	COUNT((SELECT gender FROM profiles WHERE profiles.user_id = l.user_id AND profiles.gender = 'm')) AS male
FROM 
	likes l;

-- 4

SELECT 
	COUNT(id) AS likes,
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = user_id) as fullname,
	(SELECT YEAR(CURDATE()) - YEAR(birthday) AS age FROM profiles WHERE profiles.user_id = l.user_id) AS age	
FROM 
	likes l
GROUP BY 
	user_id
ORDER BY 
	age LIMIT 10;
	
-- 5

 