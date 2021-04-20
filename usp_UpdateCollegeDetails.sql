CREATE PROCEDURE usp_UpdateCollegeDetails
       -- Add the parameters for the stored procedure here
       @clg_id int,
       @clg_name varchar(50),
       @clg_address varchar(50),
       @clg_phone_number integer
AS
BEGIN

    -- update statements for procedure here
       UPDATE tbl_College  SET clg_name = @clg_name, clg_address = @clg_address,
              clg_phone_number = @clg_phone_number WHERE clg_id =@clg_id
END

EXECUTE usp_UpdateCollegeDetails 
@clg_id =15 ,
@clg_name = 'SIT',
@clg_address='Bangalore',
@clg_phone_number=456789;

select * from tbl_College;