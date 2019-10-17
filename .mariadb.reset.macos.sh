sudo mysql -u root -e "DROP DATABASE IF EXISTS nycflights;"
sudo mysql -u root -e "CREATE DATABASE IF NOT EXISTS nycflights;"
sudo mysql -u root -e "CREATE USER IF NOT EXISTS 'travis'@'localhost'; GRANT ALL ON *.* TO 'travis'@'localhost'; FLUSH PRIVILEGES;"
sudo mysql -u root -e "ALTER USER 'travis'@'localhost' IDENTIFIED BY ''; FLUSH PRIVILEGES;"
