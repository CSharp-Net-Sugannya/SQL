CREATE PROCEDURE Insertupdatedelete (@clg_id            INT,  
                                          @clg_name    VARCHAR(50),  
                                          @clg_address VARCHAR(50),  
                                          @clg_phone_number INT,                                              
                                          @StatementType NVARCHAR(20) = '')  
AS  
  BEGIN  
      IF @StatementType = 'Insert'  
        BEGIN  
            INSERT INTO tbl_College  
                        (clg_id ,  
                         clg_name ,  
                         clg_address,  
                         clg_phone_number)  
            VALUES     ( @clg_id,  
                         @clg_name,  
                         @clg_address,  
                         @clg_phone_number)  
        END  
  
      IF @StatementType = 'Select'  
        BEGIN  
            SELECT *  
            FROM   tbl_College 
        END  
  
      IF @StatementType = 'Update'  
        BEGIN  
            UPDATE tbl_College
            SET    clg_name = @clg_name,  
                   clg_address = @clg_address,  
                   clg_phone_number = @clg_phone_number   
            WHERE  clg_id = @clg_id  
        END  
      ELSE IF @StatementType = 'Delete'  
        BEGIN  
            DELETE FROM tbl_College  
            WHERE  clg_id = @clg_id 
        END  
  END   