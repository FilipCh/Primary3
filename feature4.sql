CREATE TABLE Technologies (
    technology_id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    technology_name VARCHAR(150)
);

CREATE TABLE Project (
    project_id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    project_name varchar(255),
    project_value DECIMAL(10,2)
);

CREATE TABLE ProjectTechnologies (
    project_id MEDIUMINT,
    technology_id MEDIUMINT,
    PRIMARY KEY (project_id, technology_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (technology_id) REFERENCES Technologies(technology_id)
);

-- Adding technologies
INSERT INTO Technologies (technology_name)
	VALUES 
    ('Java'),
	('Python'),
    ('Node');

-- Search to confirm a Sales employee
SELECT team_type as `Team type`, employee_name AS `Name`
FROM Team T
LEFT JOIN Employee E on T.team_id = E.team_id
WHERE T.team_type = 'Sales';

-- adding project
INSERT INTO Project (project_name, project_value)
	VALUES ('Water Project', 500000.00),
    ('Wind Project', 40000.00),
    ('Sky Project', 1000000.00),
	('Music Project', 200000.00);
    
INSERT INTO ProjectTechnologies (project_id, technology_id)
	VALUES 
    (1, 2),
    (1, 3);
    
-- Check the project information 
SELECT project_name AS `Project Name`, project_value AS `Project Value`, GROUP_CONCAT(technology_name SEPARATOR ', ') AS `Technologies` FROM Project P
LEFT JOIN ProjectTechnologies PT ON P.project_id = PT.project_id
LEFT JOIN Technologies T ON PT.technology_id = T.technology_id
GROUP BY project_name;
