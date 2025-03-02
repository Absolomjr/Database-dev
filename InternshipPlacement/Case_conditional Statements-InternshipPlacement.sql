----CASE CONDITIONAL STATEMENTS----

show databases;

use internshipplacement;


--Job_Postings_With_Category (Classifying job types)
use internshipplacement;
CREATE VIEW Case_Job_Postings_With_Category AS
SELECT job_id, title, employment_type,
    CASE 
        WHEN employment_type = 'full-time' THEN 'Permanent Job'
        WHEN employment_type = 'part-time' THEN 'Flexible Job'
        WHEN employment_type = 'internship' THEN 'Internship Opportunity'
        ELSE 'Unknown'
    END AS job_category
FROM Job_Postings;
select * from Case_Job_Postings_With_Category;

--Applications_Status_Label (Assigning labels based on application status
CREATE VIEW Case_Applications_Status_Label AS
SELECT application_id, job_id, student_id, status,
    CASE 
        WHEN status = 'pending' THEN 'Awaiting Review'
        WHEN status = 'accepted' THEN 'Congratulations! You are Hired'
        WHEN status = 'rejected' THEN 'Application Declined'
        ELSE 'Unknown Status'
    END AS status_label
FROM Applications;
select * from Case_Applications_Status_Label;

--CASE in UPDATE Statements
--Updating job descriptions based on job type
UPDATE Job_Postings 
SET description = CASE 
    WHEN employment_type = 'full-time' THEN 'This is a full-time position.'
    WHEN employment_type = 'part-time' THEN 'This is a part-time position.'
    WHEN employment_type = 'internship' THEN 'This is an internship opportunity.'
    ELSE description 
END;


select * from Job_Postings;

-- Updating student contact numbers based on missing values
UPDATE Students
SET contact_number = 
    CASE 
        WHEN contact_number IS NULL THEN 'Not Provided'
        ELSE contact_number
    END;

select * from Students;

-- Deleting job postings for employers with no valid company names 

DELETE FROM Job_Postings 
WHERE user_id IN (
    SELECT user_id FROM Employers 
    WHERE company_name IS NULL OR company_name = ''
);

select * from job_postings;