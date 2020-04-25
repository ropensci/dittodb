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
echo "
rdr pass inet proto tcp from any to any port 2345 -> 127.0.0.1 port 5432
rdr pass inet proto tcp from any to any port 6033 -> 127.0.0.1 port 3306
" | sudo pfctl -ef -
sleep 2
