SELECT * 
FROM [Scandinavian countries]


---Let's DROP  some columns.
ALTER TABLE [Scandinavian countries]
DROP COLUMN Malaria
ALTER TABLE [Scandinavian countries]
DROP COLUMN [Maternal disorders]
ALTER TABLE [Scandinavian countries]
DROP COLUMN [HIV/AIDS]
ALTER TABLE [Scandinavian countries]
DROP COLUMN [Exposure to forces of nature]
ALTER TABLE [Scandinavian countries]
DROP COLUMN Conflict
ALTER TABLE [Scandinavian countries]
DROP COLUMN [Environmental heat and cold exposure]
ALTER TABLE [Scandinavian countries]
DROP COLUMN [Conflict and terrorism]
ALTER TABLE [Scandinavian countries]
DROP COLUMN Poisonings



----Total Death for each countries  in between 1990 and 2019 

SELECT entity, SUM(Alzheimer + Parkinson+Drowning+ [Interpersonal violence] + [Drug Use] + Cardiovascular+ [Lower respiratory infection]+Neonatal+
Alchocol+Self_harm+Neoplasms+[Diabetes mellitus]) AS Total_Death
FROM [Scandinavian countries]
GROUP BY entity
ORDER BY Total_Death DESC



----THE FIRST 5 YEARS WHERE MOST PEOPLE DIE

SELECT TOP 5 Year, SUM(Alzheimer + Parkinson+Drowning+ [Interpersonal violence] + [Drug Use] + Cardiovascular+ [Lower respiratory infection]+Neonatal+
Alchocol+Self_harm+Neoplasms+[Diabetes mellitus]) AS Total_Death
FROM [Scandinavian countries]
GROUP BY Year
ORDER BY Total_Death DESC


----THE FIRST 5 YEARS AT LEAST PEOPLE DIE

SELECT TOP 5 Year, SUM(Alzheimer + Parkinson+Drowning+ [Interpersonal violence] + [Drug Use] + Cardiovascular+ [Lower respiratory infection]+Neonatal+
Alchocol+Self_harm+Neoplasms+[Diabetes mellitus]) AS Total_Death
FROM [Scandinavian countries]
GROUP BY Year
ORDER BY Total_Death ASC 



---- Total Death for each disorders

SELECT 
SUM(Alzheimer), SUM(Parkinson),SUM(Drowning), 
SUM( [Interpersonal violence]) , SUM( [Drug Use] ), 
SUM(Cardiovascular), SUM( [Lower respiratory infection]), 
SUM(Neonatal), SUM(Alchocol), SUM(Self_harm), SUM(Neoplasms), 
SUM([Diabetes mellitus]) 
FROM [Scandinavian countries]




----Maximum Alzheimer Death for each countries

SELECT Entity, MAX(Alzheimer) AS Maximum_Alzheimer_Death
FROM [Scandinavian countries]
GROUP BY Entity
ORDER BY Maximum_Alzheimer_Death DESC



----When did many people die in Sweden ?

SELECT TOP 1 Entity, Year, SUM(Alzheimer + Parkinson+Drowning+ [Interpersonal violence] + [Drug Use] + Cardiovascular+ [Lower respiratory infection]+Neonatal+
Alchocol+Self_harm+Neoplasms+[Diabetes mellitus]) AS Total_Death
FROM [Scandinavian countries]
WHERE Entity = 'Sweden'
GROUP BY Entity,Year



----In Which country do many people die because of 'Drug Use' ?

SELECT Entity, SUM([Drug Use]) AS Drug_Use_Death
FROM [Scandinavian countries]
GROUP BY Entity
ORDER BY Drug_Use_Death DESC


----Average Death because of Alchocol for each country.

SELECT Entity, ROUND(AVG(Alchocol),2) AS Average_Alchocol_Death
FROM [Scandinavian countries]
GROUP BY Entity
ORDER BY Average_Alchocol_Death DESC



----Finland had at least Alzheimer's deaths between 1990 and 2019.?

SELECT Entity, 
MIN(Alzheimer), MIN(Parkinson),MIN(Drowning), 
MIN( [Interpersonal violence]) , MIN( [Drug Use] ), 
MIN(Cardiovascular), MIN( [Lower respiratory infection]), 
MIN(Neonatal), MIN(Alchocol), MIN(Self_harm), MIN(Neoplasms), 
MIN([Diabetes mellitus]) 
FROM [Scandinavian countries]
WHERE Entity = 'Finland'
GROUP BY Entity




----Which country has  Diabetes mellitus death more than average BETWEEN 1990-2019.


SELECT Entity, [Diabetes mellitus]
FROM [Scandinavian countries]
WHERE [Diabetes mellitus]> (SELECT AVG([Diabetes mellitus]) 
FROM [Scandinavian countries])



----Years when Self harm death are higher than average in Denmark.

SELECT Entity,Year, Self_harm
FROM [Scandinavian countries]
WHERE Entity = 'Denmark' and Self_harm> (SELECT AVG(Self_harm) 
FROM [Scandinavian countries]) 


