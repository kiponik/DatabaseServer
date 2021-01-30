-- INDEXES

SELECT * FROM users WHERE email= '';

SELECT email FROM users ORDER BY email;

CREATE INDEX users_email_idx ON users(email);
DROP INDEX users_email_idx ON users;
CREATE UNIQUE INDEX users_email_idx ON users(email);
SHOW INDEXES FROM users;

SELECT * FROM messages m WHERE m.from_user_id = 1 AND m.to_user_id = 21;
CREATE INDEX messages_from_to_user_id_idx ON messages(from_user_id,to_user_id);


