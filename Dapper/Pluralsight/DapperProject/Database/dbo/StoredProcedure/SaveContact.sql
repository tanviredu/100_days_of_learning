USE [ContactsDB]
GO
/****** Object:  StoredProcedure [dbo].[SaveContact]    Script Date: 10/29/2022 2:04:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SaveContact]
(
	@Id         INT OUTPUT,
	@FirstName  VARCHAR(50),
	@LastName   VARCHAR(50),
	@Company    VARCHAR(50),
	@Title      VARCHAR(50),
	@Email      VARCHAR(50)
)
AS
BEGIN;
	INSERT INTO Contacts
	(
		FirstName,
		LastName,
		Company,
		Title,
		Email
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@Company,
		@Title,
		@Email
	);
	SELECT @Id = CAST(SCOPE_IDENTITY() AS INT);

END;