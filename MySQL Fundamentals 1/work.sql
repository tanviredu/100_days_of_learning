
SHOW DATABASES;
USE `sakila`;
-- if you use this command you dont have to write database.table
 SELECT * FROM sakila.actor;
 UPDATE `sakila`.`actor` SET `first_name` = 'Tanvir',`last_name` = 'Rahman' WHERE (`actor_id` = '1'); 
 UPDATE `sakila`.`actor` SET `first_name` = 'PENELOPE', `last_name` = 'GUINESS' WHERE (`actor_id` = '1');
 SELECT * FROM sakila.actor limit 10;
 SELECT * FROM `sakila`.`city` LIMIT 10;

 SELECT * FROM actor;
 INSERT INTO `sakila`.`actor` (`first_name`, `last_name`, `last_update`) VALUES ('Hasnat', 'Rabi', '1993-12-12');
 INSERT INTO `sakila`.`actor` (`first_name`, `last_name`, `last_update`) VALUES ('Hasnat', 'Rabi', '1993-12-12');
 UPDATE `sakila`.`actor` SET `last_name` = 'Faisali' WHERE (`actor_id` = '202');
-- DELETE ``
 Update `sakila`.`actor` SET `first_name` = 'Rahman' WHERE (`actor_id` = 202);
 SELECT * FROM actor ORDER BY `actor_id` DESC;



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

-- Replace part of the string with a new string
-- REPLACE(string, from_string, new_string)
SELECT REPLACE('string','what should be changed','with what');
SELECT REPLACE('Tanvir Rahman','Rahman','rahman');

-- WORKING WITH THE DATE
DESCRIBE sakila.actor;


-- when m d y is in smaller letter  month,day,year in 2 digit year,
--  %M full month name
--  %b first 3 word of the name of the month
--  %Y 4 digit year
--  %T Time %f precession
--  %D day+th ex 28th

SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,
       last_update as LAST_UPDATE_raw,
       DATE_FORMAT(last_update,'%m/%d/%y') AS LAST_UPDATE_1,
	   DATE_FORMAT(last_update,'%d-%m-%y') AS LAST_UPDATE_2,
	   DATE_FORMAT(last_update,'%d-%m-%Y') AS LAST_UPDATE_3,	
	   DATE_FORMAT(last_update,'%d-%b-%Y') as LAST_UPDATE_4,
       DATE_FORMAT(last_update,'%d-%b-%Y-%T') as LAST_UPDATE_5,
	   DATE_FORMAT(last_update,'%d-%b-%Y:%f') as LAST_UPDATE_6,
       DATE_FORMAT(last_update,'%M-%D-%Y') as LAST_UPDATE_7

from sakila.actor;

-- autometically find pattern with the zone
-- different zone different pattern


SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,
       last_update as LAST_UPDATE_raw,
       DATE_FORMAT(last_update,'%m/%d/%y') AS LAST_UPDATE_1,
	   DATE_FORMAT(last_update,'%d-%m-%y') AS LAST_UPDATE_2,
	   DATE_FORMAT(last_update,'%d-%m-%Y') AS LAST_UPDATE_3,	
	   DATE_FORMAT(last_update,'%d-%b-%Y') as LAST_UPDATE_4,
       DATE_FORMAT(last_update,'%d-%b-%Y-%T') as LAST_UPDATE_5,
	   DATE_FORMAT(last_update,'%d-%b-%Y:%f') as LAST_UPDATE_6,
       DATE_FORMAT(last_update,'%M-%D-%Y') as LAST_UPDATE_7

from sakila.actor;


SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,
	DATE_FORMAT(last_update,GET_FORMAT(DATE,'EUR')) AS LAST_UPATE_EUR,
	DATE_FORMAT(last_update,GET_FORMAT(DATE,'ISO')) AS LAST_UPDATE_ISO,
	DATE_FORMAT(last_update,GET_FORMAT(DATE,'USA')) AS LAST_UPDATE_USA
FROM sakila.actor;



-- FIND THE DAY OF THE WEEK OF ANY DATETIME
SELECT DATE_FORMAT(NOW(),GET_FORMAT(DATE,'ISO')) AS ISOTIME;
SELECT DATE_FORMAT(NOW(),GEt_FORMAT(DATE,'USA')) AS USATIME; 

-- REMOVING DUPLICATE FROM DATA WITH DISTINCT

SELECT COUNT(first_name) FROM sakila.actor;
SELECT COUNT(DISTINCT first_name) FROM sakila.actor;
SELECT CONCAT(first_name,' ',last_name) AS NAME FROM sakila.actor ; 
SELECT DISTINCT(CONCAT(first_name,' ',last_name)) AS NAME from sakila.actor;


-- WHERE CLAUSE
SELECT actor_id,first_name,last_name
FROM sakila.actor 
WHERE actor_id <100;

SELECT actor_id,first_name,last_name
FROM sakila.actor 
WHERE first_name = 'Nick'
ORDER BY actor_id desc;

SELECT actor_id,first_name,last_name
FROM sakila.actor
WHERE first_name <='Nick';
-- the result will be those whose first charactoe is before not

SELECT actor_id,first_name,last_name 
FROM sakila.actor
WHERE first_name != 'NICK' OR first_name != 'John';

SELECT * 
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id <100;

SELECT * 
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id <100;


