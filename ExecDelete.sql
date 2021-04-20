USE [collegedb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Insertupdatedelete]
		@clg_id = 10,
		@clg_name = N'GIT College',
		@clg_address = N'Belagavi',
		@clg_phone_number = 89066543,
		@StatementType = N'Delete'

SELECT	'Return Value' = @return_value

GO
