DESC profiles;
DESC users;

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