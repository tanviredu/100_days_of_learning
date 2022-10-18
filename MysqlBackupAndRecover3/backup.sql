

-- 1) COMMAND FOR BACKUP DATABASE
-- 2) WE SUSE SAKILA DATABASE FOR BACKING UP
-- 3) YOU HAVE TO DO IT IN COMMAND LINE
-- 4) 'mysqldump' COMMAND WILL BE USED

-- backup single sakila database command
-- -> mysqldump -h <hostname> -u [user] -p [database_name] > [output_file_location]
-- example
-- -> mysqldump -h 127.0.0.1 -u root -p sakila > F:\sqlbackup\new\singlebackup.sql
-- sakila is not the password it is the database name
-- password will be asked when you excecuted the statement

-- backup multiple database at once 
-- we use the database sakila and world
-- command
-- the difference between single and multiple database is
-- in multiple database backup you use a flag called --databases
-- and in multiple database backup you give multiple database name 
-- separated by space insted of one
-- -> mysqldump -h 127.0.0.1 -u root -p --databases sakila world > F:\sqlbackup\new\numtipledatabasebackup.sql

-- backup all the database (everything) every database
-- it will backup everything
-- command
-- -> mysqldump -h [host] -u [user] -p --all-databases > [output_location/allbackup.sql]

-- example
-- -> mysqldump -h 127.0.0.1 -u root -p --all-databases > F:\sqlbackup\new\all.sql

-- SINGLE TABLE BACKUP FROM DATABASE
-- ONLY JUST THE TABLE
-- we use the table 'rental' from the sakila database
-- SYNTAX

-- example
-- > mysqldump -h 127.0.0.1 -u root -p --databases sakila --tables rental > F:\sqlbackup\new\all.sql

  

-- backing up storeprocedure,storedfunction,Trigger,Event
-- no table creating code
-- no data 
-- just the logic in routines
-- routines means storeprocedure,storedfunction,Trigger,Event
-- just the logic
-- we will make a backup of sp,sf,trigger,and event or we call routines in combined
-- Syntax:
-- -> mysqldump -h [host] -u [user] -p --databases [database name] -- routines [sp/sf/trigger/event] --no-create-info [no table creation code] --no-data [no inserted data code] --no-create-db [no database create] --skip-opt [no additional options] > output.sql
-- example
-- -> mysqldump -h 127.0.0.1 -u root -p --databases sakila --routines --no-create-info --no-data --no-create-db --skip-opt > F:\100_days_of_learning\BACKUP_GENERATED_BY_MYSQLDUMP\routines.sql






-- ---------------------------- RESTORE FROM BACKUP ---------------------------------------

-- common syntax for mysql restore
-- taking backup
	-- mysqldump <databas> > back.sql
-- taking restore
	-- mysql <database> < back.sql
    
    
-- restore single database
-- process
-- First you need to create a new database
-- command
-- -> CREATE DATABASE sakila_second;
-- then go to command line
-- and this command

-- -> mysql -h 127.0.0.1 -u root -p sakila_second < F:\100_days_of_learning\BACKUP_GENERATED_BY_MYSQLDUMP\sakilabackup.sql;

-- What if you dont make a database
-- and dont put anything after -p 
-- like if the command is 
-- -> mysql -h 127.0.0.1 -u root -p  < F:\100_days_of_learning\BACKUP_GENERATED_BY_MYSQLDUMP\sakilabackup.sql;
-- Then the database will replace the existing database sakila
-- so be careful about that
