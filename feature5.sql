-- Add Management to delivery table
-- Create new table for delievry employees on a project
CREATE TABLE DeliveryEmployeeProject(
project_id MEDIUMINT,
employee_id MEDIUMINT,
isActive bool,
createdOn DATETIME,
updatedOn DATETIME,
FOREIGN KEY (project_id) REFERENCES Project(project_id),
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Add management to team type
INSERT INTO Team (team_type)
	VALUES ('Management');   
    
    -- Add Mangement to employee table, to verify that it is possible.
INSERT INTO Employee (employee_name, salary, bank_account_number, national_insurance_number, team_id)
	VALUES ('Karen', '200000', '65745555', '786851968', 4);

-- Finding Management employees to allow for permissions to add delivery employees
SELECT E.employee_name, T.team_type FROM Team T
RIGHT JOIN Employee E ON E.team_id = T.team_id
WHERE team_type = 'Management';

-- finding all delivery employees for selection
SELECT E.employee_name, T.team_type FROM Team T
RIGHT JOIN Employee E ON E.team_id = T.team_id
WHERE team_type = 'Delivery';

-- If they are management insert delivery employees into projects
INSERT INTO DeliveryEmployeeProject(project_id, employee_id, isActive, createdOn, updatedOn) VALUES
(1, 9, true, '2023-01-10 08:00:00', '2023-01-10 08:00:00'),
(2, 11, true, '2023-02-15 09:00:00', '2023-02-15 09:00:00'),
(3, 14, false, '2023-03-20 10:00:00', '2023-03-20 10:00:00'),
(1, 17, true, '2023-04-25 11:00:00', '2023-04-25 11:00:00'),
(2, 9, false, '2023-05-30 12:00:00', '2023-05-30 12:00:00'),
(3, 14, true, '2023-06-05 13:00:00', '2023-06-05 13:00:00');

-- Find all the delivery team members and their projects they are working 
SELECT employee_name AS `Name`, GROUP_CONCAT(project_name SEPARATOR ', ') AS `Projects` FROM Employee E 
LEFT JOIN DeliveryEmployeeProject DEP ON E.employee_id = DEP.employee_id
LEFT JOIN Project P ON P.project_id = DEP.project_id 
WHERE E.team_id = 3
GROUP BY employee_name;



