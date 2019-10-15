rm -f /etc/my.cnf
brew install mariadb
brew services start mariadb
mkdir /usr/local/etc/my.cnf.d
sleep 5
sudo mysql -u root -e "CREATE DATABASE nycflights;"
sudo mysql -u root -e "CREATE USER IF NOT EXISTS 'travis'@'localhost'; GRANT ALL ON *.* TO 'travis'@'localhost'; FLUSH PRIVILEGES;"
sudo mysql -u root -e "ALTER USER 'travis'@'localhost' IDENTIFIED BY ''; FLUSH PRIVILEGES;"
