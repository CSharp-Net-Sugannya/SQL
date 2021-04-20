CREATE PROCEDURE [dbo].[College_CRUD]
      @Action VARCHAR(10)
      ,@clg_id int = NULL
      ,@clg_name varchar(50) = NULL
      ,@clg_address varchar(50) = NULL
	  ,@clg_phone_number integer
AS
BEGIN
      --SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT clg_id , clg_name, clg_address, clg_phone_number
            FROM tbl_College
      END
 
      --INSERT
      IF @Action = 'INSERT'
      BEGIN
            INSERT INTO tbl_College(clg_name, clg_address,clg_phone_number)
            VALUES (@clg_name, @clg_address,@clg_phone_number)
      END
 
      --UPDATE
      IF @Action = 'UPDATE'
      BEGIN
            UPDATE tbl_College
            SET clg_name = @clg_name, clg_address = @clg_address,clg_phone_number=@clg_phone_number
            WHERE clg_id = @clg_id
      END
 
      --DELETE
      IF @Action = 'DELETE'
      BEGIN
            DELETE FROM tbl_College
            WHERE clg_id = @clg_id
      END
END

EXEC [dbo].[College_CRUD] @Action = 'INSERT'
                  ,@clg_name = 'Siddaganga'
                  ,@clg_address = 'Bangalore',
				  @clg_phone_number=789012;
