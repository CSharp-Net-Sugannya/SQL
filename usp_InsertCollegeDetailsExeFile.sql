USE [collegedb]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[usp_InsertCollegeDetails]
		@clg_id = 15,
		@clg_name = N'SSIT',
		@clg_address = N'Davanger',
		@clg_phone_number = 912345

SELECT	'Return Value' = @return_value

GO
