# these directories don't exist by default, so create them, 
# and make sure that the runner can access them. 
sudo mkdir -p /usr/local/etc/
sudo chown runner /usr/local/etc/
sudo chmod 770 /usr/local/etc/

sudo mkdir -p /usr/local/var/
sudo chown runner /usr/local/var/
sudo chmod 770 /usr/local/var/

# we need both psqlodbc postgresql 
brew install psqlodbc postgresql

# setup the odbc driver
cat <<EOT >> /usr/local/etc/odbcinst.ini
[PostgreSQL Unicode]
Description     = PostgreSQL ODBC driver (Unicode 9.2)
Driver          = /usr/local/lib/psqlodbcw.so
Debug           = 0
CommLog         = 1
UsageCount      = 1
EOT

# start the actual database running
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres start
createuser -s postgres
sleep 10
