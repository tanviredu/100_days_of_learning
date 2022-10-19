/*
	IF STATE MENT IS LIKE A TARNERY OPERATOR 
    IN ANU PROGRAMMING LAHGUAGE
    LIKE
    <CONDITION>?<IF MET>:<IF NOT MET>

*/

USE sakila;
-- IF(EXPRESSTION,'EXPRESSION/RESULT IF CORRECT','EXPRESSION/RESULT IF NOT CORRECT');
-- iT CAN BE NESTED

SELECT IF("TRUE" = "TRUE","Correct","InCorrect") as VALUE1;
SELECT IF("TRUE" = "T","Correct","InCorrect") as VALUE2;
SELECT IF("TRUE" <> "T","Correct","InCorrect") as VALUE3;
SELECT IF("TRUE" <> "TRUE","Correct","InCorrect") as VALUE4;


SELECT film_id,title,
CASE
	WHEN rating = "G" THEN "GENERAL"
    WHEN rating IN ("PG","PG-13") THEN "PARENTAL GUIDENCE"
ELSE "NOT FOR KIDS" END VIEWSTATUS
FROM film limit 9; 

-- second or third parameter can be a result or another expression

SELECT film_id,title,
	IF( rating = "G","GENERAL",IF(rating IN ("PG","PG-13"),"PARENTAL GUIDENCE","NOT FOR KIDS")) AS ViewStatus
FROM film limit 9;

SELECT film_id,title,length,
	CASE 
		WHEN length BETWEEN 46 AND 70 THEN "SMALL LENGTH FILM"
		WHEN length BETWEEN 71 AND 110 THEN "MEDIUM LENGTH FILM" 
        WHEN length BETWEEN 111 AND 185 THEN "LONG LENGTH FILM"
    ELSE "UNKNOWN LENGTH" END AS DUR 
FROM film LIMIT 10;



SELECT film_id,title,length,
	IF(length BETWEEN 46 AND 70,"Small Length Film",
    If(length BETWEEN 71 AND 110,"MEDIUM LENGTH FILM",
    IF (length BETWEEN 111 AND 185,"LONG LENGTH FILM","UNKNOWN LENGTH"))) AS FILM_LENGTH
FROM film LIMIT 10;


