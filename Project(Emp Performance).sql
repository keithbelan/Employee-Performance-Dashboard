create database project;
use project;
select * from clean_employee_dataset;

select substring_index(Department_Region, "-", -1) as Department, Performance_Score, count(substring_index(Department_Region, "-", -1)) as Count  -- employee performance in remote work
from clean_employee_dataset
where Remote_Work like "%True%"
group by Department, Performance_Score
order by Department;


select substring_index(Department_Region,"-", 1)  as Department, avg(Age) as avg_age
from clean_employee_dataset  -- average age of employees working in each department
group by Department
order by Department;


select substring_index(Department_Region, "-", -1) as Region ,avg (Salary) as Avg_salary  -- average salary for a region
from clean_employee_dataset
group by Region
order by Region;

select substring_index(Department_Region, "-", -1) as Region, Performance_Score, count(*) as Count
from clean_employee_dataset -- best performing region
where Performance_Score like "E%"
group by Region, Performance_Score
order by Count desc;

select substring_index(Department_Region, "-", 1) as Department, count(*) as Emp_Count
from clean_employee_dataset  -- best performing department
where Performance_Score like "E%"
group by Department
order by Emp_Count desc;

-- KPI
select max(salary) as Max_Salary from clean_employee_dataset;  -- max employee salary

select min(salary) as Min_Salary from clean_employee_dataset;  -- min employee salary

select max(Age) as Max_Age from clean_employee_dataset; -- max employee age

select min(Age) as Min_Age from clean_employee_dataset;  -- min employee age

select count(*) as Count_of_remote_employees from clean_employee_dataset where Remote_Work like "T%"; -- remote employee count

select count(substring_index(Department_Region, "-", -1)) as Count_of_region; -- error