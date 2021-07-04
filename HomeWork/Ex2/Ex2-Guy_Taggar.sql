use exercise2;

CREATE TABLE `left` (
	name VARCHAR(20)
);

INSERT INTO `left` (`name`) VALUES ('Apple');
INSERT INTO `left` (`name`) VALUES ('Banana');
INSERT INTO `left` (`name`) VALUES ('Cherry');

CREATE TABLE `right` (
    name VARCHAR(20)
);
 
INSERT INTO `right` (`name`) VALUES ('Banana');
INSERT INTO `right` (`name`) VALUES ('Cherry');
INSERT INTO `right` (`name`) VALUES ('Durian');


#********Q1********

SELECT * from `left` JOIN `right`
ON `left`.`name` = `right`.`name`;

#********Q2********

select * from `left` LEFT JOIN `right`
ON `left`.`name` = `right`.`name`;

#********Q3********

SELECT 
    *
FROM
    `left`
        LEFT JOIN
    `right` ON `left`.`name` = `right`.`name` 
UNION SELECT 
    *
FROM
    `left`
        RIGHT JOIN
    `right` ON `left`.`name` = `right`.`name`;

#********Q4********

