CREATE FUNCTION TotalMarks(
    @marks INT
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @marks;
END;

