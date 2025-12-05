
/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_postings_fact.job_id,
        job_postings_fact.job_title,
        job_postings_fact.job_location,
        job_postings_fact.job_schedule_type,
        job_postings_fact.salary_year_avg,
        job_postings_fact.job_posted_date,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id 
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills,
    skills_dim.type AS skill_type
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC,
    top_paying_jobs.job_id;



/*
     Insights
- Python + SQL dominate: Together they appear in 13 listings, showing they are core requirements for high-paying data roles.
- R and Express are secondary but still valued, especially in TikTok’s analyst roles.
- Analyst tools (Excel, Tableau, Power BI, PowerPoint) appear in investor relations jobs, highlighting the need for presentation + visualization skills alongside programming.
- Cloud & Databases (AWS, Oracle, Neo4j, Elasticsearch, SQL Server) are niche but signal that infrastructure knowledge boosts salary.
- Libraries (Pandas, Spark, Kafka) show demand for data processing and big data frameworks
*/

/*
[
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-05-27 13:59:57",
    "company_name": "TikTok",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-05-27 13:59:57",
    "company_name": "TikTok",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-05-27 13:59:57",
    "company_name": "TikTok",
    "skills": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-05-27 13:59:57",
    "company_name": "TikTok",
    "skills": "express",
    "skill_type": "webframeworks"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-07-09 14:00:05",
    "company_name": "TikTok",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-07-09 14:00:05",
    "company_name": "TikTok",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-07-09 14:00:05",
    "company_name": "TikTok",
    "skills": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "239777.5",
    "job_posted_date": "2023-07-09 14:00:05",
    "company_name": "TikTok",
    "skills": "express",
    "skill_type": "webframeworks"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "225000.0",
    "job_posted_date": "2023-05-12 19:59:54",
    "company_name": "Selby Jennings",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "225000.0",
    "job_posted_date": "2023-05-12 19:59:54",
    "company_name": "Selby Jennings",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "neo4j",
    "skill_type": "databases"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "elasticsearch",
    "skill_type": "databases"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "sql server",
    "skill_type": "databases"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "spark",
    "skill_type": "libraries"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "185000.0",
    "job_posted_date": "2023-04-18 20:59:56",
    "company_name": "Pronix Inc",
    "skills": "kafka",
    "skill_type": "libraries"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "181177.5",
    "job_posted_date": "2023-04-28 06:00:11",
    "company_name": "TikTok",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "181177.5",
    "job_posted_date": "2023-04-28 06:00:11",
    "company_name": "TikTok",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "181177.5",
    "job_posted_date": "2023-04-28 06:00:11",
    "company_name": "TikTok",
    "skills": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "181177.5",
    "job_posted_date": "2023-04-28 06:00:11",
    "company_name": "TikTok",
    "skills": "express",
    "skill_type": "webframeworks"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-07-17 17:00:29",
    "company_name": "Brewer Morris",
    "skills": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-07-17 17:00:29",
    "company_name": "Brewer Morris",
    "skills": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-07-17 17:00:29",
    "company_name": "Brewer Morris",
    "skills": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-07-17 17:00:29",
    "company_name": "Brewer Morris",
    "skills": "power bi",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 405956,
    "job_title": "Principal Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "175000.0",
    "job_posted_date": "2023-01-08 07:59:59",
    "company_name": "Blink Health",
    "skills": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 405956,
    "job_title": "Principal Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "175000.0",
    "job_posted_date": "2023-01-08 07:59:59",
    "company_name": "Blink Health",
    "skills": "airflow",
    "skill_type": "libraries"
  },
  {
    "job_id": 405956,
    "job_title": "Principal Data Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "175000.0",
    "job_posted_date": "2023-01-08 07:59:59",
    "company_name": "Blink Health",
    "skills": "tableau",
    "skill_type": "analyst_tools"
  }
] */