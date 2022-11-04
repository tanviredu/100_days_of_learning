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


EXPLAIN   SELECT * FROM ACTOR
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
























-- ----------------------------TUNIG QUERY-------------------------------
USE SAKILA;
SELECT * FROM SAKILA.FILM;
SELECT * FROM SAKILA.FILM WHERE LENGTH <50;
EXPLAIN SELECT * FROM SAKILA.FILM WHERE LENGTH <50;

-- THIS QUERY HAS A PROBLEM
-- THE PROBLEM IS WHEN YOU EXPLAIN THIS QUERY 
-- YOU WILL SEE THE VALUE OF ROWS = 1000
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
SELECT * FROM SAKILA.FILM WHERE LENGTH <100;
EXPLAIN SELECT * FROM SAKILA.FILM WHERE LENGTH <100;
-- AGAIN IT SEARCH 1000 ROW 
-- WHY THIS SENARIO AGAIN EVEN WE 
-- INDEX THE LENGTH?
-- THE ANS IS:
-- ALWAYS REMEMBER IF YOU USE * (SELECT *) AND IF YOUR 
-- DATASET IS RELATIEVELY LARGER MYSQL PREFER NOT TO USE THE INDEX
-- IN YOUR WHERE CONDITION

-- LETS TRY TO NARROW DOWN BY NOT USING *
SELECT  FILM_ID,LENGTH FROM SAKILA.FILM WHERE LENGTH <100;

EXPLAIN SELECT FILM_ID,LENGTH FROM SAKILA.FILM WHERE LENGTH <100;

-- NOW THE INDEX WORKING AGAIN AND WE DONT HAVE TO GO THROUGH 1000 ROWS
-- KESSON FROM THIS IS ONLY RETRIVE THE COLUMN THAT IS DONT USE *
-- DROPPIN THE INDEX

ALTER TABLE SAKILA.FILM
DROP KEY ADDLENGTHINDEX;



-- WE KNOW THAT INDEX DOES NOT WORK IF THE DATA IS VERY LARGE
-- FROM THE PREVIOUS SO WE CAN BREAK THE BIG QUERY AND 
-- MAKE SOME SMALL SUBSET OF QUERY AND THEN INDEX WORK ON BOTH OF THEM
-- BUT THE QUESTION IS WHAT IS THE MAGIC NUMBER OF ROWS THAT
-- WILL TRIGGER THE INDEX TO WORK. IT CAN BE FOUND ON TRIAL AND ERROR WAY
-- THERE IS NOT MAGIC NUMBER 

SELECT * FROM SAKILA.FILM
WHERE LENGTH <80;

EXPLAIN SELECT * FROM SAKILA.FILM
WHERE LENGTH <80;

-- SIMPLE SELECT NO INDEX
-- ADD THE INDEX NOW

ALTER TABLE SAKILA.FILM
ADD kEY INDEX_FILM_LENGTH (LENGTH);

-- QUERY AGAIN

EXPLAIN SELECT * FROM SAKILA.FILM
WHERE LENGTH <80;

SELECT * FROM SAKILA.FILM
WHERE LENGTH <80;

ALTER TABLE SAKILA.FILM
DROP KEY INDEX_FILM_LENGTH;

SHOW STATUS LIKE 'last_Query_cost';
-- QUERY COST IN 211.99

-- STILL NOT TAKING THE INDEX INTO CONSIDERATION

-- 2 REASON BECAUSE OF THE *
-- BECAUSE OF THE NUMBER OF DATA

-- NOW WE CANT DO ANYTHING ABOUT THE * 
-- BECAUSE BUSINESS LOGIC STATE THAT THEY NEED
-- EVERY COLUMN
-- LETS FIX PROBLEM 2 

-- 79 RECORD (<80) BREAK THEM INTO 60-19 IN TWO QUERY
SELECT * FROM SAKILA.FILM
WHERE LENGTH <=60;

EXPLAIN SELECT * FROM SAKILA.FILM
WHERE LENGTH <=60;

SELECT * FROM SAKILA.FILM
WHERE LENGTH >=61 AND LENGTH <80;

EXPLAIN SELECT * FROM SAKILA.FILM
WHERE LENGTH >=61 AND LENGTH <80;


-- NOW BOTH SMALL QUERY ARE AFFECTED BY INDEX
-- THATS HOW TO IMPROVE PERFORMENCE


SELECT * FROM SAKILA.FILM
WHERE LENGTH <=60
UNION
SELECT * FROM SAKILA.FILM
WHERE LENGTH >=61 AND LENGTH <80;




-- WHEN WE HAVE INNER JOIN QUERY WE JOIN MORE THAN 1 TABLE 
-- BUT WE CAN DO IT ANY ORDER
-- DOES INNER JOINNING OF TABLE ORDER METTER PERFORMENCE?

-- ANS IS : NO

-- NO MATTER HOW YOUR JOIN ORDER QUERY COST REMAIN THE SAME
-- BECAUSE LIKE SAID PREVIOUS QUERY OPTIMIZATION
-- ENGINE WILL INTERNALLY REORDER THE TABLE ANYWAY
-- AND FIND THE MOST EFFICIENT



