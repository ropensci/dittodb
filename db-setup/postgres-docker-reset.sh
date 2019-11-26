docker stop dbtest-postgres
docker rm dbtest-postgres
# docker exec dbtest-postgres mysql -p6c9FT%Kj -e "DROP DATABASE nycflights;"

bash db-setup/postcres-docker.sh

# retry until postgres is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  docker exec dbtest-postgres psql -U postgres < db-setup/postgres-reset.sql && break
  n=$[$n+1]
done
