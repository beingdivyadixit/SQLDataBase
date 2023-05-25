create database Employee_Management;
use Employee_Management;
 ---- creating tables -----
 ------first table employee details----
 create table Employee_Dtls(
 emp_id int not null,
 first_name varchar(20) not null,
 last_name varchar(20) not null,
 salary int not null,
 age int not null,
 gender varchar(20) not null,
 primary key (emp_id) );


 ----- to show the table----
 select * from Employee_Dtls;

 --- to add one colum---

 alter table Employee_Dtls add contact int;


 --- to edit the table ---

 alter table Employee_Dtls rename column contact to phoneNo;

 --- to add values---
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(001,'Divya','Dixit',100000,23,'male');
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(002,'Arpita','Dixit',300000,20,'female');
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(003,'Aditya','Mishra',500000,21,'male');
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(004,'Abhinava','sharma',200000,22,'male');
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(005,'Pragya','Bajpai',600000,26,'female');
 insert into Employee_Dtls(emp_id,first_name,last_name,salary,age,gender) values(006,'Mawendra','Dubey',700000,30,'male');



 create table Users(
 admin_id int not null,
 first_name varchar(20) not null,
 last_name varchar(20) not null,
 email varchar(20) not null,
 password varchar(20) not null,
 age int not null,
 gender varchar(20) not null,
 primary key (admin_id) );


 insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(001,'Deepali','Chauhan','deepali@gmail.com','deepali@123',23,'male');
  insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(002,'Neha','Tiwari','neha@gmail.com','neha@123',20,'female');
   insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(003,'Shaina','Qurashi','shaina@gmail.com','shaina@123',19,'female');
    insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(004,'Harsit','Pal','harshit@gmail.com','harshit@123',25,'male');
	 insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(005,'Avni','Gupta','avni@gmail.com','avni@123',17,'female');
	  insert into Users(admin_id,first_name,last_name,email,password,age,gender) values(006,'Rahul','Sihna','rahul@gmail.com','rahul@123',33,'male');

	   select * from Users;


 create table Job_Department(
 job_id int not null,
 job_dept varchar(30) not null,
 name varchar(30) not null,
 description varchar(30) not null,
 sallary_range varchar(30) not null,
 primary key (job_id) );


  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(001,'Tech','Divya','Software developer','100000-200000');
  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(002,'Tech','Arpita','full-stack developer','400000-600000');
  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(003,'Sales','Aditya','bussines development','300000-500000');
  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(004,'non-tech','Abhinava','Service desk','200000-300000');
  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(005,'Hr','Pragya','Hr','200000-400000');
  insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(006,'Sales','Mawendra','Tranee','500000-100000');
   insert into Job_Department(job_id,job_dept,name,description,sallary_range) values(007,'hr','Mawendra','Tranee','500000-100000');


  select * from Job_Department;


   create table Salary(
 salary_id int not null,
 job_id int not null,
 ammount int not null,
 anual Date not null,
 bonous Date not null,
 primary key (salary_id),
 foreign key (job_id) references Job_Department(job_id) );

 ----- Agregrate Functions---
 select min(age)from Employee_Dtls;
 select min(salary)from Employee_Dtls;
 select max(age)from Employee_Dtls;
 select max(salary)from Employee_Dtls;
 select count(*) from Employee_Dtls where gender='female';
 select sum(salary) from Employee_Dtls;
 select AVG(salary) from Employee_Dtls;
 select AVG(age) from Employee_Dtls;

 ----- String Functions-----

 select '     divya'

 select LTRIM('     divya')

 select 'DIVYA'

 select Lower('DIVYA')

 select UPPER(first_name) from Employee_Dtls
 select reverse(last_name) from Employee_Dtls
 select lower(first_name) from Employee_Dtls
 select SUBSTRING(first_name,3,2) from Employee_Dtls




 select
 case
 when  10>20    then '10 is greater than 20'
 when 10<20 then '10 is less than 20'
 else '10 is equal to 20'
 end


  select * from Employee_Dtls;

  select *, grade=
  case
  when Salary<400000 then 'B'
  when Salary>400000 then 'A'
  else 'C'
  end
  from Employee_Dtls
  go

  --- User Defined Functions----- ----1. scaler valued functions----

  create function add_Five(@num as int)
  returns int
  as
  begin
  return(@num +5)
  end

  select dbo.add_Five(10)


  ---2. Table valued function----

  select * from Employee_Dtls;

  create function select_gen(@gender as varchar(20))
  returns table
  as
  return(select *from Employee_Dtls where gender=@gender)

  select * from dbo.select_gen('male')
   select * from dbo.select_gen('female')
