USE [collegedb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Insertupdatedelete]
		@clg_id = 17,
		@clg_name = N'BUB',
		@clg_address = N'Hubli',
		@clg_phone_number = 876543,
		@StatementType = N'Insert'

SELECT	'Return Value' = @return_value

GO
