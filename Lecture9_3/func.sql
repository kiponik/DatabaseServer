DROP FUNCTION IF EXISTS second_format;
CREATE FUNCTION second_format (seconds INT)
BEGIN
	DECLARE days, hours, minutes INT;
	
	SET days = FLOOR(seconds / 86400);
	SET seconds = seconds - days * 86400;
	SET hours = FLOOR(seconds / 3600);
	SET seconds = seconds - hours * 3600;
	SET minutes = FLOOR(seconds / 60);
	SET seconds = seconds - minutes * 60;

	RETURN CONCAT(
		days, " days ",
		hours, " hours ",
		minutes, " minutes ",
		seconds, " seconds "
		);
	
END

SELECT * FROM catalogs;

INSERT INTO catalogs VALUES (NULL, 'Мониторы');

CREATE PROCEDURE RETURHELLO() 
DECLARE i DATETIME(NOW())
CASE i WHEN 