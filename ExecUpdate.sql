USE [collegedb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Insertupdatedelete]
		@clg_id = 2,
		@clg_name = N'KLE',
		@clg_address = N'Belagavi',
		@clg_phone_number = 657432,
		@StatementType = N'Update'

SELECT	'Return Value' = @return_value

GO