-- NOT OPERATOR
SELECT COUNT(*)
FROM sakila.actor
WHERE first_name != "KENNETH" AND actor_id <100; 

SELECT COUNT(*)
FROM sakila.actor
WHERE first_name <> "KENNETH" AND actor_id <100;

SELECT COUNT(*)
FROM sakila.actor
WHERE NOT first_name =  "KENNETH" AND actor_id <100; 
-- NOT OPERATOR DOT HE SAME THING 
-- TOU HAVE TO PUT IT JUST AFTER THE WHERE CLAUSE


-- WHERE CLAUSE
-- SUBQUERY
-- IN ,NOT IN 
-- BETWEEN
-- LIKE
-- NULL,isnull(),isnotnull()



-- IN and subquery
SELECT * FROM sakila.actor
WHERE first_name IN('John','Nick','Zero');


SELECT DISTINCT first_name FROM sakila.actor
WHERE first_name = 'John' OR first_name = 'Nick' OR first_name = "Zero";


SELECT  * FROM sakila.actor
WHERE first_name IN (SELECT  first_name FROM sakila.actor
WHERE first_name = 'John' OR first_name = 'Nick' OR first_name = "Zero"
);

SELECT * FROM sakila.actor
WHERE actor_id IN(1,2,3,4,5,6,7);


SELECT first_name,last_name FROM sakila.actor 
WHERE first_name IN
(
	SELECT first_name FROM sakila.actor WHERE first_name = 'Nick'
);


-- Syntax
-- BETWEEN (* and *)
-- THIS WORKS AS THE RANGE FUNCTION

SELECT * FROM sakila.actor
WHERE actor_id BETWEEN 5 AND 10;


## LIKE LOGIC

SELECT * FROM sakila.actor
WHERE first_name LIKE 'Joh%';

SELECT * FROM sakila.actor
WHERE first_name LIKE '%nny';


SELECT * FROM sakila.actor
WHERE first_name LIKE 'J____Y';
-- THis _ means a character
-- this J___Y means first character must be J
-- and fifth character must be Y
-- in the middle 3 character can be anything
-- and total character shound be 5
-- THis is the pattern

-- if you dont care of the length then this query become

SELECT * FROM sakila.actor
WHERE first_name LIKE 'J____Y%';

SELECT * FROM sakila.actor
WHERE first_name Like 'J%NY';


DESCRIBE sakila.address;

SELECT * FROM sakila.address
WHERE address2 IS NULL;


--  YOU CAN NOT USE != NULL 
-- IT WILL GIVE YOU ERROR
SELECT COUNT(*) AS NULL_ADDRESS FROM sakila.address 
WHERE address2 IS NULL;

SELECT COUNT(*) AS NOT_NULL_ADDRESS FROM sakila.address
WHERE address2 IS NOT NULL;


SELECT * FROM 
sakila.actor
ORDER BY actor_id
LIMIT 10;

SELECT * FROM
sakila.actor
ORDER BY actor_id
LIMIT 30,10;

-- 30 is the offset that means it start with the 30
-- and then it select 10 records
-- if just one value after limit then ofset is 0

USE sakila;
CREATE TABLE IF NOT EXISTS ActorSample(
	actor_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id)
    );
    
-- INSERT STATEMENT
-- single statement
INSERT INTO sakila.actorsample 
(first_name,last_name,last_update)
VALUES("pinal","dave",'2013-04-15');

SELECT * FROM sakila.actorsample;

-- default time is current date time

INSERT INTO sakila.actorsample 
(first_name,last_name)
VALUES("pinal1","dave1");

INSERT INTO sakila.actorsample 
(first_name)
VALUES("pinal1");
-- last name will be null because it is marked as null nad no default value



-- MULTIPLE STATEMENT
INSERT INTO sakila.actorsample 
(first_name,last_name,last_update)
VALUES
("pina4","dave9",'2013-04-11'),
("pina5","dave8",'2013-04-12'),
("pina6","dave7",'2013-04-13'),
("pina7","dave6",'2013-04-14'),
("pina8","dave5",'2013-04-15'),
("pina9","dave4",'2013-04-16'),
("pina10","dave3",'2013-04-17');

SELECT * FROM sakila.actorsample;



-- UPDATE 
-- SYNTAX

-- UPDATE
-- SET
-- WHERE

UPDATE sakila.actorsample
SET first_name = 'Tanvir'
WHERE actor_id = 11;
SELECT * FROM sakila.actorsample;

UPDATE sakila.actorsample
SET first_name = 'Ornob'
WHERE actor_id IN(1,2,3);

SELECT * FROM sakila.actorsample;


-- THIS MIGHT NOT WORK IF YOU HAVE SAFE MODE ON IN MYSQL WORKBENCH
UPDATE sakila.actorsample
SET first_name = 'EVEN'
WHERE actor_id IN (SELECT actor_id FROM sakila.actorsample WHERE actor_id%2 = 0);


SELECT * FROM sakila.actorsample;

-- SYNTAX
-- DELETE
-- FROM
-- WHERE

DELETE FROM sakila.actorsample
WHERE actor_id = 11;

SELECT * FROM sakila.actorsample;


-- THIS MIGHT NOT WORK IF YOU HAVE SAFE MODE ON IN MYSQL WORKBENCH
DELETE FROM sakila.actorsample;