-- IN OUTER JOIN (LEFT JOIN AND RIGHT JOIN) TABLE ORDER MATTER
-- BUT YOU NEED TO FIND IT BY TRIAL BY REORDERING

USE SAKILA;
SELECT * FROM SAKILA.INVENTORY
WHERE INVENTORY_ID < 555;

SELECT TITLE FROM FILM WHERE FILM_ID IN(
SELECT  FILM_ID FROM SAKILA.INVENTORY
WHERE INVENTORY_ID <555);

EXPLAIN SELECT TITLE FROM FILM WHERE FILM_ID IN(
SELECT  FILM_ID FROM SAKILA.INVENTORY
WHERE INVENTORY_ID <555);

SELECT TITLE FROM FILM WHERE EXISTS(
SELECT  FILM_ID FROM SAKILA.INVENTORY
WHERE INVENTORY_ID <555);

EXPLAIN SELECT TITLE FROM FILM WHERE EXISTS(
SELECT  FILM_ID FROM SAKILA.INVENTORY
WHERE INVENTORY_ID <555);




-- TUNING AGGRAGATE FUNCTION

-- REMEMBER AGGRAGATE FUNCTION ARE ACTUALLLY COLUMN
-- FUNCTION LIKE WHEN YOU WRITE MAX(FILM_ID) 
-- IT WILL SEARCH THE ENTIRE TABLE FROM TOP TO BOTTOM
-- AND FIND THE MAX SO WHEN YOU USE AGGRAGATE FUNCTION 
-- YOU ARE SCANING THE WHOLE ROW OF THE TABLE
-- BUT IT CAN BE TUNED WITH OTHER COMMAND

SELECT * FROM SAKILA.FILM WHERE LENGTH =100 ;

SELECT COUNT(FILM_ID) FROM SAKILA.FILM WHERE LENGTH = 100;
-- THERE ARE 12 FILM THAT HAVE LENGTH IS 100
-- AND THE MAX FILM_ID IS
SELECT MAX(FILM_ID) FROM SAKILA.FILM WHERE LENGTH = 100;

EXPLAIN SELECT MAX(FILM_ID) FROM SAKILA.FILM WHERE LENGTH = 100;
-- 1000 ROWS IS SCANED

-- NOW WRITE THE QUERY WITH ORDER BY TO GET THE SAME RESULT
SELECT FILM_ID FROM SAKILA.FILM WHERE LENGTH = 100 ORDER BY FILM_ID 
DESC LIMIT 1;

-- SEARCH THE FILM TABLE WHOSE LENGTH IS 100
-- THEN ORDER IT BY DESCENDING AND TAKE THE FIRST
-- HOW MANY QIERY SCAN ?
-- JUST 1. SO IT IS A OPTIMAL WAY
EXPLAIN SELECT FILM_ID FROM SAKILA.FILM WHERE LENGTH = 100 ORDER BY FILM_ID 
DESC LIMIT 1;


-- WHEN PAGING IS DONE HOW TO OPTIMIZE THE LIMIT QUERY
-- FIND ALL ROW IN CUSTOMER WHERE CUSTOMER_ID 396,400
SELECT * FROM SAKILA.CUSTOMER;
SELECT * FROM CUSTOMER LIMIT 400;
SELECT * FROM CUSTOMER LIMIT 395;
SELECT * FROM CUSTOMER LIMIT 395,5;


-- UNION AND UNION ALL
-- UNION GIVE A DISTINCT RESULT MEANS NO DUPLICATE IN TWO OR MORE TABLE YOU UNION 
-- BUT UNION ALL DONT GIVE DISTINCT AND DUPLICATE CAN BE THERE
-- BUT IF YOU SURE THAT TWO TABLE YOY ARE UNION WITH HAS NO DULICATE THEN GO FOR UNION ALL
-- UNION ALL PERFORM BETTER







-- HERE HOW MANY ROWS ARE AFFECTED 
-- START FROM THE SUBQUERY WE SEARCH FOR 554 ROW
-- AND THE OUTER QUERY OF COURSE SEARCH FOR 1000 ROWS
-- BECAUSE FOR EVERY OUTER QUERY [1000] IT SEARCH FOR 
-- FILM_ID ARE EXISTS IN THE INNER LIST THAT IS GENERATED BY THE SUBQUERY
-- AND 554 NUMBER OF FILM_ID IS THERE BEAUSE OF THE SUBQUERY
-- SO ROW SCAN IS OUTER 1000+ 554 INNER

-- LETS SEE THE JOIN QUERY

SELECT DISTINCT F.TITLE FROM FILM F
JOIN INVENTORY INV
ON F.FILM_ID = INV.FILM_ID
WHERE INV.INVENTORY_ID <555;

EXPLAIN SELECT DISTINCT F.TITLE FROM FILM F
JOIN INVENTORY INV
ON F.FILM_ID = INV.FILM_ID
WHERE INV.INVENTORY_ID <555;

-- TOTAL NUMBER OF SCAN IS 555
-- 554 FROM THE INVENTORY
-- AND 1 FROM THE FILM

-- JOIN QUERY DOES BETTE RESULT
-- BUT IT IS NOT ALWAYS THE CASE THAT JOIN WILL BE BETTER
-- -


