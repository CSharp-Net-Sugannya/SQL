USE [master]
GO
/****** Object:  Database [collegedb]    Script Date: 4/14/2021 11:00:35 PM ******/
CREATE DATABASE [collegedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'collegedb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\collegedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'collegedb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\collegedb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [collegedb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [collegedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [collegedb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [collegedb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [collegedb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [collegedb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [collegedb] SET ARITHABORT OFF 
GO
ALTER DATABASE [collegedb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [collegedb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [collegedb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [collegedb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [collegedb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [collegedb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [collegedb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [collegedb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [collegedb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [collegedb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [collegedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [collegedb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [collegedb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [collegedb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [collegedb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [collegedb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [collegedb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [collegedb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [collegedb] SET  MULTI_USER 
GO
ALTER DATABASE [collegedb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [collegedb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [collegedb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [collegedb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [collegedb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [collegedb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [collegedb] SET QUERY_STORE = OFF
GO
USE [collegedb]
GO
/****** Object:  UserDefinedFunction [dbo].[FUN_Details]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FUN_Details](@NAME NVARCHAR(100),@EMAIL NVARCHAR(100))  
RETURNS NVARCHAR(200)  
AS  
BEGIN  
RETURN (SELECT @NAME + ' ' + @EMAIL AS 'EMAIL');  
END;  
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalMarks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTotalMarks]
(
       -- Add the parameters for the function here
       @marks int
)
RETURNS varchar(50)
AS
BEGIN
       -- Declare the return variable here
       DECLARE @TotalMarks varchar(50)

       -- Add the T-SQL statements to compute the return value here
       SELECT  @marks = sum(marks)  FROM tbl_marks 

       -- Return the result of the function
       RETURN @marks

END
GO
/****** Object:  UserDefinedFunction [dbo].[tch_name]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[tch_name](@tch_id int)
returns varchar(20)
as
begin

Declare @returnvalue varchar(20)
select @returnvalue=tch_name from tbl_teacher 
where tch_id=@tch_id
return @returnvalue
End
GO
/****** Object:  UserDefinedFunction [dbo].[Total_Marks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Total_Marks](
@marks int
)
returns dec(7,2)
as
begin
return @marks;
end

GO
/****** Object:  UserDefinedFunction [dbo].[TotalMarks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TotalMarks](
    @marks INT
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @marks;
END;
GO
/****** Object:  Table [dbo].[tbl_marks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marks](
	[mrks_id] [int] NOT NULL,
	[std_id] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[marks] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mrks_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMarks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  UserDefinedFunction [dbo].[Marks]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[Marks]
(
@marks int,
@marks1 int
)
RETURNS TABLE
AS
RETURN
SELECT * FROM tbl_marks
WHERE marks BETWEEN @marks AND @marks1
GO
/****** Object:  Table [dbo].[tbl_College]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_College](
	[clg_id] [int] NOT NULL,
	[clg_name] [varchar](50) NOT NULL,
	[clg_address] [varchar](50) NOT NULL,
	[clg_phone_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[clg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[clg_phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student](
	[std_id] [int] NOT NULL,
	[roll_no] [int] NULL,
	[std_name] [varchar](40) NOT NULL,
	[clg_id] [int] NOT NULL,
	[std_phone_no] [int] NULL,
	[std_gender] [varchar](10) NOT NULL,
	[std_email] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[std_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[std_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[std_phone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subjects]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subjects](
	[sub_id] [int] NOT NULL,
	[sub_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_teacher]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_teacher](
	[tch_id] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[tch_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_marks]  WITH CHECK ADD  CONSTRAINT [student_id] FOREIGN KEY([std_id])
REFERENCES [dbo].[tbl_student] ([std_id])
GO
ALTER TABLE [dbo].[tbl_marks] CHECK CONSTRAINT [student_id]
GO
ALTER TABLE [dbo].[tbl_marks]  WITH CHECK ADD  CONSTRAINT [subject_id] FOREIGN KEY([sub_id])
REFERENCES [dbo].[tbl_subjects] ([sub_id])
GO
ALTER TABLE [dbo].[tbl_marks] CHECK CONSTRAINT [subject_id]
GO
ALTER TABLE [dbo].[tbl_student]  WITH CHECK ADD  CONSTRAINT [college_id] FOREIGN KEY([clg_id])
REFERENCES [dbo].[tbl_College] ([clg_id])
GO
ALTER TABLE [dbo].[tbl_student] CHECK CONSTRAINT [college_id]
GO
ALTER TABLE [dbo].[tbl_teacher]  WITH CHECK ADD  CONSTRAINT [subj_id] FOREIGN KEY([sub_id])
REFERENCES [dbo].[tbl_subjects] ([sub_id])
GO
ALTER TABLE [dbo].[tbl_teacher] CHECK CONSTRAINT [subj_id]
GO
/****** Object:  StoredProcedure [dbo].[College_CRUD]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[College_CRUD]
      @Action VARCHAR(10)
      ,@clg_id int = NULL
      ,@clg_name varchar(50) = NULL
      ,@clg_address varchar(50) = NULL
	  ,@clg_phone_number integer
AS
BEGIN
      SET NOCOUNT ON;
 
      --SELECT
      IF @Action = 'SELECT'
      BEGIN
            SELECT clg_id , clg_name, clg_address,clg_phone_number
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
GO
/****** Object:  StoredProcedure [dbo].[GetStudentID]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentID]
AS
    DECLARE @ID NUMERIC (10) 
    SET @ID = @ID
BEGIN
    SELECT * 
    FROM [tbl_student] 
    WHERE std_id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[Insertupdatedelete]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertupdatedelete] (@clg_id            INT,  
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
GO
/****** Object:  StoredProcedure [dbo].[marks1]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[marks1]
As
select * from tbl_marks
Go;
GO
/****** Object:  StoredProcedure [dbo].[student]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[student]
@std_id int
AS
select * from tbl_student where std_id=@std_id
GO
/****** Object:  StoredProcedure [dbo].[studentDetails]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[studentDetails] 
AS  
BEGIN  
  
SELECT std_name,std_email,std_gender,marks
FROM tbl_student  
INNER JOIN tbl_marks 
ON tbl_student.std_id = tbl_marks.std_id  
END  
GO
/****** Object:  StoredProcedure [dbo].[studentDetails1]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[studentDetails1] 
AS  
BEGIN  
  
SELECT std_name,std_email,std_gender,marks
FROM tbl_student  
INNER JOIN tbl_marks 
ON tbl_student.std_id = tbl_marks.std_id  
where marks>92
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCollegeDetails]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteCollegeDetails]
       -- Add the parameters for the stored procedure here
       @clg_id int
AS
BEGIN

    -- Delete statements for procedure here
       DELETE tbl_College WHERE clg_id = @clg_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCollegeDetails]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertCollegeDetails]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCollegeDetails]    Script Date: 4/14/2021 11:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateCollegeDetails]
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
GO
USE [master]
GO
ALTER DATABASE [collegedb] SET  READ_WRITE 
GO
