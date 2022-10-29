USE [ContactsDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAddress]    Script Date: 10/29/2022 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateAddress]
(
	@Id			   INT,
	@ContactId     INT,
	@AddressType   VARCHAR(50),
	@StreetAddress VARCHAR(50),
	@City          VARCHAR(50),
	@StateId       INT,
	@PostalCode    VARCHAR(20)
)
AS
BEGIN;
	UPDATE Addresses
	SET
	ContactId     = @ContactId,
	AddressType   = @AddressType,
	StreetAddress = @StreetAddress,
	City          = @City,
	StateId       = @StateId,
	PostalCode    = @PostalCode
	WHERE
	Id = @Id
	
END;