CREATE PROCEDURE usp_DeleteCollegeDetails
       -- Add the parameters for the stored procedure here
       @clg_id int
AS
BEGIN

    -- Delete statements for procedure here
       DELETE tbl_College WHERE clg_id = @clg_id
END

EXECUTE usp_DeleteCollegeDetails 
@clg_id =8 ;

select * from tbl_College;