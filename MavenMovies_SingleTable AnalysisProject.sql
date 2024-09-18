-- ASSIGNMENT:

-- Send email to customers regarding change in MMT
SELECT
	first_name,
    last_name,
    email
FROM customer;

-- Pull records of titles rented for 3, 5, or 7 days
SELECT *
FROM film;

SELECT DISTINCT
	rental_duration
FROM film;

-- Pull all payment records for the first 100 customers
SELECT *
FROM payment;

SELECT *
FROM payment
WHERE customer_id < 101;

SELECT *
FROM payment
WHERE customer_id <= 100;

SELECT *
FROM payment
WHERE customer_id BETWEEN 1 AND 100;

-- Pull all records of first 100 customers with payments > $5 and after January 1, 2006
SELECT 
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id < 101
	AND amount >= 5
    AND payment_date > '2006-01-01';


-- Pull records of all payments from customers 42, 53, 60, and 75, with amount > $5
SELECT 
	customer_id,
    rental_id,
    amount,
    payment_date
FROM payment
WHERE amount > 5
	OR customer_id = 42
    OR customer_id = 53
    OR customer_id = 60
    OR customer_id = 75;
    

-- Pull a list of films which include a Behind The Scenes special feature
SELECT *
FROM film;

SELECT
	title,
    special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%';


-- Pull a count of titles sliced by rental duration
SELECT *
FROM film;

SELECT
	rental_duration,
    COUNT(film_id) AS films_with_rental_duration
FROM film
GROUP BY 
	rental_duration;
    

-- Pull a count of films, and the average, min and max rental rate, grouped by replacement cost
SELECT *
FROM film;

SELECT
	replacement_cost,
	COUNT(film_id) AS number_of_films,
    MIN(rental_rate) AS cheapest_rental,
    MAX(rental_rate) AS most_expensive_rental,
    AVG(rental_rate) AS average_rental_rate
FROM film
GROUP BY 
	replacement_cost;
    

-- Pull a list of customer id's with more than 15 rentals all-time
SELECT *
FROM rental;

SELECT
	customer_id,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY 
	customer_id
HAVING COUNT(rental_id) < 15;


-- Pull a list of all film titles with their lengths and rental rates, sort them from longest to shortest
SELECT *
FROM film;

SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY 
	length DESC;
    

-- CASE STATEMENTS
-- Pull a list of first and last names of all customers, and label them as either 'store 1 active'
-- 'store 1 inactive', 'store 2 active' or 'store 2 inactive'
SELECT *
FROM customer;

SELECT DISTINCT active
FROM customer;

SELECT 
	first_name,
    last_name,
    CASE
		WHEN store_id = 1 AND active = 1 THEN 'store 1 active'
        WHEN store_id = 1 AND active = 0 THEN 'store 1 inactive'
        WHEN store_id = 2 AND active = 1 THEN 'store 2 active'
        WHEN store_id = 2 AND active = 0 THEN 'store  inactive'
        ELSE 'uh oh...check logic!'
	END AS store_and_status
FROM customer;


-- CASE & COUNT
-- Create a table to count the number of customers broken down by store id (in rows), and active
-- status (in columns). THIS SECTION IS VERY IMPORTANT TO LEARN AND UNDERSTAND THE CONCEPTS!!!!
SELECT *
FROM customer;

SELECT 
	store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active,
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS inactive
FROM customer
GROUP BY store_id;

-- AFTER THIS SECTION IS WHERE THE MID-COURSE PROJECT IS DONE, WHICH WILL BE DONE IN A NEW TAB!!!


