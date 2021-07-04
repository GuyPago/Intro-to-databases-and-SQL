use sakila;

# *****Q1*****
CREATE VIEW payment_total AS
    SELECT 
        customer_id, SUM(amount) AS `Sum`
    FROM
        payment
    GROUP BY customer_id;

# *****Q2*****
SELECT * FROM customer
WHERE
    email LIKE 'S%';

# *****Q3*****
CREATE INDEX idx_email
ON customer (email);

# *****Q4*****
SELECT * FROM customer
WHERE
    email LIKE 'S%';
    
# *****Q5*****
SELECT 
    customer_id,
    CONCAT(MONTH(payment_date),
            '/',
            YEAR(payment_date)) AS `month`,
    SUM(amount)
FROM
    payment
GROUP BY customer_id , `month` WITH ROLLUP;

