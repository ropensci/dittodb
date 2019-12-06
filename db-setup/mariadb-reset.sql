DROP DATABASE IF EXISTS nycflights;
CREATE DATABASE nycflights;
CREATE USER IF NOT EXISTS 'travis'@'%';
GRANT ALL ON *.* TO 'travis'@'%';
GRANT ALL ON *.* TO 'travis'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'travis'@'%' IDENTIFIED BY '';
ALTER USER 'travis'@'localhos' IDENTIFIED BY '';
FLUSH PRIVILEGES;

