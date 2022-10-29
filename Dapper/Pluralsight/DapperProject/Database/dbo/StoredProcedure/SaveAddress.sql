USE [ContactsDB]
GO
/****** Object:  StoredProcedure [dbo].[SaveAddress]    Script Date: 10/29/2022 2:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SaveAddress]
(
	@Id			   INT OUTPUT,
	@ContactId     INT,
	@AddressType   VARCHAR(50),
	@StreetAddress VARCHAR(50),
	@City          VARCHAR(50),
	@StateId       INT,
	@PostalCode    VARCHAR(20)
)
AS
BEGIN;
	INSERT INTO Addresses
	(	ContactId,
		AddressType,
		StreetAddress,
		City,
		StateId,
		PostalCode
	)
	VALUES
	(
		@ContactId,
		@AddressType,
		@StreetAddress,
		@City,
		@StateId,
		@PostalCode
	)
	SELECT @Id = CAST(SCOPE_IDENTITY() as INT)
END;