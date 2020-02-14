docker stop dittodb-mariadb
docker rm dittodb-mariadb

# docker exec dittodb-mariadb mysql -pr2N5y7V* -e "DROP DATABASE nycflights;"

bash db-setup/mariadb-docker.sh

# retry until mariadb is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  ( docker exec -i dittodb-mariadb mysql -pr2N5y7V* ) < db-setup/mariadb-reset.sql && break
  n=$[ $n+1 ]
done

( docker exec -i dittodb-mariadb mysql -pr2N5y7V* ) < db-setup/mariadb-nycflights.sql
