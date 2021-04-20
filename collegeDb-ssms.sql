create database collegedb
use collegedb

create table tbl_College(clg_id int primary key,
						clg_name varchar(50) not null,
                        clg_address varchar(50) not null,
                        clg_phone_number integer unique);

select * from tbl_College;

insert into tbl_College values(1,'Jain College','Belagavi',89076543);
insert into tbl_College values(2,'SSIT College','Dhavangere',89076531);
insert into tbl_College values(3,'Bharatesh College','Belagavi',98076543);
insert into tbl_College values(4,'Dayanandha sagar College','Bengalore',89033543);
insert into tbl_College values(5,'New horizon College','Bengalore',89071543);
insert into tbl_College values(6,'Gogate College','Belagavi',89067543);
insert into tbl_College values(7,'people Tree College','Hubli',89076523);
insert into tbl_College values(8,'Sharadha College','Dharawad',89071143);
insert into tbl_College values(9,'KLE College','Belagavi',89018543);
insert into tbl_College values(10,'GIT College','Belagavi',89066543);
insert into tbl_College values(11,'Chethana College','Mysore',89077543);
insert into tbl_College values(12,'RLS College','Hubli',99016543);



create table  tbl_student(std_id int primary key,
						 roll_no int unique,
                         std_name varchar(40)not null,
                        clg_id int not null,                       /*FK*/
                         std_phone_no int unique,
                         std_gender varchar(10) not null,
                         std_email varchar(40) unique,
							constraint college_id foreign key(clg_id) references tbl_College(clg_id));

select * from tbl_student;

insert into tbl_student values(11,111,'Nayana',1,980654,'Female','nayana@gmail.com');
insert into tbl_student values(12,112,'Asha',2,980114,'Female','asha@gmail.com');
insert into tbl_student values(13,113,'Vidya',1,980334,'Female','vidya@gmail.com');
insert into tbl_student values(14,114,'Sam',1,890654,'Male','sam@gmail.com');
insert into tbl_student values(15,115,'Preethi',2,980104,'Female','preethi@gmail.com');
insert into tbl_student values(16,116,'Niteesh',3,980123,'Male','niteesh@gmail.com');
insert into tbl_student values(17,117,'Rahul',1,780654,'Male','rahul@gmail.com');
insert into tbl_student values(18,118,'Sameer',4,896654,'Male','sameer@gmail.com');
insert into tbl_student values(19,119,'Varsha',7,7890654,'Female','varsha@gmail.com');
insert into tbl_student values(20,120,'Pallavi',9,977754,'Female','pallavi@gmail.com');
insert into tbl_student values(21,121,'Netra',10,880654,'Female','netra@gmail.com');
insert into tbl_student values(22,122,'HemaSai',2,9801944,'Male','sai@gmail.com');
insert into tbl_student values(23,123,'Vignesh',5,780622,'Male','vignesh@gmail.com');


create table tbl_subjects(sub_id int primary key,
						  sub_name varchar(20) not null);

select * from tbl_subjects;

insert into tbl_subjects values(201,'Java');
insert into tbl_subjects values(202,'J2ee');
insert into tbl_subjects values(203,'Javascript');
insert into tbl_subjects values(204,'c');
insert into tbl_subjects values(205,'c++');
insert into tbl_subjects values(206,'php');
insert into tbl_subjects values(207,'sql');
insert into tbl_subjects values(208,'csharp');
insert into tbl_subjects values(209,'html');
insert into tbl_subjects values(210,'AI');
insert into tbl_subjects values(211,'CSS');
insert into tbl_subjects values(212,'ReactJS');

create table tbl_marks(mrks_id int primary key,
					   std_id int not null,             /*FK*/
                       sub_id int not null,             /*FK*/
                       marks int not null,
						constraint student_id foreign key(std_id) references tbl_student(std_id),
                        constraint subject_id foreign key(sub_id) references tbl_subjects(sub_id));

select * from tbl_marks;

insert into tbl_marks values(301,11,201,95);
insert into tbl_marks values(302,11,203,92);
insert into tbl_marks values(303,13,205,85);
insert into tbl_marks values(304,15,207,75);
insert into tbl_marks values(305,12,204,75);
insert into tbl_marks values(306,14,206,65);
insert into tbl_marks values(307,13,207,67);
insert into tbl_marks values(308,11,211,35);
insert into tbl_marks values(309,17,206,95);
insert into tbl_marks values(310,11,201,85);
insert into tbl_marks values(311,18,212,65);
insert into tbl_marks values(312,19,202,45);

create table tbl_teacher(tch_id int primary key,
						 sub_id int not null,                 /*FK*/
						 tch_name varchar(20) not null,
							constraint subj_id foreign key(sub_id) references tbl_subjects(sub_id));

select * from tbl_teacher;

insert into tbl_teacher values(401,201,'Sneha');
insert into tbl_teacher values(402,201,'Sahana');
insert into tbl_teacher values(403,203,'Nidhi');
insert into tbl_teacher values(404,205,'Ramesh');
insert into tbl_teacher values(405,202,'Sanvi');
insert into tbl_teacher values(406,204,'Nithin');
insert into tbl_teacher values(407,209,'Naveen');
insert into tbl_teacher values(408,211,'Akshay');
insert into tbl_teacher values(409,212,'Ganesh');
insert into tbl_teacher values(410,203,'Sneha');
insert into tbl_teacher values(411,202,'Santhosh');
insert into tbl_teacher values(412,209,'Surya');


