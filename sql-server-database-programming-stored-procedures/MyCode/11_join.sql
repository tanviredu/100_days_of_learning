USE Contacts;
SELECT * FROM Roles;
SELECT * FROM ContactRoles;
SELECT * FROM Contacts;
GO
-- get all the roles of a contact
-- get all the contacts of a roll
-- 2 stored procedure no return type
CREATE PROCEDURE GETALLROLEOFACONTACT
(
	@ContactId	INT
)
AS
BEGIN;
	SELECT R.RoleTitle FROM Roles R
	JOIN ContactRoles CR
	ON CR.RoleId = R.RoleId
	JOIN Contacts C
	ON C.ContactId = CR.ContactId
	WHERE C.ContactId = @ContactId;
END;

EXEC GETALLROLEOFACONTACT 2;

GO
USE Contacts;
GO

CREATE PROCEDURE GETALLCONTACTOFAROLE
(
	@RoleId		INT
)
AS
BEGIN;
	SELECT CONCAT(C.FirstName,' ',C.LastName) FROM Contacts C
	JOIN ContactRoles CR
	ON CR.ContactId = C.ContactId
	JOIN Roles R
	ON CR.RoleId = R.RoleId 
	WHERE R.RoleId = @RoleId;
END;
EXEC GETALLCONTACTOFAROLE 1;