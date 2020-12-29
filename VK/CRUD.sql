SELECT * FROM users LIMIT 10;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;

DESC profiles;
SELECT * FROM profiles;
UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at;
UPDATE profiles SET photo_id = 1 +FLOOR(RAND()*100);

CREATE TEMPORARY TABLE genders(name CHAR(1));
INSERT INTO genders VALUES ('m'),('f');
SELECT name FROM genders ORDER BY RAND() LIMIT 1;
UPDATE profiles SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);
UPDATE profiles SET user_statuses_id = 1 + FLOOR(RAND()*2);

DESC messages;
SELECT * FROM messages;
UPDATE messages SET from_user_id = 1 + FLOOR(RAND()*100),
					to_user_id = 1 + FLOOR(RAND()*100);
UPDATE messages SET updated_at = NOW() WHERE updated_at < created_at;

DESC media_types;
SELECT * FROM media_types;
DELETE FROM media_types;
INSERT INTO media_types (name) VALUES ('audio'),('video'),('image');
TRUNCATE media_types;

DESC media;
SELECT * FROM media;
UPDATE media SET media_type_id = 1 +FLOOR(RAND()*3);
UPDATE media SET user_id = 1 +FLOOR(RAND()*100);
UPDATE media SET size = 100000 +FLOOR(RAND()*1000000) WHERE `size` < 100000;

-- {"owner":"NameSurname"}
UPDATE media SET metadata = CONCAT('{"owner":"',
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
	'"}');
ALTER TABLE media MODIFY COLUMN metadata JSON;

CREATE TEMPORARY TABLE extensions(name VARCHAR(40));
INSERT INTO extensions VALUES ('jpg'),('avi'),('png'),('mp4');
SELECT name FROM extensions ORDER BY RAND() LIMIT 1;

UPDATE media SET filename = CONCAT('https://dropbox.net/vk/',filename,'.',(SELECT name FROM extensions ORDER BY RAND() LIMIT 1));

SELECT * FROM friendship;
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses;
INSERT INTO friendship_statuses (name) VALUES ('confirmed'),('rejected'),('requested');
UPDATE friendship SET status_id = 1 + FLOOR(RAND()*3);
UPDATE friendship SET user_id = 1 + FLOOR(RAND()*100),
					  friend_id  = 1 + FLOOR(RAND()*100);
DESC friendship;

SELECT * FROM communities;
-- DELETE FROM communities WHERE id > 25;

SELECT * FROM communities_users;
-- UPDATE friendship SET user_id = 1 + FLOOR(RAND()*100),
-- friend_id  = 1 + FLOOR(RAND()*100);

-- Начало домашней работы:

SELECT * FROM followers;
UPDATE followers SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM followings;
UPDATE followings SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM objects;
UPDATE objects SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM tags;
UPDATE tags SET updated_at = NOW() WHERE updated_at < created_at;

SELECT * FROM tag_objects;
UPDATE tag_objects SET created_at =  (SELECT created_at FROM objects WHERE id = object_id);

SELECT * FROM liked_objects;
UPDATE liked_objects SET object_id = 1 + FLOOR(RAND()*100),
						 user_id = 1 + FLOOR(RAND()*100);
						 
SELECT * FROM comment_objects;
UPDATE comment_objects SET user_id = 1 + FLOOR(RAND()*100);
UPDATE comment_objects SET updated_at = NOW() WHERE updated_at < created_at;


