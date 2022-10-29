USE [ContactsDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateContact]    Script Date: 10/29/2022 2:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateContact]
(
	@Id         INT,
	@FirstName  VARCHAR(50),
	@LastName   VARCHAR(50),
	@Company    VARCHAR(50),
	@Title      VARCHAR(50),
	@Email      VARCHAR(50)
)
AS
BEGIN;
	UPDATE Contacts
	SET
	FirstName = @FirstName,
	LastName = @LastName,
	Company  = @Company,
	Title    = @Title,
	Email    = @Email
	WHERE
	Id = @Id

END;