CREATE DATABASE PrimaryThree;

USE PrimaryThree;

CREATE TABLE Technologies (
    technology_id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    technology_name VARCHAR(150)
);

CREATE TABLE Project (
    project_id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    project_name varchar(255),
    project_value INT,
    project_complete BOOLEAN,
    tech_lead_id MEDIUMINT,
    client_id MEDIUMINT
);

CREATE TABLE ProjectTechnologies (
    project_id MEDIUMINT,
    technology_id MEDIUMINT
);



