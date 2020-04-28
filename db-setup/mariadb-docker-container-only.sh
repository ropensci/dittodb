# before running this, make sure to stop the travis mariadb
# sudo service mysql stop || true

docker pull mariadb

# on macos, you can only run port forwards
docker run --name dittodb-mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=r2N5y7V* -d mariadb:latest


