CREATE DATABASE Primary3_CiaraS;

USE Primary3_CiaraS;

CREATE TABLE Team (
	team_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    team_type VARCHAR(255)
    );
    
CREATE TABLE Employee (
	employee_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(255),
    salary MEDIUMINT,
    bank_account_number CHAR(8),
    national_insurance_number CHAR(9),
    team_id MEDIUMINT
	);
    
CREATE TABLE SalesEmployee (
	sales_employee_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    employee_id MEDIUMINT,
    commission_rate DECIMAL(10, 2)
    );
    
ALTER TABLE Employee
ADD CONSTRAINT fk_team_id
FOREIGN KEY (team_id)
REFERENCES Team(team_id);

ALTER TABLE SalesEmployee
ADD CONSTRAINT fk_employee_id
FOREIGN KEY (employee_id)
REFERENCES Employee(employee_id);

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
    
select * from Employee;

-- Insert fake data into the SalesEmployee table
INSERT INTO SalesEmployee (employee_id, commission_rate)
VALUES
    (5, 0.10),
    (8, 0.08);

-- We are assuming that we can restrict to HR employees to add a Sales employee using Java/web dev technologies.
-- Query to find HR employees:
SELECT * FROM Employee
WHERE team_id = 2;
