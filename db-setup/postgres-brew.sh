rm -rf /usr/local/var/postgres
# Unlink libpq first so that installing postgresql next will not error.
brew unlink libpq
# for odbc tests, we need to also install the odbc drivers
# we might also need to install unixodbc here if it's not already installed.
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
/usr/local/opt/postgres/bin/createuser -s postgres
sleep 2
