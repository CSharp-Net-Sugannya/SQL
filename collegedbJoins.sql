CREATE PROCEDURE studentDetails1 
AS  
BEGIN  
  
SELECT std_name,std_email,std_gender,marks
FROM tbl_student  
INNER JOIN tbl_marks 
ON tbl_student.std_id = tbl_marks.std_id  
where marks>92
END  

Exec studentDetails1;