SELECT * FROM sql_portfolio.employee_attrition;

#1 Write an SQL query to find out details of employees under table attrition having 5+ years of experience and age grp 27-35
SELECT * FROM employee_attrition
WHERE Age between 27 and 35
AND TotalWorkingYears > 5;

#Same query above, if we have to check the count
SELECT count(*)
 FROM employee_attrition
WHERE Age between 27 and 35
AND TotalWorkingYears > 5;

#2 Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike

select Department,
       MAX(MonthlyIncome) AS Max_sal,
       MIN(MonthlyIncome) AS Min_sal
FROM employee_attrition
WHERE PerformanceRating < 13
GROUP BY Department;

#3 Calculate the average monthly income of all the employees who worked more than 3 yaers whose education background is medical
select 
avg(MonthlyIncome)
from employee_attrition
where YearsAtCompany > 3
AND EducationField = 'Medical'
group by EducationField;

#4 Identify the total no of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 yaers
select gender, count(EmployeeNumber)
from employee_attrition
where MaritalStatus = 'Married'
AND YearsSinceLastPromotion = 2
and Attrition = 'Yes'
group by gender;

#5 Employees with maximum performance rating but no promotion for 4 and more yaers
Select EmployeeNumber,
max(PerformanceRating) AS Max_rating
from employee_attrition
where YearsSinceLastPromotion >= 4
group by EmployeeNumber;

#6 Max and min percentage of salary hike
select YearsAtCompany, YearsSinceLastPromotion,PerformanceRating,
max(PercentSalaryHike),
min(PercentSalaryHike)
from employee_attrition
group by YearsAtCompany, YearsSinceLastPromotion, PerformanceRating
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;

#7 Employees working over time but given min slar hike and are more than 5 years with company
Select *
from employee_attrition
where  overtime = 'Yes'
and PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
and YearsAtCompany >5;

#Above query in other way round 
Select *
from employee_attrition
where  overtime = 'Yes'
and PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany <5;

#Above query in other way round 
Select *
from employee_attrition
where  overtime = 'No'
and PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany <5;

#Use of distict keyword
select distinct department from
employee_attrition;