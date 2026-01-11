# Detect Homebrew prefix (different on Intel vs ARM Macs)
HOMEBREW_PREFIX=$(brew --prefix)

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

# setup the odbc driver using the detected Homebrew prefix
cat <<EOT >> /usr/local/etc/odbcinst.ini
[PostgreSQL Unicode]
Description     = PostgreSQL ODBC driver (Unicode 9.2)
Driver          = ${HOMEBREW_PREFIX}/lib/psqlodbcw.so
Debug           = 0
CommLog         = 1
UsageCount      = 1
EOT

# start the actual database running
${HOMEBREW_PREFIX}/bin/initdb /usr/local/var/postgres
${HOMEBREW_PREFIX}/bin/pg_ctl -D /usr/local/var/postgres start
${HOMEBREW_PREFIX}/bin/createuser -s postgres
sleep 10
