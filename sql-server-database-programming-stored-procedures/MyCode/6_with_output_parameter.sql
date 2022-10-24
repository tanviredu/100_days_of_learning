USE Contacts;
GO

CREATE PROCEDURE INSERTSTUDENTWITHOUTPUT
(
	@FirstName			  VARCHAR(50),
	@LastName			  VARCHAR(50),
	@DateOfBirth		  DATE = NULL,
	@AllowContactByPhone  BIT,
	@NewContactId         INT OUTPUT
)

AS

BEGIN;
	SET NOCOUNT ON;
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
	VALUES (@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);
	SELECT @NewContactId = SCOPE_IDENTITY();
END;


DECLARE @LastRowId	INT; 

EXEC INSERTSTUDENTWITHOUTPUT
@FirstName = 'Ataur',
@LastName = 'Rahman',
@AllowContactByPhone = 1,
--output variable data go oppsite direction
@NewContactId = @LastRowId OUTPUT; -- this OUTPUT KEYWORD MUST BE HERE OTHERWISE Value will  be NULL

SELECT * FROM Contacts WHERE ContactId = @LastRowId;
