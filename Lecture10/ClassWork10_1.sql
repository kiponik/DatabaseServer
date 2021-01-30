DESC media;

SELECT media_types.name,
	SUM(media.size) AS total_by_type,
	(SELECT SUM(size) FROM media) AS total_siz,
	SUM(media.size)/(SELECT SUM(size) FROM media) * 100 AS "%%"
		FROM media
			JOIN media_types mt
				ON media.media_type_id = media_types.id
			GROUP BY media.media_type_id;
			
SELECT DISTINCT media_types.name,
 	SUM(media.size) OVER (PARTITION BY media.media_type_id) AS total_by_type,
 	SUM(media.size) OVER () AS total,
 	SUM(media.size) OVER (PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
 		FROM media
 			JOIN media_types
 				ON media.media_type_id = media_types.id;
 				
SELECT media_types.name,
 	SUM(media.size) OVER (PARTITION BY media.media_type_id) AS total_by_type,
 	SUM(media.size) OVER () AS total,
 	SUM(media.size) OVER (PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
 		FROM media
 			JOIN media_types
 				ON media.media_type_id = media_types.id;
 				
SELECT DISTINCT media_types.name,
	AVG(media.size) OVER w AS average,
 	SUM(media.size) OVER (PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
 		FROM media
 			JOIN media_types
 				ON media.media_type_id = media_types.id
 				WINDOW w AS (PARTITION BY media.media_type_id);
 				
 			
 SELECT user_id, city, birthday,
 	ROW_NUMBER() OVER w AS 'row_number',
 	FIRST_VALUE(city) OVER w AS 'first',
 	LAST_VALUE (city) OVER (PARTITION BY LEFT(birthday, 3)
 		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS 'LAST',
 	NTH_VALUE (city, 2) OVER w AS 'second'
 		FROM profiles 
 			 WINDOW w AS (PARTITION BY LEFT(birthday, 3) ORDER BY birthday );
 			 
