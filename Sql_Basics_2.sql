-- JOIN
-- multiple tables


-- select everything
SELECT  *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
-- (INNER JOIN OR JOIN SAME OUTPUT)


-- INNER JOIN : selects records that have matching values in both tables
SELECT  *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Full Outer Join
SELECT  *
FROM EmployeeDemographics
Full Outer Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Left Outer Join
SELECT  *
FROM EmployeeDemographics
Left Outer Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Right Outer Join
SELECT  *
FROM EmployeeDemographics
Right Outer Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- only Salesman
SELECT  Jobtitle, Salary
FROM EmployeeDemographics
Inner Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Jobtitle = 'Salesman'

-- Salesmans average salary
SELECT  Jobtitle, AVG(Salary)
FROM EmployeeDemographics
Inner Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Jobtitle = 'Salesman'
GROUP BY JobTitle

-- -----------------------------

-- Union
-- -----------------------------
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')
-- -----------------------------

-- EmployeeDemographics and WareHouseEmployeeDemographics are same table but different information
select * from EmployeeDemographics
UNION
select * from WareHouseEmployeeDemographics

-- UNION : got rid of duplicates.
select * from EmployeeDemographics
UNION
select * from WareHouseEmployeeDemographics

-- UNION with different tables
select EmployeeID, FirstName, Age 
FROM EmployeeDemographics
UNION
SELECT EmployeeID, Jobtitle, Salary 
FROM EmployeeSalary;
-- ! output columns: EmployeeID,FirstName and Age
-- Age column same values are : 30,35,4500!
/*
reason it's working because: 
1. data types exact same or similar
2. same amount of columns 
*/

-- -----------------------------

-- CASE
-- Label ages younger than 27 as Child, 
-- ages 27 to 30 as Young, 
-- ages older than 30 as Old 
-- Show in new column : NEW_COLUMN

select FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Old'
WHEN Age BETWEEN 27 AND 30 THEN 'Young'
ELSE 'Child'
END AS NEW_COLUMN
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age
--

-- Yearly Raise
select FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary*.10)
    WHEN JobTitle = 'Accountant' THEN Salary + (Salary*.05)
    WHEN JobTitle = 'HR' THEN Salary + (Salary*.01)
    ELSE Salary + (Salary * .03)
END AS Salary_After_Raise
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
