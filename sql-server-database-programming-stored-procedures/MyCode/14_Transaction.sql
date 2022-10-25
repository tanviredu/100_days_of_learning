-- EVERY STORED PROCEDURE RETURN a RETURNVALUE
-- if IT IS 0 then means Successfull
-- other number is unsuccessfull

USE Contacts;
GO
CREATE PROCEDURE GET_ALL_ROLE_OF_A_CONTACT_TRANSACTION
(
	@ContactId	INT
)
AS
BEGIN;
BEGIN TRY;
BEGIN TRANSACTION;
	SELECT R.RoleTitle FROM Roles R
	JOIN ContactRoles CR
	ON CR.RoleId = R.RoleId
	JOIN Contacts C
	ON C.ContactId = CR.ContactId
	WHERE C.ContactId = @ContactId;
	PRINT 'SUCCESSFULLY FETCHED';
COMMIT TRANSACTION;
END TRY
BEGIN CATCH;
	PRINT 'ERROR PROVIDE A NUMERIC VALUE';
	PRINT 'ERROR MESSAGE IS : '+ ERROR_MESSAGE();
	ROLLBACK TRANSACTION;
	RETURN -1; -- unsuccesful
END CATCH;
RETURN 0; -- success
END;

DECLARE @RETURNSTATUS INT;
EXEC @RETURNSTATUS  = GET_ALL_ROLE_OF_A_CONTACT_TRANSACTION 5;

PRINT 'STATUS '+ CONVERT(VARCHAR(10),@RETURNSTATUS);