show DATABASES;

use systemmanagement;

show full tables; 

-- selecting information from the department table
select * from department; 
-- selecting information from the employee table
select * from employee; 
-- selecting information from project table
select * from project; 

-- selecting the information from the employee and department tables and joining them on one table
select E.EmpNo, E.Ename, E.Job, E.Salary, D.DName, D.Loc from Employee E 
join Department D on E.DeptNo=D.DeptNo; 
-- selecting the information from the project and department tables and joining them on one table

select P.ProjectID, P.ProjectName, D.DName, D.Loc from Project P 
join department D on P.DeptNo=D.DeptNo; 

-- selecting the information from the employee, department and project tables and joining them on one table 
select E.EmpNo, E.Ename, E.Job, E.Salary, D.DName as department, 
P.ProjectName as project from Employee E 
join Department D on E.DeptNo=D.DeptNo 
join project p on D.DeptNo=P.DeptNo; 
-- retrieving all projects along with the department and employees in that department
select P.ProjectName as Project, D.DName as Department, 
E.EName as employee, E.Job from project P 
join department D on P.DeptNo=D.DeptNo 
join Employee E on D.DeptNo=E.DeptNo 
ORDER BY P.ProjectName; 

-- finding the employees working on projects in their department with salary greater than 40000 
select E.EmpNo, E.Ename, E.Job, E.Salary, D.Dname as department , 
P.ProjectName as project 
from employee E 
join department D on E.DeptNo=D.DeptNo 
join Project P on D.DeptNo=P.DeptNo 
where E.Salary > 40000; 

-- counting how many employees are in each department working on a project 

select D.DName as Department, P.Projectname as Project, count(E.EmpNo) as totalEmployees
from employee E join Department D on E.DeptNo=D.DeptNo
join Project P on D.DeptNo=P.DeptNo 
GROUP BY D.DName, P.ProjectName; 

-- retrieving the employees who are managers and their respective department projects
select E.EmpNo, E.Ename, E.Job, E.Salary, D.Dname as department,
P.ProjectName as project from employee E 
join department D on E.DeptNo=D.DeptNo 
join Project P on D.DeptNo=P.DeptNo 
where E.Job ='Manager';

-- adding two columns on the table project 

alter table project add column role varchar(40); 

alter table project add column assignedDate DATE; 

-- veiwing the table after adding the respective columns
select * from project;



-- creating a view of the employees and their projects 

Create view employeeProject as select E.*, P.ProjectName, P.ProjectID
from employee E
join project P on P.EmpNo =E.EmpNo;


