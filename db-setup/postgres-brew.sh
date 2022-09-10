rm -rf /usr/local/var/postgres
# for odbc tests, we need to also install the odbc drivers
# we might also need to install unixodbc here if it's not already installed
# we might also need to install postgresql here if it's not already installed
brew install psqlodbc
cat <<EOT >> /usr/local/etc/odbcinst.ini
[PostgreSQL Unicode]
Description     = PostgreSQL ODBC driver (Unicode 9.2)
Driver          = /usr/local/lib/psqlodbcw.so
Debug           = 0
CommLog         = 1
UsageCount      = 1
EOT
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres start
createuser -s postgres
sleep 10
