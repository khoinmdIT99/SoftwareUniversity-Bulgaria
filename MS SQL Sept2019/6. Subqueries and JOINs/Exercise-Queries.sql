﻿USE SoftUni

/*******************************
 Problem 2.	Addresses with Towns
*******************************/

SELECT TOP (50) 
     e.FirstName
   , e.LastName
   , t.[Name] AS Town
   , a.AddressText
FROM 
     Employees AS e
     JOIN Addresses AS a ON a.AddressID = e.AddressID
     JOIN Towns AS t ON t.TownID = a.TownID
ORDER BY 
     FirstName
   , LastName;

/********************************
 Problem 4.	Employee Departments
*********************************/

SELECT  
     e.FirstName
   , e.LastName
   , e.Salary
   , d.[Name] AS DeptName
FROM  
     Employees AS e
     JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY e.DepartmentID

/************************************
 Problem 5.	Employees Without Project
*************************************/

SELECT TOP (3)  
     e.EmployeeID
   , e.FirstName
FROM  
     Employees AS e
     LEFT JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY 
     e.EmployeeID;

---------------------
-- Subquerie
SELECT TOP (3)
    e.EmployeeID
   , e.FirstName
FROM  
     Employees AS e
WHERE EmployeeID NOT IN (SELECT EmployeeID From EmployeesProjects)

/********************************
 Problem 6.	Employees Hired After
*********************************/
SELECT
     e.FirstName
   , e.LastName
   , e.HireDate
   , d.[Name]
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
WHERE e.HireDate > '1.1.1999' AND d.[Name] IN ('Sales', 'Finance')
ORDER BY e.HireDate

/*********************************
 Problem 7.	Employees with Project
**********************************/
SELECT TOP (5)
     e.EmployeeID
   , e.FirstName
   , p.[Name] AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p ON p.ProjectID = ep.ProjectID
WHERE p.StartDate > CONVERT(smalldatetime, '13/08/2002', 103) AND p.EndDate IS NULL
ORDER BY e.EmployeeID

/*********************************
 Problem 8.	Employees with Project
**********************************/
SELECT
     e.EmployeeID
   , e.FirstName
   , CASE
     WHEN YEAR(p.StartDate) >= 2005 THEN NULL
	 ELSE p.[Name]
	 END AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24

/*********************************
 Problem 9.	Employee Manager
**********************************/
SELECT
     e.EmployeeID
   , e.FirstName
   , mng.EmployeeID
   , mng.FirstName AS ManagerName
FROM Employees AS e
JOIN Employees AS mng ON e.ManagerID = mng.EmployeeID
WHERE e.ManagerID IN (3, 7)
ORDER BY e.EmployeeID

/*********************************
 Problem 10. Employee Summary
**********************************/



/*********************************
 Problem 12. Highest Peaks in Bulgaria
**********************************/
USE Geography

SELECT 
       c.CountryCode
	 , m.MountainRange
	 , p.PeakName
	 , p.Elevation
FROM 
     Countries AS c
     JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
     JOIN Mountains AS m ON mc.MountainId = m.Id
     JOIN Peaks AS p ON m.Id = p.MountainId
WHERE p.Elevation > 2835 AND c.CountryName = 'Bulgaria'
ORDER BY p.Elevation DESC


/**********************************
 Problem 13. Count Mountains Ranges
***********************************/
SELECT 
       c.CountryCode
	 , COUNT(mc.CountryCode) AS MountainRanges
FROM 
     Countries AS c
	 JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode AND c.CountryName IN ('Bulgaria', 'Russia', 'United States')
GROUP BY c.CountryCode

/**********************************
 Problem 14. Countries with Rivers
***********************************/

SELECT TOP (5)
	c.CountryName
	, r.RiverName
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
WHERE c.ContinentCode = 'AF'
ORDER BY c.CountryName

/**********************************
 Problem 15. Continents and Currencies
***********************************/