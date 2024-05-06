SELECT * FROM teachers_salaries;

SELECT TOP 10  last_name,first_name,county, experience_total, MAX(salary)
FROM teachers_salaries
GROUP BY last_name,first_name,county, experience_total
ORDER BY  MAX(salary) DESC






---Maximum Salary
SELECT MAX(salary),MIN(salary),ROUND(AVG(salary),2) 
FROM teachers_salaries;


---The Number of Certificates which are given by school.
SELECT school, COUNT(certificate) AS The_Number_of_Certificates FROM teachers_salaries
GROUP BY school
ORDER BY The_Number_of_Certificates DESC


---Person who has max experience
SELECT last_name,first_name,county, experience_total
FROM teachers_salaries   
WHERE experience_total> (SELECT AVG(experience_total) FROM teachers_salaries)


---Person who earns  max salary
SELECT last_name,first_name,county, experience_total, salary
FROM teachers_salaries   
WHERE salary = (SELECT MAX(salary) FROM teachers_salaries)



---Experience total compares to salary
SELECT last_name,first_name,experience_total,salary, ROUND((experience_total/salary)*100,4) as Experience_Percentage
FROM teachers_salaries   
ORDER BY Experience_Percentage DESC


---Maximum salary compares to certificates
SELECT certificate, MAX(salary) AS Maximum_Salary_By_Certificate 
FROM teachers_salaries
GROUP BY certificate
ORDER BY Maximum_Salary_By_Certificate 



---Maximum salary compares to county
SELECT county, MAX(salary) AS Maximum_Salary_By_County
FROM teachers_salaries
GROUP BY county
ORDER BY Maximum_Salary_By_County DESC



---Average salary compares to experience
SELECT experience_total, ROUND(AVG(salary),2) AS Maximum_Salary_By_Experience_Total
FROM teachers_salaries
GROUP BY experience_total
ORDER BY Maximum_Salary_By_Experience_Total DESC


---Number of school which are located in county 
SELECT county, COUNT(school) AS The_Number_of_School
FROM teachers_salaries
GROUP BY county
ORDER BY The_Number_of_School DESC


---Average Salary Compares to primary job 
SELECT primary_job,  ROUND(AVG(salary),0) AS Average_Salary
FROM teachers_salaries
GROUP BY primary_job
ORDER BY Average_Salary DESC



---Maximum and Average Salary in county(Essex) and district(Newark City)
SELECT county,district, MAX(salary) AS Maximum_Salary, AVG(salary) AS Average_Salary
FROM teachers_salaries 
WHERE county = 'Essex' and district ='Newark City'
GROUP BY county,district



---People who have experience in Dance sector more than 15 years
SELECT last_name, first_name,salary 
FROM teachers_salaries
WHERE primary_job ='Dance' and experience_total>15
ORDER BY salary DESC




---People who last_name starts with 'D', have a standard certificate, average salary is higher than 100K and accommodate in Gloucester.
SELECT last_name,first_name,county, certificate, AVG(salary) AS Average_Salary_in_Gloucester
FROM teachers_salaries
WHERE last_name LIKE 'D%' AND county ='Gloucester' AND certificate = 'Standard certificate'
GROUP BY last_name,first_name,county, certificate
HAVING AVG(salary) > 100000
ORDER BY AVG(salary) DESC












