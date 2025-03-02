-- CONSTRAINTS and -- APPLICATION OF DDL AND DML
show databases;

use internshipplacement;


-- CONSTRAINTS
use internshipplacement;  

-- all emails must have a symbol
alter table users add constraint users_email check(email like '%@%'); 

-- prefixing such that the emails are distinct or unique

alter table users add constraint users_email unique(email);


-- phone number/contact number should be distinct
alter table students add constraint students_contact_number UNIQUE(contact_number);


-- checking whether the user_type is student or employer
alter TABLE users add constraint users_user_type check (user_type in ('student','employer')); 

-- name should be in capital letters
alter table users add constraint users_name check (name=upper(name)); 

-- dropping the CONSTRAINT of name being in capital letters
alter table users drop constraint users_name;  


-- APPLICATION OF DDL AND DML

-- DDL (Data Definition Language)
-- Modifying Tables for example Adding a new column to track user status
ALTER TABLE Users ADD COLUMN status ENUM('active', 'inactive') DEFAULT 'active';

-- Dropping a column for example removing an unnecessary column
ALTER TABLE Users DROP COLUMN status;

-- Truncating a Table for example Clearing the Applications table
TRUNCATE TABLE Applications;
We could not truncate the table(Applications) because It is referenced by a foreign key constraint in another table (unless CASCADE is enabled).

-- DML (Data Manipulation Language)
-- Updating user type (Example: Changing a student's type to an employer)
UPDATE Users SET user_type = 'employer' WHERE user_id = 'U002';

-- Deleting an application (Example: Removing a specific application entry)
DELETE FROM Applications WHERE application_id = 'A003';

-- Selecting Data (Example: Retrieving all active job postings)
SELECT * FROM Job_Postings WHERE employment_type = 'full-time';


-- Start a transaction
START TRANSACTION;

-- Insert a new job posting
INSERT INTO Job_Postings (job_id, user_id, title, description, employment_type, speciality_id, posted_at) 
VALUES ('J006', 'U003', 'AI Researcher', 'Research on AI models', 'full-time', 'S001', NOW());

-- Insert a corresponding application for a student
INSERT INTO Applications (application_id, job_id, student_id, resume_link, status, applied_at) 
VALUES ('A006', 'J006', 'ST001', 'resume6.pdf', 'pending', NOW());

-- If both inserts succeed, commit the transaction
COMMIT;