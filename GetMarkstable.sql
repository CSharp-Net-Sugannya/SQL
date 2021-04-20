CREATE FUNCTION [dbo].[GetMarks]
(
       @marks int
)
RETURNS TABLE
AS
RETURN
(
       -- Add the SELECT statement with parameter references here
       SELECT * FROM tbl_marks WHERE marks >=  @marks
)