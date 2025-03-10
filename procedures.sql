-- use of existing databases in my workbench
show DATABASES;

use systemmanagement;

show full tables;

select * from employee;

DELIMITER /

create procedure teachers()
begin
select * from employee where job='teacher';
end/

call teachers()/ 

create procedure jobtype(in id1 VARCHAR(20))
begin
select * from employee where job=id1;
end/ 

-- to call and obatain  a jobtype of teacher

call jobtype('teacher')/  

-- to call and obatain  a jobtype of clerk
call jobtype('clerk')/ 



-- This is used to delete or drop a procedure
drop procedure if exists jobtype;

-- procedure that checks the amount of money spent on each job, call to specify the jobtype
create procedure amountspent(in id2 VARCHAR(10))
begin
select sum(salary) from employee where job=id2;
end/ 

call amountspent('teacher')/

-- viewing the data in the original table
select * from employee;
create procedure xyz(in id3 varchar(10), in id4 VARCHAR(10))
begin
select count(*) from employee WHERE job=id3 and DeptNo=id4;
end/ 

-- calling a manager in DeptNo='30'
call xyz('manager','30')/



-- viewing the data in the original table employee
select * from employee;

-- a procedure to update the information in the table employee
create procedure updatepro(in id4 varchar(10),in id5 int) 
begin
update employee set salary=id5 where EmpNo=id4; 
end/ 

call updatepro('e005',50000)/            

-- selecting the table to show the updated salary in the row E004
select * from employee;

-- procedure to insert data into a table
create Procedure insertpro(in id1 varchar(10), in id2 VARCHAR(10),
in id3 varchar(10), in id4 int, in id5 int)
begin
insert into employee values(id1,id2,id3,id4,id5);
end/

-- inserting the values into the procedure
call insertpro('E008','Irene','SalesLady',30000,30)/