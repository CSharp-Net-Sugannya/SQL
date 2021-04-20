--Creating function for Marks
create FUNCTION Marks
(
@marks int,
@marks1 int
)
RETURNS TABLE
AS
RETURN
SELECT * FROM tbl_marks
WHERE marks BETWEEN @marks AND @marks1

--calling Marks function
SELECT *
FROM
Marks(90, 99)
ORDER BY 
marks

--checking boolean condition
Declare @marks Int=100;
if @marks > 90
print 'passed,congratulations!!';
else
print 'Failed,Try Again';

