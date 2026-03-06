-- Count rows -- aggregation only

SELECT
    COUNT(*)
FROM job_postings_fact;

--count rows -- window function

SELECT
    job_id,
    COUNT(*) OVER ()
FROM job_postings_fact;


SELECT
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER (
        PARTITION BY job_title_short, company_id
    )
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY
    RANDOM()
LIMIT 10;


SELECT
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (
        ORDER BY salary_hour_avg DESC
    ) AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY
    salary_hour_avg DESC
LIMIT 10;



SELECT
    job_posted_date,
    job_title_short,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER (
        PARTITION BY job_title_short
        ORDER BY job_posted_date
    ) AS running_avg_hourly_by_title
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL AND job_title_short = 'Data Engineer'
ORDER BY
    job_title_short,
    job_posted_date
LIMIT 10;



SELECT
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (
        PARTITION BY job_title_short
        ORDER BY salary_hour_avg DESC
    ) AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY
    salary_hour_avg DESC,
    job_title_short
LIMIT 10;