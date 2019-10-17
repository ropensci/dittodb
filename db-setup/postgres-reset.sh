# reset postgress databases in docker

docker exec -it dbtest-postgres psql -U travis -c "DROP DATABASE IF EXISTS nycflights;"
docker exec -it dbtest-postgres psql -U travis -c "CREATE DATABASE nycflights;"
