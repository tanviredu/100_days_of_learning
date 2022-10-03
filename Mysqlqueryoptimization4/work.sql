USE SAKILA; -- USING SAKILA DATABASE
SELECT * FROM ACTOR;
EXPLAIN SELECT * FROM ACTOR;
-- SELECT * FROM ADDRESS;
SELECT * FROM FILM_ACTOR;

SELECT A.FIRST_NAME,A.LAST_NAME,FA.FILM_ID,FM.TITLE FROM ACTOR A
JOIN FILM_ACTOR FA ON A.ACTOR_ID = FA.ACTOR_ID
JOIN FILM FM ON FA.FILM_ID = FM.FILM_ID;

EXPLAIN SELECT A.FIRST_NAME,A.LAST_NAME,FA.FILM_ID,FM.TITLE FROM ACTOR A
JOIN FILM_ACTOR FA ON A.ACTOR_ID = FA.ACTOR_ID
JOIN FILM FM ON FA.FILM_ID = FM.FILM_ID;

EXPLAIN SELECT A.FIRST_NAME,A.LAST_NAME,FA.FILM_ID,FM.TITLE FROM ACTOR A
JOIN FILM_ACTOR FA ON A.ACTOR_ID = FA.ACTOR_ID
JOIN FILM FM ON FA.FILM_ID = FM.FILM_ID;

SELECT * FROM FILM_ACTOR LIMIT 10;


EXPLAIN  EXTENDED SELECT * FROM ACTOR
INNER JOIN FILM_ACTOR 
ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID;
SHOW WARNINGS; -- THS STATEMENT IS IMPORTANT YOU MUST WRITE IT

-- IN THIS RESULT IN THE MESSAGE COLUMN YOU WILL FIND THE OPTIMIZED QUERY THAT
-- GENERATED BY QUERY EXECUTION ENGINE . THIS QUERY AND OUR QUERY CAN LOOK DIFFERENT BUT
-- THIS QUERY WILL GIVE US THE SAME RESULT AND WITH A VERY FAST TIME


-- BELLOW IS THE OPTIMIZED QUERY MY MYSQL OPTIMIZER
select `sakila`.`actor`.`actor_id` AS `actor_id`,`sakila`.`actor`.`first_name` AS
`first_name`,`sakila`.`actor`.`last_name` AS `last_name`,`sakila`.`actor`.`last_update` AS
`last_update`,`film_actor`.`actor_id` AS `actor_id`,`film_actor`.`film_id` AS `film_id`,`film_actor`
.`last_update` AS `last_update` from `sakila`.`actor` join `sakila`.`film_actor` where `film_actor`.`actor_id` = `sakila`.`actor`.`actor_id`;
























-- TUNIG QUERY
USE SAKILA;
SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE LENGTH <50;
EXPLAIN SELECT * FROM SAKILA.FILM WHERE LENGTH <50;

-- THIS QUERY HAS A PROBLEM
-- THE PROBLEM IS WHEN YOU EXPLAIN THIS QUERY 
-- YOU WILL SEE THE VALUE OF ROWS =1000
-- EVEN THE RESULT YOU GET IS 28
-- THAT MEANS IT SEARCHES 1000 ROW TO FIND THE 28 ROW
-- THIS PROBLEM CAN BE REDUCED WITH INDEXING THE TABLE
-- OPTIMIZED QUERY WONT SCAN THE ENTIRE TABLE
-- WHAT CHANGES SHOULD BE DONE
-- YOU ARE SEARCHING FOR LENGTH
-- THEN MAKE THE LENGTH AN INDEX 
-- SO QUERY CAN FAST GO TO THE REULT BASED ON THE LOGIC
-- AND NOT SCAN THE ENTIRE TABLE

ALTER TABLE SAKILA.FILM
ADD KEY ADDLENGTHINDEX (LENGTH);

-- NOW IF YOU JUST RUN THE QUEERY AGAIN YOU WILL SEE THE EXACT 28 WAS AFFECTED NIT 1000
EXPLAIN SELECT * FROM SAKILA.FILM WHERE LENGTH <50;

SELECT * FROM SAKILA.FILM WHERE LENGTH <50;

EXPLAIN SELECT * FROM SAKILA.FILM WHERE LENGTH <100;
-- AGAIN IT SEARCH 1000 ROW 
-- WHY THIS SENARIO AGAIN EVEN WE 
-- INDEX THE LENGTH
-- THE ANS IS:
-- 
