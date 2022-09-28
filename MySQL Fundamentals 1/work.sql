
-- SHOW DATABASES;
-- USE `sakila`;
-- if you use this command you dont have to write database.table
-- SELECT * FROM sakila.actor;
-- UPDATE `sakila`.`actor` SET `first_name` = 'Tanvir',`last_name` = 'Rahman' WHERE (`actor_id` = '1'); 
-- UPDATE `sakila`.`actor` SET `first_name` = 'PENELOPE', `last_name` = 'GUINESS' WHERE (`actor_id` = '1');
-- SELECT * FROM sakila.actor limit 10;
-- SELECT * FROM `sakila`.`city` LIMIT 10;

-- SELECT * FROM actor;
-- INSERT INTO `sakila`.`actor` (`first_name`, `last_name`, `last_update`) VALUES ('Hasnat', 'Rabi', '1993-12-12');
-- INSERT INTO `sakila`.`actor` (`first_name`, `last_name`, `last_update`) VALUES ('Hasnat', 'Rabi', '1993-12-12');
-- UPDATE `sakila`.`actor` SET `last_name` = 'Faisali' WHERE (`actor_id` = '202');
-- DELETE ``
-- Update `sakila`.`actor` SET `first_name` = 'Rahman' WHERE (`actor_id` = 202);
-- SELECT * FROM actor ORDER BY `actor_id` DESC;\



-- DATA RETRIVAL   

-- showing data is a different colun name with 'AS' key word

-- select first_name from `sakila`.actor;
-- select concat_ws(' ',`first_name`,`last_name`) AS `FULL NAME` from `sakila`.`actor`; 

-- getting current time
-- in 24 hourse clock
-- SELECT NOW() AS `CURRENT DATE AND TIME`; -- return the whole datetime
-- SELECT curdate() AS `ONLY CURRENT DATE`;
-- SELECT curtime() AS `ONLY CURRENT TIME`;


-- 12 Hourse in mysql
-- first argument the timestamp
-- second agument '%r'
-- select time_format(NOW(),'%r');


-- mod function
-- you can use the % sign or the MOD()
-- SELECT * FROM sakila.actor;
-- SELECT * FROM sakila.actor WHERE actor_id % 2 = 0;
-- SELECT * FROM sakila.actor WHERE MOD(actor_id,2) = 1;

-- sqrt()
-- SELECT sqrt(25) AS `NUMBER`;

-- SELECT * FROM sakila.actor;
-- SELECT * FROM sakila.actor ORDER BY first_name ASC;
-- SELECT * FROM sakila.actor ORDER BY last_name DESC;
-- SELECT first_name AS FNAME, last_name as LASTNAME FROM sakila.actor ORDER BY first_name DESC;
-- SELECT * FROM sakila.actor WHERE actor_id >100;
-- SELECT * FROM sakila.actor WHERE actor_id <100;
-- SELECT actor_id,first_name,last_name FROM sakila.actor where first_name = 'Nick';

-- SELECT actor_id,first_name,last_name 
-- FROM sakila.actor 
-- WHERE actor_id >100
-- ORDER BY first_name ASC, last_name DESC;


-- think you want to know all the columns of the 
-- table,just coumn 

-- approach 1 
-- SELECT * FROM sakila.actor
-- WHERE 1=2;

-- approach 2
-- DESCRIBE sakila.actor;

-- SELECT *
-- FROM sakila.rental
-- LIMIT 10;

-- DESCRIBE sakila.rental;

-- SELECT rental_date AS REND,
-- 	   inventory_id AS IID,
--        return_date AS RETD
-- FROM sakila.rental;

-- DESCRIBE sakila.film;

-- SELECT replacement_cost - rental_rate AS CostDiff, 
-- 	   film_id AS FilmID,
--        length/60 AS TimeInHour
-- FROM sakila.film ORDER BY TimeInHour DESC LIMIT 10;

-- ELIMINATE DUPLCATE ROWS IN MYSQL

DESCRIBE sakila.payment;



-- WORKING WITIH THE NUMBERS
SELECT * FROM sakila.payment LIMIT 10;
SELECT 
amount          AS AMOUNT_RAW ,
ROUND(amount)   AS AMOUNT_ROUNDED,
ROUND(amount,1) AS AMOUNT_ROUNDED_1,
FLOOR(amount)   AS AMOUNT_FLOOR,
CEILING(amount) AS AMOUNT_CEIL
FROM sakila.payment
LIMIT 10;


-- WORKING WITH STRINGS

-- CONCATENATION OF THE STRING
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME
FROM sakila.actor;

SELECT(LEFT("Tanvir",2));
SELECT(LENGTH("Tanvir"));


-- GENERATE NAME AND INITIALS WITH LEFT
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME,
	   CONCAT(LEFT(first_name,2),' ',LEFT(last_name,2)) AS INITIALS,
       CONCAT(RIGHT(first_name,2),' ',RIGHT(last_name,2)) AS RIGHTINITIALS,
       LENGTH(CONCAT(first_name,' ',last_name)) AS LENGTH,
       REVERSE(CONCAT(first_name,' ',last_name)) AS REVERSENAME
FROM sakila.actor;











