-- WHAT IS TRANSACTION
/*
	A Sql transaction is a sequence of 
    executions of SQL statements that is 
    atomic;
    either execute 100% successfully or have no
    impact on the database. either full or zero
    no 50%
    Transaction helps to maintain ACID Principle
    transaction syntax
    
    1) with commit
    
    START TRANSACTION
		<SQL DML COMMANDS>
	COMMIT
    
    2) with roolback
	 START TRANSACTION
		<SQL DML COMMANDS>
	 ROLLBACK
*/
-- SELECT (DCL)
USE SAKILA;
-- WITHOUT TRANSACTION
SELECT * FROM actor WHERE actor_id <5;
-- INSIDE TRANSACTION
-- DO NOT WRITE SELECT STATEMENT INSIDE TRANSACTION
-- YOU COULD WRITE IT BUT IT DOES NOT MAKE ANY SENSE
-- IF YOU MUST WRITE A SELECT QUERY INSIDE A TRANSACTION
-- FINISH IT WITH COMMIT NOT ROLLBACK
/*
START TRANSACTION
	SELECT * FROM actor WHERE actor_id <5;
COMMIT;

START TRANSACTION
	SELECT * FROM actor WHERE actor_id <5;
ROLLBACK;

*/

-- INSERT STSTEMENT (DML)
DESCRIBE actor;

SELECT * FROM  actor;
SELECT * FROM actor WHERE actor_id >200;

INSERT INTO actor(first_name,last_name)
VALUES ('John','Smith');

SELECT * FROM actor WHERE actor_id>200;



-- HOW to set up current timestamp
-- on update and delete

CREATE TABLE actor2
(
		actor_id    SMALLINT    NOT NULL PRIMARY KEY AUTO_INCREMENT,
        first_name  VARCHAR(45) NOT NULL,
        last_name   VARCHAR(45) NOT NULL,
        last_update TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
        INDEX idx_actor2_last_name (last_name)
);
SELECT CURRENT_TIMESTAMP();

INSERT INTO actor VALUES(400,'Tanvir','Rahman',CURRENT_TIMESTAMP());
INSERT INTO actor VALUES(400,'Tanvir','Rahman',CURRENT_TIMESTAMP()); -- it will return error

-- you can insert duplicate  .you have to replace or update
-- if you dont know if there was duplicate result then use insert ignore
-- then it will give you warning

INSERT IGNORE INTO actor VALUES(400,'Tanvir','Rahman',CURRENT_TIMESTAMP());

SELECT * FROM actor WHERE actor_id>200;


INSERT INTO actor 
VALUES
(401,'Tanvir1','Rahman1',CURRENT_TIMESTAMP()),
(402,'Tanvir2','Rahman2',CURRENT_TIMESTAMP()),
(403,'Tanvir3','Rahman3',CURRENT_TIMESTAMP()),
(404,'Tanvir4','Rahman4',CURRENT_TIMESTAMP()),
(405,'Tanvir5','Rahman5',CURRENT_TIMESTAMP());

SELECT * FROM actor WHERE actor_id>200;


-- there is one new column and rest of all are duplicate
-- we add ignore so it will ignore the duplicate
-- 401,402,403,404,405 and insert 406
INSERT IGNORE INTO actor 
VALUES
(401,'Tanvir1','Rahman1',CURRENT_TIMESTAMP()),
(402,'Tanvir2','Rahman2',CURRENT_TIMESTAMP()),
(403,'Tanvir3','Rahman3',CURRENT_TIMESTAMP()),
(404,'Tanvir4','Rahman4',CURRENT_TIMESTAMP()),
(405,'Tanvir5','Rahman5',CURRENT_TIMESTAMP()),
(406,'Tanvir6','Rahman6',CURRENT_TIMESTAMP());

SELECT * FROM actor WHERE actor_id>200;

-- DELETE DATA THAT ARE WE inserting

DELETE FROM actor WHERE actor_id > 200;


SELECT * FROM actor WHERE actor_id>200;

-- reset the auto increment
-- we have to fix it other wise it will start from 406 the last we added
-- ALTER TABLE <TABLE_NAME> AUTO_INCREMENT = <row_number>
ALTER TABLE actor AUTO_INCREMENT = 200;


SELECT * FROM actor2;


-- COPY TABLE ONE TO ANOTHER

INSERT INTO actor2(first_name,last_name)
SELECT first_name,last_name
FROM actor; 

