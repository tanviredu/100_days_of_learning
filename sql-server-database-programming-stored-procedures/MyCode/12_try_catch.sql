USE Contacts;
GO
CREATE PROCEDURE GETALLROLEOFACONTACTWITHTRYCATCH
(
	@ContactId	INT
)
AS
BEGIN;
BEGIN TRY;
	SELECT R.RoleTitle FROM Roles R
	JOIN ContactRoles CR
	ON CR.RoleId = R.RoleId
	JOIN Contacts C
	ON C.ContactId = CR.ContactId
	WHERE C.ContactId = @ContactId;

END TRY
BEGIN CATCH;
	PRINT 'ERROR PROVIDE A NUMERIC VALUE';
	PRINT 'ERROR MESSAGE IS : '+ ERROR_MESSAGE(); 
END CATCH;
END;

EXEC GETALLROLEOFACONTACTWITHTRYCATCH '100';
