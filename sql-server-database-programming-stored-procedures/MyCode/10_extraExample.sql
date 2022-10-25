USE Contacts;
GO
ALTER PROCEDURE INSERT_CONTACT_ADDRE
(
	@ContactId			INT,
	@HouseNumber		VARCHAR(200),
	@Street				VARCHAR(200),
	@City				VARCHAR(200),
	@Postcode			VARCHAR(20)
)
AS
BEGIN;
	-- format the Street and City
	-- then insert the value
	SELECT @City   = CONCAT(UPPER(LEFT(@city,1)),LOWER(RIGHT(@city,LEN(@city)-1)));
	SELECT @Street = CONCAT(UPPER(LEFT(@Street,1)),LOWER(RIGHT(@Street,LEN(@Street)-1)));
	
	INSERT INTO ContactAddresses(ContactId,HouseNumber,Street,City,Postcode)
	VALUES(@ContactId,@HouseNumber,@Street,@City,@Postcode);
	DECLARE @Last_Id INT;
	SELECT @Last_Id = SCOPE_IDENTITY();
	SELECT * FROM ContactAddresses WHERE ContactId = @ContactId;
END;

--SELECT CONCAT(UPPER(LEFT(value,1)),LOWER(RIGHT(value,LEN(value)-1)))
--FROM STRING_SPLIT('tAnVIR raHMAN',' ');

EXEC INSERT_CONTACT_ADDRE
@ContactId = 24,
@HouseNumber = '10',
@Street = 'Dumpling Street',
@City = 'Chittagong',
@Postcode = '4204'
