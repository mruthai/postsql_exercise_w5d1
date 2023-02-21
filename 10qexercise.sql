-- Monday Week 5 10 questions --

-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT count(last_name)
FROM actor
WHERE last_name = 'Wahlberg' -- 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT Count(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;   -- 5,607 payments


-- 3. What film does the store have the most of? (search in inventory) 
SELECT count(film_id)
FROM inventory
GROUP By store_id
ORDER BY count DESC;

SELECT count(film_id), film_id 
FROM inventory
GROUP By film_id 
ORDER BY count DESC;       ----- 72 ?


-- 4. How many customers have the last name ‘William’?
SELECT count(last_name)
FROM customer
WHERE last_name = 'William';   -- 0    There IS however 1 Williams

-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, count(staff_id)
FROM rental
GROUP BY staff_id;  ---- Mike 8,040 Staff _ID  1


-- 6. How many different district names are there?

SELECT DISTINCT district    
FROM address
GROUP BY district
ORDER BY district;			---- 378 
						

SELECT COUNT(DISTINCT district)    
FROM address;	

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT count(actor_id), film_id,
FROM film_actor
GROUP BY film_id
HAVING count(actor_id) > 13;       -- Lambs Cincinatti 


SELECT max(actor_id) AS Largestactor_id
FROM film_actor
GROUP BY film_id
HAVING count(actor_id) > 10;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT store_id , last_name 
FROM customer
Where last_name LIKE '%es' AND store_id = '1'; --- 13

--- OR 

SELECT count(last_name)
FROM customer
Where last_name LIKE '%es' AND store_id = '1';
GROUP BY last_name

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 
-- for customers with ids between 380 and 430? 
-- (use group by and having > 250)



SELECT COUNT(amount) 
FROM payment
WHERE customer_id BETWEEN 380 AND 430;
GROUP BY rental_id 									---- USING SECOND DELIMITER 
HAVING rental_id > 250 ;             ----- 1,257

--SELECT rental_id, customer_id, amount, payment_id 
--FROM payment
---WHERE customer_id BETWEEN 380 AND 430;


-- 10. Within the film table, how many rating categories are there? And what rating has the most
--     movies total?

SELECT rating, count(rating) 
FROM film
GROUP BY rating
ORDER BY count desc;				---- 5 rating PG-13 223








