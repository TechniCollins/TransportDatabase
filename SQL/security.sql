#DATABASE SECURITY CODE
#First create roles for users
CREATE ROLE 'transportdb_developer', 'transportdb_admin', 'record_keeper', 'transportdb_driver';
#Create roles that will be given to users and/or developers different permissions
GRANT ALL ON transportDatabase.* TO 'transportdb_developer' IDENTIFIED BY "pwd_developer";#super user gets all privileges
GRANT INSERT, SELECT, UPDATE ON transportDatabase.* TO 'transportdb_admin';#Admin can edit existing records
GRANT INSERT, SELECT ON transportDatabase.* TO 'record_keeper';#records_keeper cannnot alter records once submitted (UPDATE)
GRANT SELECT, UPDATE(email) ON transportDatabase.driverRecords TO 'transportdb_driver';#Drivers can only edit email information

/*#Create users to assign the roles to
CREATE USER 'collins'@'localhost'IDENTIFIED BY "pwd_collins";
CREATE USER 'kandie'@'localhost' IDENTIFIED BY 'pwd_kandie';
CREATE USER 'raiyyan'@'localhost' IDENTIFIED BY 'pwd_raiyyan';

#Give the users the roles defined above
GRANT 'transportdb_developer' TO 'collins'@'localhost';
GRANT 'transportdb_admin' TO 'raiyyan'@'localhost';
GRANT 'record_keeper' TO 'kandie'@'localhost';
*/