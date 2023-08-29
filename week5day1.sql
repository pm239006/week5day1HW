-- intro query, select all columns from the actor table
SELECT *
FROM actor;

SELECT first_name, last_name
FROM actor; 

-- WHERE clause -- setting a condition for a query --
SELECT first_name, last_name 
FROM actor 
WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM actor 
WHERE actor_id =2;

-- 	Query for actor names that are like nick
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE 'Nick';

-- % wild card 
SELECT first_name,last_name
FROM actor 
WHERE first_name LIKE 'L%';

-- underscores place holder for potential match
SELECT first_name,last_name
FROM actor 
WHERE first_name LIKE 'L___';



SELECT first_name,last_name
FROM actor 
WHERE first_name LIKE 'K_m';


SELECT first_name,last_name
FROM actor 
WHERE first_name LIKE 'T_m';


-- % brings back any number of letters between L and e - this will bring back (lucille, lucille and laurence)
SELECT first_name,last_name
FROM actor 
WHERE first_name LIKE 'L%e'; -- clause for data retrieval 

-- comparison operations 
-- Greater than, less than,less than or equal to,greater than or equal to 
-- not equal <>

-- Query to explore data from the payment table

SELECT *
FROM payment;


-- Query for customers who paid an amt greater than $3.00

SELECT DISTINCT(customer_id), amount
FROM payment
WHERE amount > 3.00;


-- Query for customer who paid under 7.99
SELECT DISTINCT(customer_id),amount 
FROM payment 
WHERE amount < 7.99;


-- Query for customer who paid atleast 5.99 for rental 
SELECT customer_id,rental_id,amount 
FROM payment 
WHERE amount >= 5.99;


-- -- Query for customer who paid at most 2.99 for rental 
SELECT customer_id,rental_id,amount 
FROM payment 
WHERE amount <= 2.99;

--- Query for any amount NOT EQUAL to 2.99
SELECT customer_id,rental_id,amount 
FROM payment 
WHERE amount <> 2.99;  ---- !=


-- order by (defaults to ascending order)
SELECT *
FROM payment 
ORDER BY amount ASC;

SELECT *
FROM payment 
ORDER BY amount DESC;

-- top 25 customer who spent the most
-- LIMIT AND OFFSET 
SELECT *
FROM payment 
ORDER BY amount DESC
LIMIT 25;   -- GO TO ONLY 25 ROWS OF DATA

SELECT *
FROM payment 
ORDER BY amount DESC
LIMIT 25 OFFSET 100; -- SKIPS 100 ROWS OF DATA AND THEN GIVES THE FIRST 25 ROWS AFTER THAT (BASICALLY STARTING AT ROW 101 TO LOOK FOR DATA)


-- BETWEEN
-- Query for customers that paid an amt between 2.99 and 7.99 (its inclusive on both ends includes 2.99 and 7.99)
SELECT customer_id, amount
FROM payment 
WHERE amount BETWEEN 2.99 AND 7.99;

-- SQL AGGREGATIONS -- SUM(), AVG(), COUNT(), MIN(), MAX()
-- SUM OF all AMTS PAID OVER 5.99 -- $19,578
SELECT SUM(amount)
FROM payment 
WHERE amount > 5.99;

-- add all rows of money paid -- $61,312
SELECT SUM(amount)
FROM payment;


-- average amt paid 
SELECT AVG(amount)
FROM payment;

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;


-- query for # of amts paid 
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- SEE THE # OF UNIQUE AMTS, 1.99 ONCE , 2.99 ONCE AND ETC 
SELECT COUNT(DISTINCT amount)
FROM payment;


-- Query for smallest amt paid over 7.99
SELECT MIN(amount) AS min_payments 
FROM payment
WHERE amount > 7.99;


SELECT MAX(amount) AS largest_payments 
FROM payment;

SELECT amount
FROM payment
ORDER BY amount DESC
LIMIT 1;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount 
ORDER BY amount;

SELECT amount, COUNT(amount) AS occurences 
FROM payment
GROUP BY amount 
ORDER BY amount;

-- Query to show which customers paid most for rentals
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount) DESC
-- YOU CAN CHECK FOR THE CUSTOMER WHO PAID THE MOST $
LIMIT 1;



---- HOMEWORK WEEK 5 DAY 1 
SELECT COUNT(last_name)             -- #1
FROM actor 
WHERE last_name = 'Wahlberg';

SELECT COUNT(amount)                -- #2
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;

									-- # 3
SELECT COUNT(film_id) , film_id
FROM inventory
GROUP BY film_id
ORDER BY count(film_id) DESC;


SELECT COUNT(last_name)    	 		-- #4
FROM actor 
WHERE last_name = 'William';


-- -- SELECT staff_id, SUM()         --#5
-- -- FROM staff
-- -- GROUP BY customer_id
-- -- ORDER BY SUM(amount) DESC
-- -- #5 
-- SELECT staff_id,rental_id
-- FROM rental
-- ORDER BY  DESC;


SELECT COUNT(DISTINCT district)     -- #6
FROM address;

									-- #7
-- SELECT COUNT(film_actor), film actor
-- FROM film_actor
-- GROUP BY film_actor
-- COUNT(film_actor), film_id;


SELECT COUNT(last_name)  			-- #8
FROM customer
WHERE last_name LIKE '%es';



SELECT COUNT(amount) , amount       -- # 9
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;


SELECT rating, COUNT(rating)   -- #10
FROM film
GROUP BY rating;




