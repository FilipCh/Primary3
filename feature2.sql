-- Add delivery team to delivery table
INSERT INTO Team (team_type)
	VALUES ('Delivery');

-- Finding HR employees to allow for permissions to create a new delivery employee
SELECT E.employee_name, T.team_type FROM Team T
RIGHT JOIN Employee E ON E.team_id = T.team_id
WHERE team_type = 'HR';

-- Add delivery employee to employee table, to verify that it is possible.
INSERT INTO Employee (employee_name, salary, bank_account_number, national_insurance_number, team_id)
	VALUES ('Dallan', '15000', '12345678', '123456789', 3);

-- searching for delivery employee
SELECT team_type as `Team type`, employee_name AS `Name`, salary AS `Salary`,bank_account_number AS `Bank Account Number`, 
national_insurance_number AS `National Insurance Number`
FROM Team T
LEFT JOIN Employee E on T.team_id = E.team_id
WHERE T.team_type = 'Delivery';