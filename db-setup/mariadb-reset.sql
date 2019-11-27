DROP DATABASE IF EXISTS nycflights;
CREATE DATABASE nycflights;
CREATE USER IF NOT EXISTS 'travis'@'localhost'; GRANT ALL ON *.* TO 'travis'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'travis'@'localhost' IDENTIFIED BY '';
FLUSH PRIVILEGES;

