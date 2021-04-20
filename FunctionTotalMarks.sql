create function dbo.tbl_marks1()
returns varchar(20)
as
begin

Declare @returnvalue varchar(20)
select @returnvalue=sum(marks) from tbl_marks
return @returnvalue
End