rm -f /etc/my.cnf
brew install mariadb
brew services start mariadb
mkdir /usr/local/etc/my.cnf.d
# TODO: add dbrootpass if it doesn't exist?
sudo mysql -u root "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBROOTPASS';"
sleep 2
