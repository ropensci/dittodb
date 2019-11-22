# before running this, make sure to stop the travis mariadb
# sudo service mysql stop || true

docker pull mariadb

# on macos, you can only run port forwards
docker run --name dbtest-mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=r2N5y7V* -d mariadb:latest

# retry until mariadb is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  bash db-setup/mariadb-reset.sh && break  # substitute your command here
  n=$[ $n+1 ]
done

# docker stop dbtest-mariadb
# docker rm dbtest-mariadb
#
# docker exec dbtest-mariadb mysql -pr2N5y7V* -e "DROP DATABASE nycflights;"
