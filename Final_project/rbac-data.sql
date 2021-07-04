# ********INSERTS********

INSERT INTO operations (`name`) VALUES 
	('View'), ('Delete'), ('Edit'),
	('Refresh'), ('Add');

INSERT INTO resources (`name`) VALUES
('Grade'), ('Page'), ('Course'), ('Assignment');

INSERT INTO permissions (`name`, operation_id, resource_id) VALUES
	('Refresh Page',4,2), ('View Grade',1,1), ('View Assignment',1,4), ('View Course',1,3),
	('Add Page',5,2), ('Add Assignment',5,4), ('Add Course',5,3), ('Edit Grade',3,1), ('Edit Page',3,2),
    ('Edit Assignment',3,4), ('Delete Page',2,2), ('Delete Course',2,3), ('Delete Assignment',2,4);
    
INSERT INTO roles (`name`) VALUES ('Guest');
INSERT INTO roles (`name`,inherit_from) VALUES 
	('Student', 1),('Grader', null),
    ('Teaching Assistant', null),
    ('Lecturer', 4), ('Admin', 5);

INSERT INTO subjects (email, first_name, last_name, phone_number) VALUES
	('guypago@outlook.com', 'guy', 'taggar', '0525797341'),
    ('shubidub12@yahoo.com', 'yaron', 'malka', '0551416875');
    
INSERT INTO subjects (email, first_name, last_name) VALUES
	('eliking@gmail.com', 'eli', 'sharon'),
    ('dandan365@gmail.com', 'dani', 'amos'),
    ('swifternol@walla.co.il', 'oded', 'tzarom'),
    ('oraneds34@gmail.com', 'shahar', 'amar'),
	('planetarious@gmail.com', 'ohad', 'bahar'),
    ('eran_levi326.com', 'eran', 'levi'),
	('mormore21@gmail.com', 'mor', 'dagan'),
    ('godofwarzone@outlook.com', 'ben', 'agamim');
    
INSERT INTO role_permission VALUES 
	(1,1), (2,2), (2,3), (2,4), (3,8),
    (4,6), (4,10), (4,13), (6,5),
    (6,7), (6,9), (6,11), (6,12);

INSERT INTO subject_role (subject_id, role_id) VALUES
	(1, 6),
    (2, 1),
    (3, 2);
INSERT INTO subject_role (subject_id, role_id, start_date, end_date) VALUES
(5, 5, '2018-06-18 10:34:09', '2021-06-18 10:34:09'),
(4, 3, '2017-11-04 16:01:52', '2019-11-04 16:01:52'),
(7, 2, null, '2021-08-31 10:34:09'),
(8, 2, '2016-02-05 16:01:52', null),
(9, 2, null, '2015-08-31 10:34:09'),
(10, 2, '2024-02-05 16:01:52', null);


# ********Queries********

#  ****2.4.1****
SELECT 
    s.subject_id AS `Subject Id`,
    CONCAT(s.first_name, ' ', s.last_name) AS `Subject Name`,
    p.permission_id AS `Permission Id`,
    p.`name` AS `Permission Name`
FROM
    subjects AS s
        LEFT JOIN
    subject_role AS sr ON sr.subject_id = s.subject_id
        LEFT JOIN
    roles AS r ON r.role_id = sr.role_id
        LEFT JOIN
    role_permission AS rp ON rp.role_id = r.role_id
        LEFT JOIN
    permissions AS p ON p.permission_id = rp.permission_id
ORDER BY `Subject Name` ASC;


#  ****2.4.2****
SELECT 
    s.subject_id AS `Subject Id`,
    CONCAT(s.first_name, ' ', s.last_name) AS `Subject Name`,
    p.permission_id AS `Permission Id`,
    p.`name` AS `Permission Name`
FROM
    subjects AS s
        LEFT JOIN
    subject_role AS sr ON sr.subject_id = s.subject_id
        LEFT JOIN
    roles AS r ON r.role_id = sr.role_id
        LEFT JOIN
    roles AS r2 ON r2.role_id = r.inherit_from
        LEFT JOIN
    roles AS r3 ON r3.role_id = r2.inherit_from
        LEFT JOIN
    role_permission AS rp ON rp.role_id = r3.role_id
        OR rp.role_id = r2.role_id
        OR rp.role_id = r.role_id
        LEFT JOIN
    permissions AS p ON p.permission_id = rp.permission_id
ORDER BY `Subject Name` ASC;


#  ****2.4.3****
SELECT 
    s.subject_id AS `Subject Id`,
    CONCAT(s.first_name, ' ', s.last_name) AS `Subject Name`,
    p.permission_id AS `Permission Id`,
    p.`name` AS `Permission Name`
FROM
    subjects AS s
        LEFT JOIN
    subject_role AS sr ON sr.subject_id = s.subject_id
        LEFT JOIN
    roles AS r ON r.role_id = sr.role_id
        AND ((CURRENT_TIMESTAMP() BETWEEN start_date AND end_date)
        OR (start_date IS NULL
        AND CURRENT_TIMESTAMP() <= end_date)
        OR (CURRENT_TIMESTAMP() >= start_date
        AND end_date IS NULL)
        OR (start_date IS NULL AND end_date IS NULL))
        LEFT JOIN
    roles AS r2 ON r2.role_id = r.inherit_from
        LEFT JOIN
    roles AS r3 ON r3.role_id = r2.inherit_from
        LEFT JOIN
    role_permission AS rp ON rp.role_id = r3.role_id
        OR rp.role_id = r2.role_id
        OR rp.role_id = r.role_id
        LEFT JOIN
    permissions AS p ON p.permission_id = rp.permission_id
ORDER BY `Subject Name` ASC;

