USE Contacts;
GO

CREATE PROCEDURE INSERTANDGETRECORDBACK
(
	@FirstName				VARCHAR(50) = 'DTanvir',  -- default calue
	@LastName				VARCHAR(50) = 'DRahman',
	@DateOfBirth			DATE = NULL, -- dateofbirth is a nullable field
	@AllowContactByPhone	BIT = 1

)
AS
BEGIN;
	
	-- insert statement
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
	VALUES(@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);

	-- find the id of the last inserted data 
	DECLARE @contactId INT;
	SELECT @contactId = SCOPE_IDENTITY();
	SELECT * FROM Contacts WHERE ContactId = @contactId;


END;

EXEC INSERTANDGETRECORDBACK
@FirstName = 'Enamoul',
@LastName  = 'Polash',
@AllowContactByPhone = 1