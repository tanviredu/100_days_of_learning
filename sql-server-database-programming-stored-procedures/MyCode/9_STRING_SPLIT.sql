USE Contacts;
GO
CREATE PROCEDURE InsertContactNotes
(
	@ContactId		INT,
	@Notes          VARCHAR(50)
)
AS
BEGIN;
	INSERT INTO ContactNotes(ContactId,Notes)
	SELECT @ContactId,value 
	FROM STRING_SPLIT(@Notes,',');

SELECT * FROM ContactNotes
		 WHERE ContactId = @ContactId
		 ORDER BY NoteId DESC;

END;





SELECT * FROM ContactNotes;

SELECT value FROM STRING_SPLIT('tanvir rahman,hasnat rabi,ehsan uddin aidid',',');
-- it will split into 3 row becauase 
-- there three comma separeted value

EXEC InsertContactNotes
@ContactId = 10,
@Notes = 'tanvir,rahman,ornob,ornik'

