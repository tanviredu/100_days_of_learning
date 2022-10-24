USE Contacts;
GO
CREATE PROCEDURE GetContactByContactId
(
	@Contactid	INT
)
AS
BEGIN;
	SELECT * FROM Contacts WHERE ContactId = @Contactid;
END;
GO;

USE Contacts;
GO;
CREATE PROCEDURE NESTED2
(
	@FirstName				VARCHAR(50),
	@LastName				VARCHAR(50),
	@DateOfBirth			DATE = NULL,
	@AllowContactByPhone    BIT
)
AS
BEGIN;
	DECLARE @last_id INT;
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
	VALUES (@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);
	
	SELECT @last_id = SCOPE_IDENTITY();
	
	EXEC GetContactByContactId 
	@ContactId = @last_id;

END;

EXEC NESTED2
@FirstName = 'Ornik',
@LastName = 'Rahman',
@DateOfBirth = '1993-12-23',
@AllowContactByPhone = 1

