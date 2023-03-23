CREATE DATABASE CompanyDb


CREATE TABLE  Department (
	id int NOT NULL IDENTITY PRIMARY KEY ,
	Name NVARCHAR(25) NOT NULL,
	Hiring BIT, 
	Location NVARCHAR(50), 
);

INSERT INTO Department (Name, Hiring, Location)
VALUES('Technology', 1, '1570 Woodware Ave.')

INSERT INTO Department (Name, Hiring, Location)
VALUES('Shipping & Receiving', 0, 'Southfield')

CREATE TABLE  Employees (
	SSN NCHAR(9) PRIMARY KEY ,
	DOB Date,
	Phone NCHAR(10), 
	FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL, 
    DepartmentID int FOREIGN KEY REFERENCES Department(id)
);

INSERT INTO Employees (SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES(123456789, '1975-01-05', 3135555505, 'Charles', 'Charleston', 2)

INSERT INTO Employees (SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES(987654321, '1990-05-02', 2489995555, 'Jimmy', 'Scrambles', 1)

INSERT INTO Employees (SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES(456789123, '2001-08-06', 7895555525, 'Vince', 'Jabowski', 1)

INSERT INTO Employees (SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES(654854632, '1998-04-06', 3139721400, 'John', 'Johnston', 2)

UPDATE Employees
SET LastName = 'Spiderman'
WHERE DOB = (SELECT MAX(DOB) FROM Employees); 

SELECT Employees.FirstName
FROM Employees
WHERE LastName LIKE 'j%'


DELETE FROM Employees
WHERE DOB = (SELECT MIN(DOB) FROM Employees); 

SELECT * 
FROM Employees
WHERE Phone LIKE '313%'

SELECT * 
FROM Employees
WHERE DOB < '1999-09-09'

UPDATE Employees
SET Phone = NULL
WHERE DOB > '2000-01-01'

SELECT * 
FROM Employees
WHERE Phone IS NULL

SELECT e.FirstName, e.LastName, d.ID, d.Location
FROM Employees e
INNER JOIN Department d ON e.DepartmentID = d.ID;

DROP TABLE Employees
DROP TABLE Department
