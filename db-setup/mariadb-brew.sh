rm -f /etc/my.cnf
brew install mariadb
brew services start mariadb
mkdir /usr/local/etc/my.cnf.d
sleep 10
# TODO: add dbrootpass if it doesn't exist?
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBROOTPASS';"
