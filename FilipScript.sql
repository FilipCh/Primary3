CREATE TABLE SalesEmployee(
sales_employee_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
employee_ID MEDIUMINT,
commisionRate int
);

CREATE TABLE DeliveryEmployeeProject(
project_id MEDIUMINT,
delivery_employee_id MEDIUMINT,
isActive bool,
createdOn DATETIME,
updatedOn DATETIME
);

CREATE TABLE `Client`(
client_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
clientName varchar(255),
address varchar(255),
phoneNumber varchar(10),
createdOn DATETIME,
sales_employee_id MEDIUMINT
);

