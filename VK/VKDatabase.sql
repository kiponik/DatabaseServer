DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(140) NOT NULL,
	phone VARCHAR(100) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	object_id INT UNSIGNED NOT NULL COMMENT '������ ��������',
	user_id	BIGINT,
	gender CHAR(1) NOT NULL, 
	status VARCHAR(30),
	birthday DATE NOT NULL,
	city VARCHAR(60) NOT NULL,
	country VARCHAR(60) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	id	INT	UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "id ������",
	from_user_id INT UNSIGNED NOT NULL,
	to_user_id INT UNSIGNED NOT NULL,
	body TEXT NOT NULL,
	is_important BOOLEAN,
	is_delivered BOOLEAN,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship(
	user_id INT UNSIGNED NOT NULL,
	friend_id INT UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	requested_at DATETIME DEFAULT NOW(),
	confirmed_at DATETIME,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, friend_id)
);

-- ���� ��� ������ table ��� �����������. 
DROP TABLES IF EXISTS followers;
CREATE TABLE followers(
	user_id INT UNSIGNED NOT NULL,
	follower_id INT UNSIGNED NOT NULL COMMENT '��������� ������������',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, follower_id)
);

-- ���� ��� ������ table ��� ��������. 
DROP TABLE IF EXISTS followings;
CREATE TABLE followings(
	user_id INT UNSIGNED NOT NULL,
	following_id INT UNSIGNED NOT NULL COMMENT '�� ���� �������� ������������',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, following_id)
);

DROP TABLE IF EXISTS friendship_statuses;
CREATE TABLE friendship_statuses(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(150) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	object_id INT UNSIGNED OMMENT '������ ������',
	name VARCHAR(150) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS communities_users;
CREATE TABLE communities_users(
	community_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (community_id, user_id)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	object_id INT UNSIGNED NOT NULL COMMENT '������ �����',
	filename VARCHAR(255) NOT NULL,
	size INT NOT NULL,
	metadata JSON,
	media_type_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ��������� ��� �����
DROP TABLE IF EXISTS objects;
CREATE TABLE objects (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ��������� ��� ������ � ������� �� ������ � ������������
DROP TABLE IF EXISTS liked_objects;
CREATE TABLE liked_objects(
	object_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (object_id, user_id)
);

-- ��������� ��� ������������ � ������� �� ������ � ID ����������� user_ID???
DROP TABLE IF EXISTS comment_objects;
CREATE TABLE comment_objects(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	object_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id, object_id)
);

-- �������
DROP TABLE IF EXISTS tags;
CREATE TABLE tags(
	id VARCHAR(144) NOT NULL PRIMARY KEY,
	description VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ��������� ��� �������� � ������� �� ������ � ID ������� user_ID???
DROP TABLE IF EXISTS tag_objects;
CREATE TABLE tag_objects(
	object_id INT UNSIGNED NOT NULL,
	tag_id VARCHAR(144) NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (object_id, tag_id)
);



