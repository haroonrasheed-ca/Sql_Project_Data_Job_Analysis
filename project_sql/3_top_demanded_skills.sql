/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings (including both remote and on-site positions).
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Expected Insights:
- This query now considers ALL Data Analyst job postings, not just remote positions
- SQL and Excel are likely to remain at the top as fundamental skills
- Programming and Visualization Tools like Python, Tableau, and Power BI will show overall demand across all work arrangements
- The counts will be higher since we're including all job postings, not just remote ones

Example of what results might look like:
[
  {
    "skills": "sql",
    "demand_count": "8500"
  },
  {
    "skills": "excel",
    "demand_count": "5500"
  },
  {
    "skills": "python",
    "demand_count": "5200"
  },
  {
    "skills": "tableau",
    "demand_count": "4500"
  },
  {
    "skills": "power bi",
    "demand_count": "3500"
  }
]
*/