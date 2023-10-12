-- Add delivery team to delivery table
INSERT INTO Team (team_type)
	VALUES ('Delivery');

-- Finding HR employees to allow for permissions to create a new delivery employee
SELECT E.employee_name, T.team_type FROM Team T
RIGHT JOIN Employee E ON E.team_id = T.team_id
WHERE team_type = 'HR';

-- Add delivery employee to employee table, to verify that it is possible.
INSERT INTO Employee (employee_name, salary, bank_account_number, national_insurance_number, team_id)
	VALUES 
('Alejandro', '18000', '23456789', '223456789', 3),
('Bianca', '17000', '34567890', '323456789', 2),
('Carlos', '20000', '45678901', '423456789', 1),
('Diana', '16000', '56789012', '523456789', 3),
('Evelyn', '19000', '67890123', '623456789', 2),
('Fabio', '18000', '78901234', '723456789', 1),
('Gloria', '21000', '89012345', '823456789', 3),
('Hector', '15000', '90123456', '923456789', 2),
('Irene', '22000', '11234567', '112345678', 1),
('Jack', '17000', '22134567', '212345678', 3);

-- searching for delivery employee
SELECT team_type as `Team type`, employee_name AS `Name`, salary AS `Salary`,bank_account_number AS `Bank Account Number`, 
national_insurance_number AS `National Insurance Number`
FROM Team T
LEFT JOIN Employee E on T.team_id = E.team_id
WHERE T.team_type = 'Delivery';