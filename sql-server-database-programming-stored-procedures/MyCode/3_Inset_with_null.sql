USE Contacts;
GO

CREATE PROCEDURE INSERTCONCATSWITHPARAMETERWITHNNULL
(
	@FirstName				VARCHAR(50) = 'DTanvir',  -- default calue
	@LastName				VARCHAR(50) = 'DRahman',
	@DateOfBirth			DATE = NULL, -- dateofbirth is a nullable field
	@AllowContactByPhone	BIT = 1

)
AS
BEGIN;
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
	VALUES(@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);
END;

-- this is another way of calling stored procedure
EXEC INSERTCONCATSWITHPARAMETERWITHNNULL
@FirstName = 'Hasnat',
@LastName  = 'Rabi',
@AllowContactByPhone = 1

SELECT * FROM Contacts ORDER BY ContactId DESC;

EXEC INSERTCONCATSWITHPARAMETERWITHNNULL; -- without any parameter then the default will be saved

SELECT * FROM Contacts ORDER BY ContactId DESC;