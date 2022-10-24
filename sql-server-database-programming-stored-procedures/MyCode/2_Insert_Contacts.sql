USE Contacts;
GO

CREATE PROCEDURE INSERTCONTACT
AS
BEGIN;

DECLARE @FirstName				VARCHAR(50),
		@LastName				VARCHAR(50),
		@DateOfBirth			DATE,
		@AllowContactByPhone	BIT;

SELECT  @FirstName ='Stan',
		@LastName = 'Leural',
		@DateOfBirth = '1993-12-23',
		@AllowContactByPhone = 0

INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
VALUES (@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);

END;