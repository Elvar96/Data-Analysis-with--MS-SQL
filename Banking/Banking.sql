SELECT * 
FROM bank


---The maximum,minimum,average and total of balance

SELECT MAX(balance) as Maximum,MIN(balance) as Minimum, ROUND(AVG(balance),2) as Average, SUM(balance) as Total
FROM bank 


---Find maximum balance for TOP 10 AGE.

SELECT TOP 10 age, MAX(balance) AS Maximum_Balance 
FROM bank 
GROUP BY age 
ORDER BY Maximum_Balance DESC

---Find maximum and minimum balance for each education level ?

SELECT  education, MAX(balance), MIN(balance) AS Maximum_Money 
FROM bank 
GROUP BY education 

---Find the total of secondary school person who has a house

SELECT COUNT(*) as Have_House, education, housing
FROM bank 
WHERE education = 'secondary' AND housing ='yes'
GROUP BY education, housing


---In which day of month did people deposit the most money in the bank?

SELECT TOP 1 month,day, MAX(balance) as Maximum_Deposit
FROM bank 
GROUP BY month, day
ORDER BY Maximum_Deposit DESC


---Which business owner has  deposit more than average ?

SELECT job,balance
FROM bank 
WHERE balance > (SELECT AVG(balance) FROM bank)
ORDER BY balance DESC


---Which way was used by bank workers to keep in touch with customers (cellular,telephone or unknown) 
 
SELECT distinct(contact),SUM (duration) AS Total_Minute
FROM bank 
GROUP BY contact
ORDER BY Total_Minute DESC


---Who is under 50, single, education level is tertiary, don't have a house and took a credit from bank

SELECT *
FROM bank 
WHERE 
age <50 and 
marital ='single' and 
education = 'tertiary' and 
housing = 'no' and 
loan ='yes'


---How many minutes(more than 10000) were spend by workers to keep in touch with customers who are older than 50 for each campaign

SELECT campaign, SUM(duration) AS Total_Duration
FROM bank 
WHERE age > 50
GROUP BY campaign
HAVING SUM(duration)  > 10000
ORDER BY Total_Duration DESC 


---Select months and days which duration is higher 10 times than average

SELECT month,day
FROM bank 
WHERE duration > (SELECT ROUND(AVG(duration),2) * 10 FROM bank)


