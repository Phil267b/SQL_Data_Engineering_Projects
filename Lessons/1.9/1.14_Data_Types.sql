SELECT
    table_name,
    column_name,
    data_type
FROM 
    information_schema.columns
WHERE
    table_name = 'job_postings_fact';

DESCRIBE job_postings_fact;



SELECT CAST(123 AS VARCHAR);


SELECT
    job_id,
    CAST(job_work_from_home AS INT) AS job_work_from_home,
    job_posted_date,
    salary_year_avg
FROM 
    job_postings_fact
LIMIT 10;