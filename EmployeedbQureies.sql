create database EmployeeDb;
use EmployeeDb;


create table department(dep_id integer not null primary key, dep_name varchar(20),dep_location varchar(15));
 

create table employees(emp_id integer primary key,emp_name varchar(15),job_name varchar(15),
manager_id integer, hire_date date,salary decimal(10,2),commission decimal(7,2),
dep_id integer,FOREIGN KEY (dep_id) REFERENCES department(dep_id) );

 

create table salary_grade(grade integer primary key,min_salary integer, max_salary integer);



insert into department(dep_id,dep_name,dep_location)values (1001,'FINANCE','SYDNEY');
insert into department(dep_id,dep_name,dep_location)values (2001,'AUDIT','MELBOURNE');
insert into department(dep_id,dep_name,dep_location)values (3001,'MARKETING','PERTH');
insert into department(dep_id,dep_name,dep_location)values (4001,'PRODUCTION','BRISBANE');

 select * from department;

insert into salary_grade(grade,min_salary,max_salary)values (1,800,1300);
insert into salary_grade(grade,min_salary,max_salary)values (2,1301,1500);
insert into salary_grade(grade,min_salary,max_salary)values (3,1501,2100);
insert into salary_grade(grade,min_salary,max_salary)values (4,2101,3100);

 select * from salary_grade;

 

insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(68319,'KAYLING','PRESIDENT',NULL,'1991-11-18',6000,NULL,1001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750,NULL,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(67832,'CLARE','MANAGER',68319,'1991-06-09',2550,NULL,1001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(65646,'JONAS','MANAGER',68319,'1991-04-02',2957,NULL,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100,NULL,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(69062,'FRANK','ANALYST',65646,'1991-12-03',3100,NULL,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(63679,'SANDRINE','CLERK',69062,'1990-12-18',900,NULL,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700,400,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(65271,'WADE','SALESMAN',66928,'1991-02-22',1350,600,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350,1500,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600,0,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(68736,'ADNRES','CLERK',67858,'1997-05-23',1200,NULL,2001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(69000,'JULIUS','CLERK',66928,'1991-12-03',1050,NULL,3001);
insert into employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)values(69324,'MARKER','CLERK',67832,'1992-01-23',1400,NULL,1001);

select * from employees;

/*Queries*/




/*36.Write a query in SQL to list the employees of department id 3001 or 1001 joined in the year 1991.*/

select *
from employees
where dep_id in (3001,1001)
and hire_date>='1991-01-01' and hire_date<='1991-12-31';

/*37.Write a query in SQL to list the employees of department id 3001 or 1001*/
select *
from employees
where dep_id in (3001,1001);

/*38.Write a query in SQL to list all the employees of designation CLERK in department no 2001. */
select *
from employees
where job_name='CLERK' and dep_id=2001;

/*39.Write a query in SQL to list the ID, name, salary, and job_name of the employees for 
1. Annual salary is below 34000 but receiving some commission which should not be more than the salary,
2. And designation is SALESMAN and working for department 3001.*/
select emp_id,emp_name,job_name,salary
from employees
where salary*12 <34000 and commission<salary and job_name='SALESMAN' and dep_id=3001;

/*40.Write a query in SQL to list the employees who are either CLERK or MANAGER.*/
select *
from employees
where job_name in ('CLERK','MANAGER');
/*or*/
select *
from employees
where job_name='CLERK' or job_name='MANAGER';

/*41. Write a query in SQL to list the employees who joined in any year except the month February.*/
select *
from employees
where hire_date not like '%02%';

/*42.Write a query in SQL to list the employees who joined in the year 91*/
select *
from employees
where hire_date like '%91%';
/*or*/
select *
from employees
where hire_date between '1991-01-01' and '1991-12-31';

/*43.Write a query in SQL to list the employees who joined in the month of June in 1991. */
select *
from employees
where hire_date like '1991-06%';

/*44.Write a query in SQL to list the employees whose annual salary is within the range 24000 and 50000. */
select *
from employees
where salary*12 between 24000 and 50000;

/*45.Write a query in SQL to list the employees who have joined on the following 
dates 1st May,20th Feb, and 03rd Dec in the year 1991. */
select *
from employees
where hire_date in ('1991-05-01','1991-02-20','1991-12-03');


/*46.Write a query in SQL to list the employees working under the managers 63679,68319,66564,69000. */
select *
from employees
where manager_id in (63679,68319,66564,69000);

/*47.Write a query in SQL to list the employees who joined after the month JUNE in the year 1991. */
select *
from employees
where hire_date between '1991-07-01' and '1991-12-31';

/*48.Write a query in SQL to list the employees who joined in 90's. */
select *
from employees
where hire_date>='1990-01-01' and hire_date<='1999-12-31';

/*49.Write a query in SQL to list the managers of department 1001 or 2001. */
select *
from employees
where job_name='MANAGER' and dep_id in (1001,2001);

/*50.Write a query in SQL to list the employees, joined in the month FEBRUARY with a salary range between 1001 to 2000. */
select *
from employees
where hire_date like '%02%' and salary between 1001 and 2000;


SELECT *
FROM employees
WHERE MOD(salary,2) = 1;
 
SELECT emp_name,
       to_char(1.15*salary,'$99,999') AS "Salary"
FROM employees;
 
SELECT concat(emp_name, '  ', job_name) AS "Employee & Job"
FROM employees ;
 
SELECT concat(emp_name, '  ', lower(job_name)) AS "Employee"
FROM employees;

