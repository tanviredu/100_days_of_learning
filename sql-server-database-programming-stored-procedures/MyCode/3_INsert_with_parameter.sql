USE Contacts;
GO

CREATE PROCEDURE INSERTCONCATSWITHPARAMETER
(
	@FirstName				VARCHAR(50),
	@LastName				VARCHAR(50),
	@DateOfBirth			DATE = NULL, -- dateofbirth is a nullable field
	@AllowContactByPhone	BIT

)
AS
BEGIN;
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
	VALUES(@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);
END;

EXEC INSERTCONCATSWITHPARAMETER 'Tanvir','Rahman','1993-12-23',1;

SELECT * FROM Contacts ORDER BY ContactId DESC;