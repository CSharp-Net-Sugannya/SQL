create function dbo.tch_name(@tch_id int)
returns varchar(20)
as
begin

Declare @returnvalue varchar(20)
select @returnvalue=tch_name from tbl_teacher 
where tch_id=@tch_id
return @returnvalue
End


