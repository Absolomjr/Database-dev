
-- DATA RETRIEVAL FROM THE INTERNSHIP PLACEMENTS
show databases;
use internshipplacement;

-- //DATA RETRIVAL VIEWS 
CREATE VIEW Total_Users AS
SELECT COUNT(user_id) AS total_users
FROM Users;

use internshipplacement;
select * from total_users;

--  Count Employers and Students Separately
CREATE VIEW User_Type_Count AS
SELECT user_type, COUNT(user_id) AS total_users
FROM Users
GROUP BY user_type; 

SELECT * FROM User_Type_Count;

-- View to list all students with their contact numbers and specializations
CREATE VIEW StudentDetails AS
SELECT student_id, user_id, contact_number, speciality_id
FROM Students;
SELECT * FROM User_Type_Count;

-- View to list all employers with their contact details
CREATE VIEW EmployerDetails AS
SELECT employer_id, user_id, company_name, contact_number
FROM Employers;
select * from employerdetails;

-- View to list all job postings with their employment type
CREATE VIEW JobPostingsSummary AS
SELECT job_id, user_id, title, employment_type, speciality_id, posted_at
FROM Job_Postings;

select * from jobpostingssummary;

-- View to list all applications with their status
CREATE VIEW ApplicationStatus AS
SELECT application_id, job_id, student_id, resume_link, status, applied_at
FROM Applications; 

select * from applicationstatus;

-- View to list all scheduled interviews
CREATE VIEW ScheduledInterviews AS
SELECT interview_id, application_id, interview_date, interview_mode, interview_status, created_at
FROM Interviews
WHERE interview_status = 'scheduled';

select * from scheduledinterviews;

-- Maximum, Minimum, and Average Job Postings Per Employer
CREATE VIEW Job_Posting_Stats AS
SELECT 
    MAX(post_count) AS max_jobs_posted, 
    MIN(post_count) AS min_jobs_posted, 
    AVG(post_count) AS avg_jobs_posted
FROM (
    SELECT user_id, COUNT(job_id) AS post_count
    FROM Job_Postings
    GROUP BY user_id
) AS job_counts; 


SELECT * FROM Job_Posting_Stats;  

-- Number of Applications per Job (Ordered by Popularity)

CREATE VIEW Job_Application_Count_Ordered AS
SELECT job_id, COUNT(application_id) AS total_applications
FROM Applications
GROUP BY job_id
ORDER BY total_applications DESC;  

SELECT * FROM Job_Application_Count_Ordered;




-- Count of Distinct Specialities in the System
-- This view returns the number of distinct specialities available.

CREATE VIEW Total_Specialities AS
SELECT COUNT(DISTINCT speciality_id) AS distinct_specialities
FROM Speciality;

SELECT * FROM Total_Specialities;

-- Total Number of Interviews by Status
-- This view counts how many interviews are scheduled, completed, or canceled.
CREATE VIEW Interview_Status_Count AS
SELECT interview_status, COUNT(interview_id) AS total_interviews
FROM Interviews
GROUP BY interview_status;
SELECT * FROM Interview_Status_Count;

-- Highest and Lowest Rating Given in Feedback
-- This view retrieves the highest and lowest ratings given by employers in feedback.
CREATE VIEW Feedback_Rating_Stats AS
SELECT 
    MAX(rating) AS highest_rating, 
    MIN(rating) AS lowest_rating
FROM Feedback;
SELECT * FROM Feedback_Rating_Stats;

-- This view calculates the average feedback rating for each employer.
CREATE VIEW Employer_Avg_Rating AS
SELECT employer_id, AVG(rating) AS avg_rating
FROM Feedback
GROUP BY employer_id;

select * from employer_avg_rating;

-- This view sums up the total number of applications submitted by all students.
CREATE VIEW Total_Applications AS
SELECT SUM(application_count) AS total_applications_submitted
FROM (
    SELECT student_id, COUNT(application_id) AS application_count
    FROM Applications
    GROUP BY student_id
) AS student_app_counts;

select * from total_applications;

-- This view retrieves the distinct employment types available.
CREATE VIEW Distinct_Employment_Types AS
SELECT DISTINCT employment_type 
FROM Job_Postings;

SELECT * FROM Distinct_Employment_Types;



