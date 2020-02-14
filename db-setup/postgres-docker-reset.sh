docker stop dittodb-postgres
docker rm dittodb-postgres
# docker exec dittodb-postgres mysql -p6c9FT%Kj -e "DROP DATABASE nycflights;"

bash db-setup/postgres-docker.sh

# retry until postgres is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  ( docker exec -i dittodb-postgres psql -U postgres ) < db-setup/postgres-reset.sql && break
  n=$[$n+1]
done

( docker exec -i dittodb-postgres psql -U postgres nycflights ) < db-setup/postgres-nycflights.sql