SELECT * FROM actor2;
-- it will show the current time
-- and not copy from the actor table 
DROP TABLE actor2;

CREATE TABLE actor2
(
		actor_id    SMALLINT    NOT NULL PRIMARY KEY AUTO_INCREMENT,
        first_name  VARCHAR(45) NOT NULL,
        last_name   VARCHAR(45) NOT NULL,
        last_update TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
        INDEX idx_actor2_last_name (last_name)
);

INSERT INTO actor2(first_name,last_name,last_update)
SELECT first_name,last_name,last_update
FROM actor; 

-- now it is showing the actor_table_last_update
SELECT * FROM actor2;



-- RESETTING THE DATA
DELETE FROM actor WHERE actor_id > 200;
ALTER TABLE actor AUTO_INCREMENT = 200;
DESCRIBE actor;


-- TRANSACTION COMMIT ROLLBACK
-- EFFECT OF AUTO INCREMENT IN ROLLBACK
SELECT * FROM actor ORDER BY actor_id DESC;

-- create a transaction with Commit
-- and see the result

START TRANSACTION;
INSERT INTO actor(first_name,last_name) VALUES ('Tanvir','Rahman');
Commit;


 
START TRANSACTION;
INSERT INTO actor(first_name,last_name) VALUES ('ornob','ornik');
ROLLBACK;

START TRANSACTION;
INSERT INTO actor(first_name,last_name) VALUES ('Tanvir2','Rahman2');
Commit;

-- you see aftet the first commit 201 row is filled

-- then comes a rollback it rolls back the execution 
-- of the sql but the auto increment is already calculated alter

-- thats why in the third commit it starts with actor_id 203
--

START TRANSACTION;
-- first execute the command START TRANSACTION . it will start a transaction block

INSERT INTO actor(first_name,last_name) VALUES ('Tanvir3','Rahman3');
-- now insert the data and see the data with a select query
-- new data is added
-- now if you execute COMMIT then the data persisted 
-- but if you run ROLLBACK; the data that is added will be
-- removed;
-- but the index will be the next index of the rollback
-- because auto incrememnted data can't be rolled back
ROLLBACK;





-- ___________________________UPDATE_______________

-- syntax

-- UPDATE <table>
-- SET Field = "value"
-- WJHERE <CONDITION>

-- we can update data from multiple table value at once 
-- using dot notation

-- UPDATE table1,table2
-- SET table1.location = table2.location
-- WHERE table1.id = table2.id;

UPDATE actor
SET first_name = "Tanvir"
WHERE actor_id = 1;

SELECT * FROM actor;

UPDATE actor
SET first_name = "Tanvir1",
	last_name  = "Rahman1" 
Where actor_id = 1;
SELECT * FROM actor;

-- dont update value without a where clause 
-- otherwise it will update everything

-- multiple table update

SELECT * FROM actor LIMIT 10;
SELECT * FROM film  LIMIT 10;

-- we change both of the tables 
-- actor --name first row
-- film release_year first row

UPDATE actor,film
SET actor.first_name = "Tanvir",
	actor.last_name  = "Rahman",
    film.release_year = 2022
WHERE actor.actor_id = 1 AND film.film_id = 1;


SELECT * FROM actor LIMIT 2;
SELECT * FROM film  LIMIT 2;



-- RELATED UPDATE IN MANY TO MANY RELATIONSHIP
SELECT * fROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

UPDATE actor,film,film_actor
SET actor.first_name = "PENELOPE11",
	film.title = CONCAT(actor.first_name,' in ',film.title) 
WHERE actor.actor_id = 1 AND film.film_id = film_actor.film_id
AND  film_actor.actor_id = actor.actor_id;


-- EXPLANATION OF THE QUERY
/*
	1) first we have to specfy the table that we have to work with it
		* actor
        * film
        * film_actor (pivot table)
        
	2) we change the actor name directly lile
		set actor.first_name = "PENELOPE11" Where actor.actor_id = 1 
        thats straight forward
	3) now we change the film title film.title = <something>
		but which film?
        ans: that film whose film_id - is equal to the film_id of the film_actor table
	
    4) but whch row int film_table ?
		ans: that row where film_actor.actor_id = actor_id;
        
    
    
    
************************************************************************************************************
	5) remember we only know the actor id which is 1
    6) then we go to the pivot table film_actor and find the film_id there with the actor_id
    7) then with that id we search the film table and change its title
************************************************************************************************************		

*/








-- you can edit the primarykey with autoincrement
