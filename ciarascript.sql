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