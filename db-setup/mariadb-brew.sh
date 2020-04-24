rm -f /etc/my.cnf
brew install mariadb
brew services start mariadb
mkdir /usr/local/etc/my.cnf.d
sleep 2
# TODO: add dbrootpass if it doesn't exist?
sudo mysqld --port=6033
sudo mysql -u root --port=6033 -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBROOTPASS';"
