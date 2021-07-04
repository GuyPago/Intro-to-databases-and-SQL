use sakila;

#********Q1********

SELECT
    email
FROM
    customer
WHERE
    email LIKE '____.%r@%';

#********Q2********

SELECT 
    COUNT(`description`)
FROM
    film
WHERE
    `description` LIKE 'A_E%'
        OR `description` LIKE 'A_A%'
        OR `description` LIKE 'A_I%'
        OR `description` LIKE 'A_O%'
        OR `description` LIKE 'A_U%';
		# Number is: 447
        

#********Q3********

SELECT 
    CONCAT(MONTH(payment_date),
            '/',
            YEAR(payment_date)) AS 'Month/Year',
    AVG(amount) AS 'Average amount'
FROM
    payment
GROUP BY `Month/year`
HAVING SUM(amount) > 5000
ORDER BY AVG(amount) DESC;