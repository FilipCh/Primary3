-- Creating client table
CREATE TABLE `Client`(
client_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
client_name varchar(255),
address varchar(255),
phone_number varchar(10),
created_on DATETIME
);

-- Search to confirm a Sales employee
SELECT team_type as `Team type`, employee_name AS `Name`
FROM Team T
LEFT JOIN Employee E on T.team_id = E.team_id
WHERE T.team_type = 'Sales';

-- Create Client
INSERT INTO `Client` (client_name, address, phone_number, created_on)
	VALUES ('Jonny Bravo', '26 derry drive', '0777536842', NOW());
    
-- Show all clients
Select client_name, address, phone_number FROM `Client`;