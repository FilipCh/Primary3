CREATE DATABASE Primary3_CiaraS;

USE Primary3_CiaraS;

CREATE TABLE Team (
	team_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    team_type VARCHAR(255)
    );
    
CREATE TABLE Employee (
	employee_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(255),
    salary DECIMAL(10,2),
    bank_account_number CHAR(8),
    national_insurance_number CHAR(9),
    team_id MEDIUMINT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
	);   
    
CREATE TABLE SalesEmployee (
	employee_id MEDIUMINT PRIMARY KEY,
    commission_rate DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
    );

-- Insert fake data into the Team table
INSERT INTO Team (team_type)
VALUES
    ('Sales'),
    ('HR');

-- Insert fake data into the Employee table
INSERT INTO Employee (employee_name, salary, bank_account_number, national_insurance_number, team_id)
VALUES
    ('John Doe', 60000, '12345678', 'AB123456C', 1),
    ('Jane Smith', 55000, '23456789', 'CD234567D', 2),
    ('David Johnson', 70000, '34567890', 'EF345678E', 2),
    ('Emily Davis', 48000, '45678901', 'GH456789F', 1);

-- Insert fake data into the SalesEmployee table
INSERT INTO SalesEmployee (employee_id, commission_rate)
VALUES
    (5, 0.10),
    (8, 0.08);

-- We are assuming that we can restrict to HR employees to add a Sales employee using Java/web dev technologies.
-- Query to find HR employees:
SELECT employee_name AS `Name`, salary AS `Salary`,bank_account_number AS `Bank Account Number`, 
national_insurance_number AS `National Insurance Number`, commission_rate AS `Commission Rate` 
FROM SalesEmployee SE
LEFT JOIN Employee E ON E.employee_id = SE.employee_id;
