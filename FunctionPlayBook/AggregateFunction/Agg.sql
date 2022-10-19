 USE sakila;
 
 SELECT * FROM film;
 SELECT * FROM inventory;
 SELECT * FROM rental;
 SELECT * FROM Payment;
 
 SELECT F.title ,SUM(P.amount) TOTAL_INCOME from film F
 JOIN inventory I ON F.film_id = I.film_id
 JOIN rental R ON R.inventory_id = I.inventory_id
 JOIN payment P ON P.rental_id = R.rental_id
 GROUP BY F.title 
 ORDER BY SUM(P.amount) DESC;
 
 -- if you get a  select statement with notmal field and aggragate function
 -- there have to be a GROUP BY statement
 
 
 
 -- getting how many time film is rented
 SELECT F.title ,COUNT(P.rental_id) TOTAL_INCOME from film F
 JOIN inventory I ON F.film_id = I.film_id
 JOIN rental R ON R.inventory_id = I.inventory_id
 JOIN payment P ON P.rental_id = R.rental_id
 GROUP BY F.title 
 ORDER BY COUNT(P.rental_id) DESC;
 
 
 --
 SELECT F.title ,AVG(P.amount),SUM(P.amount),MAX(P.amount),MIN(P.amount) TOTAL_INCOME from film F
 JOIN inventory I ON F.film_id = I.film_id
 JOIN rental R ON R.inventory_id = I.inventory_id
 JOIN payment P ON P.rental_id = R.rental_id
 GROUP BY F.title 
 ORDER BY AVG(P.amount) DESC;
 
 -- FIND CUSTOMER NAME WHO RENTED THE MOVIE AND DID NOT RETURN YET
 SELECT * FROM film;
 SELECT * FROM rental;
 SELECT * FROM customer;
 SELECT * FROM payment;

-- 30 was minus because 30 day is valid for rental
-- fine started after 30
-- so we deduct 30 days from RENTEDTOTALDAY
-- now you have to make the fine ammount
-- so fine system is for every 30 days 1.99 USD
-- so we have to devide ((TOTALNUMBER_OF_DAYS_you_have_to_fine)/30)*1.99) 
-- now give a random discount more than 20 
SELECT CONCAT(C.first_name," ",C.last_name) AS CustomerName,
 f.title,
 DATEDIFF(current_timestamp,R.rental_date)  AS RENTEDTOTALDAY,
 DATEDIFF(current_timestamp,R.rental_date) - 30 AS TOTALNUMBER_OF_DAYS_you_have_to_fine,
 ROUND(((DATEDIFF(current_timestamp,R.rental_date) - 30)/30)*1.99) AS Amount_to_fine_rounded,
 ((DATEDIFF(current_timestamp,R.rental_date) - 30)/30)*1.99 AS Amount_to_fine,
 ROUND((RAND()*100)+20) AS DISCOUNT, 
 (ROUND(((DATEDIFF(current_timestamp,R.rental_date) - 30)/30)*1.99) - ROUND((RAND()*100)+20)) AS FINAL_FINE_AMOUNT, 
 R.return_date,R.rental_date
 
 from film F
 JOIN inventory I ON F.film_id = I.film_id
 JOIN rental R ON R.inventory_id = I.inventory_id
 JOIN payment P ON P.rental_id = R.rental_id 
 JOIN customer C ON C.customer_id =  P.customer_id  
 WHERE R.return_date IS NULL;
 
 
 -- you can use it as key
 SELECT UUID();
 
 
 
 
 