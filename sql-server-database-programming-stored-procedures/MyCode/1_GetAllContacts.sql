-------------------------------------
USE Contacts;
GO
CREATE PROCEDURE GETALLCONTACTS
AS
BEGIN;
	SELECT * FROM Contacts;
END;
--------------------------------------
EXEC GETALLCONTACTS;             -- executing the command

DROP PROCEDURE GETALLCONTACTS;   -- drop procedure


