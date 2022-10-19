USE sakila;

SELECT 
    first_name, last_name
FROM
    actor2;

SELECT 
    CONCAT(first_name, ' ', last_name) AS FulllName
FROM
    actor2;
    
SELECT UPPER(LEFT("tAnvIR",1));
-- SUBSTR(string,position where to start, len);
SELECT LOWER(SUBSTR("tAnvIR",2,length("tAnvIR")));

SELECT UPPER(LEFT("rAhmAN",1));
-- SUBSTR(string,position where to start, len);
SELECT LOWER(SUBSTR("rAhmAN",2,length("tAnvIR")));

SELECT 
CONCAT(
CONCAT(UPPER(LEFT(first_name,1)),LOWER(SUBSTR(first_name,2,length(first_name))))," ", 
CONCAT(UPPER(LEFT(last_name,1)),LOWER(SUBSTR(last_name,2,length(last_name))))) AS FULLNAME
FROM actor2;

-- create procedure that checks palindropme 

DELIMITER //
CREATE PROCEDURE CHECKPALIN(IN STR VARCHAR(100))
BEGIN
	SELECT IF(STR = REVERSE(STR),"PALINDROME","NOT PALINDROME");
END//
DELIMITER ;

CALL CHECKPALIN("AAA");

DELIMITER //
CREATE PROCEDURE CHECKPALIN2(IN STR VARCHAR(100),OUT STATUS VARCHAR(100))
BEGIN
	SELECT IF(STR = REVERSE(STR),"PALINDROME","NOT PALINDROME") INTO STATUS;
END//
DELIMITER ;

CALL CHECKPALIN2("TANVIR",@result1);
SELECT @result1;
CALL CHECKPALIN2("AAA",@result2);
SELECT @result2;

SELECT title,description FROM film;

SELECT title,REPLACE(description,'Database Administrator','DBA') Description  FROM film;





-- LIKE can find the pattern but not the position of word
-- locate can do that
SELECT 
    title,
    description,
    LENGTH(description) TotalLength,
    LOCATE('Database Administrator', description) FoundMatch
FROM
    film;
SELECT  title,description FROM film WHERE description LIKE '%Database Administrator%'; 



-- new Requirments
-- in the description start the text from database administrator
-- suppose in a description there is 'Database Administrator'
-- then you start the text from that

SELECT 
    title,
    LENGTH(description) TotalLength,
    LOCATE('Database Administrator', description) MatchINdex,
    SUBSTR(description,LOCATE('Database Administrator', description),LENGTH(description)) description
    
FROM
	film;
