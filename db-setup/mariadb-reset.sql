DROP DATABASE IF EXISTS nycflights;
CREATE DATABASE nycflights;
CREATE USER IF NOT EXISTS 'travis'@'%';
CREATE USER IF NOT EXISTS 'travis'@'localhost';
GRANT ALL ON *.* TO 'travis'@'%';
GRANT ALL ON *.* TO 'travis'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'travis'@'%' IDENTIFIED BY '';
ALTER USER 'travis'@'localhost' IDENTIFIED BY '';
FLUSH PRIVILEGES;

