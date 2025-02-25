-- CONSTRAINTS IN DATABASE PROGRAMMING
show databases; 

create DATABASE cs;

use cs;
CREATE TABLE ABSOLOM( ENAME VARCHAR(10), SALARY INT);
CREATE VIEW MARTIN AS SELECT ENAME FROM ABSOLOM;
SHOW TABLES;

create table empx( eid VARCHAR(20), constraint empx_pk PRIMARY KEY(eid), 
designation VARCHAR(20) constraint empx_des check (designation in ('manager','clerk','teacher')), 
age int constraint empx_age check (age>18), 
DOJ datetime DEFAULT CURRENT_TIMESTAMP, gender VARCHAR(10),
email VARCHAR(20), telno INT ); 



desc empx; 

-- checking whether the gender attribute is male or female
alter TABLE empx add constraint empx_gender check (gender in ('M','F')); 

-- dropping the constraint

alter TABLE empx DROP constraint empx_gender;

-- using the OR operator t prefix the gender whether its male or female
alter table empx add constraint empx_gender check (gender='M' or gender='F');

-- prefixing such that the emails are distinct or unique

alter table empx add constraint empx_email unique(email);

-- append a constraint such the numbers of the telephone numbers are strictly 10 digits

alter table empx add constraint empx_telno check(length(telno)=10);

desc empx;

-- inserting values

insert INTO empx (Eid, designation,age,gender,email,telno)values('E001','manager',34,'M','one@gmail.com',1234567895);

select * from empx; 

-- creating a new table 

create table empy(eid varchar(20), constraint empy_pk PRIMARY KEY (eid),
age int, gender VARCHAR(10),
Lname varchar(20), Dname varchar(20), Salary int,
phoneno int, email varchar(20),
DOJ DATETIME DEFAULT CURRENT_TIMESTAMP); 

desc empy;
alter table empy add constraint emp_eid check(length(eid)=4);

-- age should be greater 18-60
alter table empy add constraint emp_age check(18<age<60);
-- Lname shpuld be in capital letters
alter table empy add constraint empy_Lname check (Lname=upper(Lname)); 

desc empy;
-- salary should be in the range of 40000 and 100000
alter table empy add constraint emp_salary check(40000<salary<100000);

desc empy;

-- phone number should be distinct
alter table empy add constraint empy_phoneno UNIQUE(phoneno); 

-- all emails must have a symbol
alter table empy add constraint empy_email check(email like '%@%');
-- gender should not be left blank

alter table empy add constraint empy_gender check (gender is not null);


-- all the EIDs must start with letter E
alter table empy add constraint empy_eid check(eid like 'E%');  


-- dropping the CONSTRAINT of emp_salary
alter table empy drop constraint empy_salary;  

desc empy; 

insert into empy(eid,age,gender,Lname,Dname,Salary,phoneno,email,DOJ) values('E001',24,'M','Masiko','Godfrey',50000,125376538,'siko@gmail.com','2025-08-04'); 

insert into empy values (
    'E002', 20, 'F', 'Precious','OSCAR', '1000000','0771301999','oscar@gmail.com', '2025-02-24'
);

insert into empy values (
    'E003', '23', 'M', 'odongkara','OSCAR', '20000','0771301998','oscar@gmail.com', '2025-02-24'
);

select * from empy;  

-- Fails to run because it has inappropriate values

insert into empy(eid,age,gender,Lname,Dname,Salary,phoneno,email,DOJ) values('E001',24,'M','Masiko','Godfrey',50000,125376538,'siko@gmail.com','2025-08-04'); 
