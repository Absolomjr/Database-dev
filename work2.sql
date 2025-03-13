CREATE DATABASE work2;

use work2; 

create table donation (donorID varchar(20) primary key,
department varchar(20),
amount INT
);

INSERT into donation(donorID, department,amount) values 
('D/25','CT',25000),
('D/67','SOT',12000),
('D/45', 'CT',15000),
('D/46', 'SOB',NULL),
('D/50','SOT',11000);



select * from donation;

DELIMITER /

create Procedure procedure1(in id1 varchar(20))
begin
select min(amount) from donation 
where id1=amount;
end/

call procedure1('CT')/

create procedure procedure2(in id3 VARCHAR(20), in id4 int)
begin
select total(amount) from donation where id4=amount and id3=department;id
end/

call procedure2('CT',)/




CREATE PROCEDURE procedure3()
BEGIN
DELETE FROM donation
WHERE Amount IS NULL OR amount = 0;
END/



CREATE PROCEDURE procedure4(
IN OldDeptName VARCHAR(30),
IN NewDeptName VARCHAR(30)
)
BEGIN
UPDATE department
SET departmentName = NewDeptName
WHERE departmentName = OldDeptName;
END/

CREATE PROCEDURE procedure5(IN id7 int)
BEGIN
DELETE FROM donation
WHERE Amount< id7;
END /
 call procedure5(10000)/


-- constraints
alter table donation add constraint donation_department check(department in ('CT','SOT','SOB'));

alter table donation add constraint donation_amount check(12000<amount<25000); 

alter table donation add constraint donation_donorid check(donorID like 'D%%%%');



select * from donation;