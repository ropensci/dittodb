rm -rf /usr/local/var/postgres
rm -rf /usr/local/bin/psql
# for odbc tests, we need to also install the odbc drivers
# we might also need to install unixodbc here if it's not already installed.
brew install postgresql psqlodbc
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
/usr/local/opt/postgres/bin/createuser -s postgres
# psql -U postgres -c 'SHOW config_file'
sed -i 's/#port = 5432/port = 2345/g' /usr/local/var/postgres/postgresql.conf
pg_ctl -D /usr/local/var/postgres restart
sleep 2
