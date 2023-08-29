--intro query, select all from the actor table
SELECT * 
FROM actor;

-- query for first_name and last_name from the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id = 2;

-- Query for first_name that is LIKE Nick
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'Nick';

-- % wild card - can take the place of any character
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with the letter K and is followed by 2 characters using the where Clause --  __
SELECT first_name, actor_id 
FROM actor 
WHERE first_name 
LIKE 'K__';

SELECT first_name, actor_id 
FROM actor 
WHERE first_name 
LIKE 'K_m';

-- Query for all first_name data that starts with a K and ends with th
-- using the WHERE clause with both wildcard and underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K%th';

-- Comparison Operators
-- Greater Than > Less than < 
-- Greater or Equal >= Less Than or Equal <=
-- not equal <>

--Explore data from payment table with SELECT ALL query *
--Good idea to grab all data from a new table so you know what youre working with
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an ammount greater than $3
SELECT customer_id, amount
FROM payment
WHERE amount > 3.00;

--Query for customers who paid under 7.99 for specific rentals
SELECT customer_id, rental_id, amount
FROM payment
WHERE amount < 7.99;

-- -Query for payments that were greater than or equal to 5.99
SELECT customer_id, rental_id, amount
FROM payment
WHERE amount >= 5.99;

-- query for payments that were less than or equal 2.99
SELECT customer_id, rental_id, amount
FROM payment
WHERE amount <= 2.99;

-- ORDER BY
-- BETWEEN
-- Query for all data order by amount
SELECT *
FROM payment
ORDER BY amount ASC; -- defaults to ASC

-- order by descending
SELECT * 
FROM payment
ORDER BY amount DESC;

-- Query for data that shows customers who paid an amount BETWEEN 2.00 and 7.99
-- using WHERE, BETWEEN, and AND
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.99 AND 5.99;

-- Query for all customers who paid over 0.00
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount;

-- SQL Aggregations --> SUM(), AVG(), COUNT(), MIN(), MAX()

-- query to display sum of amounts paid over 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Average amount for payments over 4.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the COUNT of amounts paid
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the DISTINCT COUNT of amounts paid <-- unique values
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query for smallest payment made over 7.99
SELECT MIN(amount) as min_num_payments
FROM payment
WHERE amount > 7.99;

SELECT amount
FROM payment
WHERE amount > 7.99
ORDER BY amount -- defaults to ASC
LIMIT 1;

-- SELECT the Largest amount greater than 7.99
SELECT MAX(amount) as max_num_payments 
FROM payment
WHERE amount > 7.99;

SELECT amount
FROM payment
WHERE amount > 7.99
ORDER BY amount DESC
LIMIT 1;

SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display different COUNTS of amounts grouped together
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to display customer_ids with summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount);

-- grab all amounts by customer id
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER BY customer_id;



SELECT *
FROM address;



