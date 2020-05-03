# before running this, make sure to stop the travis mariadb
# sudo service mysql stop || true

docker pull mariadb

# Get the port used in DITTODB_MARIA_TEST_PORT, else use the default
MARIAPORT=${DITTODB_MARIA_TEST_PORT:-3306}

# on macos, you can only run port forwards
docker run --name dittodb-mariadb -p $MARIAPORT:3306 -e MYSQL_ROOT_PASSWORD=r2N5y7V* -d mariadb:latest


