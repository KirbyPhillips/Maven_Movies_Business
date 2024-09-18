-- ASSIGNMENT

-- Pull a list of each film in inventory and include the title, description, and store id value
-- associated with each item, and its inventory id. (INNER JOIN)
SELECT *
FROM inventory;

SELECT 
	inventory_id,
    store_id,
    film.title,
    film.description
FROM inventory
	INNER JOIN film
    ON inventory.film_id = film.film_id;
    

-- How many actors are associated with each title? Pull a list of each title and figure out how
-- many actors are associated with each title. (LEFT JOIN)
SELECT *
 FROM film;
 
SELECT
	film.film_id,
    film.title,
    film_actor.actor_id
FROM film
	LEFT JOIN film_actor
    ON film_actor.film_id = film.film_id;
    
SELECT
	-- film.film_id,
    film.title,
    COUNT(film_actor.actor_id) AS count_of_actors
FROM film
	LEFT JOIN film_actor
    ON film_actor.film_id = film.film_id
GROUP BY
	film.title;


-- Pull a list of all actors, with each title they appear in.
SELECT 
	actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name,
    film.title AS film_title
FROM actor
	INNER JOIN film_actor
		ON film_actor.actor_id = actor.actor_id
    INNER JOIN film
		ON film.film_id = film_actor.film_id;


-- Pull a list of distinct titles and their descriptions, currently available in inventory at store 2.
SELECT DISTINCT
	film.title,
    film.description
FROM film
	INNER JOIN inventory
		ON inventory.film_id = film.film_id
        AND inventory.store_id = 2;
	

-- Pull a list of all staff and advisor names, and include a column noting whether they are a 
-- staff member or advisor
SELECT	
	'advisor' AS type,
    first_name,
    last_name
FROM advisor

UNION

SELECT	
	'staff' AS type,
    first_name,
    last_name
FROM staff;


-- AFTER THIS SECTION IS WHERE THE FINAL COURSE PROJECT IS DONE, WHICH WILL BE DONE IN A NEW TAB!!!






        













 
 
 
 
 
 