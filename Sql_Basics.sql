-- Creating tables
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50))


CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)
-- -----------------------------
-- Insert new records in a table
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

-- -----------------------------
-- SELECT Statement

-- all columns
SELECT * FROM EmployeeDemographics

-- spesific columns
SELECT Age, Gender FROM EmployeeDemographics


/*

Top-Distinct-Count-As-Avg-Min-Max-Sum

*/

-- Top for mssql
SELECT TOP 5 * FROM EmployeeDemographics

-- Top for mysql
SELECT * FROM EmployeeDemographics
LIMIT 5

-- Distinct : returns only distinct (different) values

SELECT  DISTINCT(Gender) FROM EmployeeDemographics

SELECT  DISTINCT Gender, Age FROM EmployeeDemographics

-- Count : returns the number of rows in a specified table
-- ( AS command : The AS command is used to rename a column or table with an alias. An alias only exists for the duration of the query.)

SELECT  COUNT(*) FROM EmployeeDemographics

SELECT  COUNT(Age) AS AgeCount FROM EmployeeDemographics

--Max-Min-Avg-Sum :
/*
Max: returns the largest value of the selected column.
Min: returns the smallest value of the selected column.
Avg: returns the average value of a numeric column. 
Sum: returns the total sum of a numeric column. 
*/ 

SELECT  MAX(Salary) AS AgeCount FROM EmployeeSalary

SELECT  SUM(Salary) AS Salary_SUM, COUNT(Salary) AS Salary_COUNT
FROM EmployeeSalary


-- -----------------------------
-- WHERE Statement : =, <>, <,>, And, Or, Like, Null, Not Null, In

-- everybody except Pam
SELECT  *
FROM EmployeeDemographics
WHERE FirstName <> 'Pam'



-- all females except Pam
SELECT  *
FROM EmployeeDemographics
WHERE FirstName <> 'Pam' AND Gender = 'Female'

-- Over 30 years old or Female
SELECT  *
FROM EmployeeDemographics
WHERE Age > 30 OR Gender = 'Female'

-- FirstName starts with M
SELECT  *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%'

-- M anywhere in anybody's names
SELECT  *
FROM EmployeeDemographics
WHERE FirstName LIKE '%M%'

-- FirstName starts with M and has A somewhere 
SELECT  *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%A%'

-- FirstName that have A in the second position
SELECT  *
FROM EmployeeDemographics
WHERE FirstName LIKE '_A%'

-- Not Null values
SELECT  *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

-- WHERE IN returns values that match values in a list. WHERE IN is shorthand for multiple OR conditions.
SELECT  *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

-- -----------------------------
-- GROUP BY
-- count of each gender
SELECT  Gender, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
GROUP BY Gender

-- can use where and group by
SELECT  Gender, Age, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
where Age > 30
GROUP BY Gender, Age

-- count of each gender over 31 years old
SELECT  Gender, COUNT(Gender) AS Gender_Count
FROM EmployeeDemographics
where Age > 31
GROUP BY Gender
ORDER BY Gender_Count DESC

-- order by multiple column

SELECT  *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

/*
4.column: Age
5.column: Gender

so the  
'ORDER BY Age DESC, Gender DESC' command and the 
'ORDER BY 4 DESC, 5 DESC' command have the same meaning.
*/




















