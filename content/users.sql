USE stream_service;

######################### USERS

# Usuario con acceso solo a SELECT:
CREATE USER 'user_1'@'localhost' IDENTIFIED BY 'testpassword';
GRANT SELECT ON *.* TO 'user_1'@'localhost';

# Usuario con acceso a SELECT, INSERT y UPDATE:
CREATE USER 'user_2'@'localhost' IDENTIFIED BY 'testpassword';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'user_2'@'localhost';
