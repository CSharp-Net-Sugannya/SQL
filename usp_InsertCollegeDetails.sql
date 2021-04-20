CREATE PROCEDURE usp_InsertCollegeDetails
       -- Add the parameters for the stored procedure here
       @clg_id int,
       @clg_name varchar(50),
       @clg_address varchar(50),
       @clg_phone_number integer
AS
BEGIN
      
    -- Insert statements for procedure here
       INSERT INTO tbl_College
              (clg_id, clg_name, clg_address, clg_phone_number)
       VALUES
              (@clg_id, @clg_name, @clg_address, @clg_phone_number)
END

execute usp_InsertCollegeDetails 
@clg_id=16,
@clg_name='Jain',
@clg_address='Belagavi',
@clg_phone_number=789065

select*from tbl_College;