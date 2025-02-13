/*
QUESTION: What are the most in-demand skills for Data Analysts?
 - Join job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skills for Data Analysts
 - Focus on all job postings
 - Why? Retrieves top 5 skills with the highest demand in job market,
    providing insights into the most valuable skills for job seekers
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10

 