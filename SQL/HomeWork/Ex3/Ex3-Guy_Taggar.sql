#******Q1 A *******

use sakila;

SET SQL_SAFE_UPDATES = 0;
UPDATE film 
SET 
    original_language_id = FLOOR(RAND() * (6 - 1 + 1) + 1);

SET SQL_SAFE_UPDATES = 1;


#******Q1 B *******
SELECT 
    f.title,
    l.`name` AS `language`,
    CASE
        WHEN f.original_language_id = f.language_id THEN 'Same'
        ELSE j.`name`
    END AS `original_language`
FROM
    film AS f
        INNER JOIN
    `language` AS l ON f.language_id = l.language_id
        INNER JOIN
    `language` AS j ON f.original_language_id = j.language_id
	ORDER BY f.film_id;
    
    
#****** Q2 *******

SELECT DISTINCT
    c.`name`,
    GROUP_CONCAT(DISTINCT (CONCAT(a.first_name, ' ', a.last_name))) AS actors
FROM
    category AS c
        INNER JOIN
    film_category AS fc
        INNER JOIN
    actor AS a ON fc.category_id = c.category_id
GROUP BY c.category_id;