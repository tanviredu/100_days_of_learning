USE Contacts;
GO
CREATE PROCEDURE ControllStructureIfExists1
(
	@FirstName				VARCHAR(50),
	@LastName				VARCHAR(50),
	@DateOfBirth			DATE = NULL,
	@AllowContactByPhone    BIT
)
AS
	-- first check if there is already value exists
	-- with the same firstname,lastname and date of birth
	-- if exists and if not exists
	-- if the condition not met the following 
	-- line wil be affected
	-- IF NOT EXISTS TAKE A SUBQUERY
IF NOT EXISTS(SELECT ContactId FROM Contacts WHERE
			FirstName = @FirstName
			AND
			LastName = @LastName
			AND
			DateOfBirth = @DateOfBirth

)

BEGIN;
	INSERT INTO Contacts(FirstName,LastName,DateOfBirth,AllowContactByPhone)
		VALUES (@FirstName,@LastName,@DateOfBirth,@AllowContactByPhone);
	DECLARE @last_id INT; -- it does not matter where you declare
						  -- you can use out of the scope too
						-- 
	SELECT @last_id = SCOPE_IDENTITY();
END;

EXEC GetContactByContactId 
	@ContactId = @last_id; -- like this

EXEC ControllStructureIfExists1
@FirstName = 'Ornik',
@LastName = 'Rahman',
@DateOfBirth = '1993-12-23',
@AllowContactByPhone = 1


SELECT * FROM Contacts ORDER BY ContactId DESC;