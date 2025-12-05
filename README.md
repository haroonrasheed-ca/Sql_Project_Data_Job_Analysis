# Introduction
📊 Explore the evolving data job landscape! Centered on data analyst roles, this project uncovers 💰 the highest-paying opportunities, 🔥 the most sought-after skills, and 📈 the sweet spot where demand and salary align in the world of analytics.
Check here [project_sql_folder](/project_sql/)

# Background
This project emerged from a drive to better navigate the data analyst job market, aiming to identify the most lucrative and in-demand skills while simplifying the path for others to secure optimal career opportunities.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn? 

# Tools I Used
In my deep dive into the data analyst job market, I leveraged a suite of powerful tools to drive insights and streamline workflows

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- PostgreSQL: The chosen database management system, ideal for handling the job posting data.
- Visual Studio Code: My go-to for database management and executing SQL queries.
- Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

 SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id 
WHERE
    job_location = 'New York, NY' 
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;` 

Purpose & Business Value
Helps job seekers identify high-paying opportunities in New York's competitive market

- Provides recruiters with salary benchmarking data

- Offers market intelligence for salary negotiations

- Identifies companies offering top compensation in NY

Key Features
Location Filter: Specifically targets New York, NY jobs

Salary Validation: Excludes jobs without salary information

Company Integration: Joins company details for context

Ranking: Orders by highest annual salary

Result Limiting: Returns top 10 results for focused analysis

📊 Visualization: Top 10 Highest-Paying NYC Roles
![NYC Top Paying Jobs](Assets\top_paying_jobs_in_NYC.png)

📈 What the Visualization Shows

- X-axis: Job titles

- Y-axis: Average yearly salary

- Bars sorted from highest to lowest

- Each bar represents a job posting and its company

Highlights which specialized roles (like Data Science, Engineering, or Finance) dominate NYC’s salary leaderboard

# The Analysis

### Top Paying Skills

📌 Overview

This project analyzes high-paying Data Analyst roles in New York City and uncovers the specific skills that employers reward with the biggest salaries.
Using SQL, I combined job postings, company data, and skill datasets to highlight what actually pays in the real world.


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


🚀 Why This Matters

Most people ask:

"What skills should I learn to get a high-paying Data Analyst job?"

This query answers that using real data, not guesses.
It shows which skills consistently appear in the top salary bracket, helping you prioritize:

- SQL

- Python

- Visualization tools

- Cloud / Big Data tools

- Statistical techniques

Basically, the skills that move your paycheck. 🤑

### Vizualize
![Top-Paying Data Analyst Skills](Assets\data_analyst_skills_chart.png)

# The Analysis

### Top Demanding skills

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

DEMAND INTENSITY SCALE:
███ Very High (70%+ jobs)  ██ High (40-70%)  █ Medium (20-40%)  ░ Low (<20%)

Skill          | Demand Level | Market Coverage
---------------|--------------|---------------
SQL            | ████████████ | 85% of jobs
Excel          | █████████    | 55% of jobs  
Python         | ████████     | 52% of jobs
Tableau        | ███████      | 45% of jobs
Power BI       | █████        | 35% of jobs


### Key Fact Analysis
    SQL emerges as the overwhelmingly dominant skill for Data Analysts, appearing in approximately 85% of all job postings, making it virtually non-negotiable for career seekers, while the technical stack reveals a clear triad of essential competencies: database proficiency (SQL), analytical programming (Python), and data visualization (Tableau/Power BI), with Excel maintaining surprising relevance as a foundational business tool despite the proliferation of advanced analytics platforms.

# The Analysis

### Optimal skills


![skills](Assets\optimal__skills.png)

## What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

🧩 Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.

📊 Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.

💡 Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

## Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.