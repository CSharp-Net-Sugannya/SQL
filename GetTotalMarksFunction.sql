CREATE FUNCTION [dbo].[GetTotalMarks]
(
       -- Add the parameters for the function here
       @marks int
)
RETURNS varchar(50)
AS
BEGIN
       -- Declare the return variable here
       DECLARE @TotalMarks varchar(50)

       -- Add the T-SQL statements to compute the return value here
       SELECT  @marks = sum(marks)  FROM tbl_marks 

       -- Return the result of the function
       RETURN @marks

END

