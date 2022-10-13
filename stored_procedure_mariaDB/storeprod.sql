-- STORED PROCEDURE
-- CREATE 
-- ALTER
-- DELETE
-- WE USE THE SAKILA DATABASE 
-- TO MAKE STORED PROCEDURE
SELECT @@VERSION;
-- using database
USE sakila;
-- create stored procedure
-- using static data
DELIMITER //
CREATE PROCEDURE FirstProc()
BEGIN
	SELECT 1 AS RESULT;
END//
DELIMITER ;
CALL FirstProc();
-- create procedure with sakila actors table
DELIMITER //
CREATE PROCEDURE Get_All_Actor()
BEGIN
	SELECT * FROM actor;
END//
DELIMITER ;
CALL Get_All_Actor();
-- drop procedure
DROP PROCEDURE Get_All_Actor;
-- parameterized Stored procedure
-- in parameterized Stored Procedure 
-- every parameter has 3 part
-- 1) Data direction IN/OUT,Name Of the Parameter,DataType
-- 2) in means parameter input
-- 3) OUT will hold the output

DELIMITER //
CREATE PROCEDURE GetActorByID(IN ActorId INT)
BEGIN
	SELECT * FROM sakila.actor 
    WHERE 
    sakila.actor.actor_id = ActorId;
    
END//
DELIMITER ;

-- lets check the data
SELECT * FROM sakila.actor;
CALL GetActorByID(1);
CALL GetActorByID(2);
CALL GetActorByID(3);
CALL GetActorByID(4);
CALL GetActorByID(5);

SELECT * FROM sakila.actor LIMIT 5;


-- WORKING WITH BOTH IN AND OUT
-- GET THE FULLNAME FROM FIRST NAME AND LAST NAME

USE sakila;

DELIMITER //
CREATE PROCEDURE Get_Full_Name(IN ActorId INT,OUT FullName VARCHAR(100))
BEGIN
	SELECT CONCAT(first_name,' ',last_name) INTO FullName
    FROM actor
    WHERE actor_id = ActorId;
END//
DELIMITER ;

CALL GetActorByID(1);
CALL Get_Full_Name(1,@FullName);
SELECT @FullName AS ActorName;
CALL Get_Full_Name(2,@FullName);
SELECT @FullName AS ActorName;
-- LENGTH OF THE FULL NAME
SELECT CONCAT("NAME : ",@FullName," Length",LENGTH(@FullName));




-- WRITE A STORED PROCEDURE
-- TWO IN PARAMETER 1. NEW_FIRST_NAME 2. NEW_LAST_NAME
-- THEN CHANGE THE OLD FIRST AND LAST NAME WITH IT
-- OUTPUT THE OLDNAME AND NEWNAME WITH CONCAT() FUNCTION
-- MEANS TWO OUTPUT 1) OLD NAME 2) NEW NAME

DELIMITER //
CREATE PROCEDURE CHANGE_NAME(IN ActorId INT ,IN NFIRST VARCHAR(100),IN NLAST VARCHAR(100),OUT OLDNAME VARCHAR(100),OUT NEWNAME VARCHAR(100))
BEGIN
	-- first get the old
	SELECT CONCAT(first_name,' ',last_name) INTO OLDNAME  
    FROM actor Where actor_id = ActorId;
    -- then update
    UPDATE actor
    SET first_name = NFIRST,last_name = NLAST
    WHERE actor_id = ActorId;
    -- then fetch the new
    SELECT CONCAT(first_name,' ',last_name) INTO NEWNAME  
    FROM actor Where actor_id = ActorId;
    
    
END//
DELIMITER ;

-- SELECT Concat(first_name,' ',last_name)  FROM actor Where Actor_id = 1;

SELECT first_name,last_name from actor WHERE actor_id = 1;
CALL CHANGE_NAME(1,'Tanvir','Rahman',@oldname,@newnamea);
SELECT first_name,last_name from actor WHERE actor_id = 1;
SELECT @oldname;
select @newnamea;


-- now do that with nested stored procedure
-- we need 2 stored procedure and break 
-- the logic inside the sp
-- into 2 sp that communicate with each other
DELIMITER //
CREATE PROCEDURE CHANGE_NAME(IN ActorId INT ,IN NFIRST VARCHAR(100),IN NLAST VARCHAR(100),OUT OLDNAME VARCHAR(100),OUT NEWNAME VARCHAR(100))
BEGIN
	-- first get the old
	SELECT CONCAT(first_name,' ',last_name) INTO OLDNAME  
    FROM actor Where actor_id = ActorId;
    -- then update
    UPDATE actor
    SET first_name = NFIRST,last_name = NLAST
    WHERE actor_id = ActorId;
    -- then fetch the new
    SELECT CONCAT(first_name,' ',last_name) INTO NEWNAME  
    FROM actor Where actor_id = ActorId;
    
    
END //
DELIMITER ;

-- 1) CONCAT THE NAME 
DELIMITER //
CREATE PROCEDURE CONCATTEDNAME(IN ActorId INT,IN first_name VARCHAR(100),IN last_name VARCHAR(100),OUT result VARCHAR(100))
BEGIN
	SELECT CONCAT(first_name,' ',last_name) INTO result
    from actor WHERE actor_id = ActorId; 
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CONCATTEDNAMEbasic(IN ActorId INT,OUT result VARCHAR(100))
BEGIN
	SELECT CONCAT(first_name,' ',last_name) INTO result
    from actor WHERE actor_id = ActorId; 
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UPDATENAME3(IN ActorId INT ,IN NFIRST VARCHAR(100),IN NLAST VARCHAR(100),OUT OLDNAME VARCHAR(100),OUT NEWNAME VARCHAR(100))
BEGIN
	CALL CONCATTEDNAMEbasic(ActorId,@result1);
    SELECT @result1 INTO OLDNAME;
    
    UPDATE actor
    SET first_name = NFIRST,last_name = NLAST
    WHERE actor_id = ActorId;
    
    CALL CONCATTEDNAME(ActorId,NFIRST,NLAST,@result2);
    SELECT @result2 INTO NEWNAME;
    
END//
DELIMITER ;

CALL UPDATENAME3(3,'tWWw','TXXw',@oldN,@newN);
SELECT first_name,last_name from actor WHERE actor_id = 3;
SELECT @oldN;
select @newN;


-- NOW WORKING WITH UPDATE

DELIMITER //
CREATE PROCEDURE TRYUPDATENAME(IN ActorId INT,IN NFIRST VARCHAR(100),IN NLAST VARCHAR(100))
BEGIN
	UPDATE actor
    SET first_name = NFIRST,last_name = NLAST
    WHERE actor_id = ActorId;
     
END//
DELIMITER ;




-- THE FINAL NESTED WORK
-- WORKING PERFETLY

DELIMITER //
CREATE PROCEDURE UPDATENAME4(IN ActorId INT ,IN NFIRST VARCHAR(100),IN NLAST VARCHAR(100),OUT OLDNAME VARCHAR(100),OUT NEWNAME VARCHAR(100))
BEGIN
	CALL CONCATTEDNAMEbasic(ActorId,@result1);
    SELECT @result1 INTO OLDNAME;
	CALL TRYUPDATENAME(ActorId,NFIRST,NLAST);
    CALL CONCATTEDNAMEbasic(ActorId,@result2);
    SELECT @result2 INTO NEWNAME;
    
END//
DELIMITER ;

CALL UPDATENAME4(4,'tWWw','TXXw',@oldN,@newN);
SELECT first_name,last_name from actor WHERE actor_id = 4;
SELECT @oldN;
select @newN;

