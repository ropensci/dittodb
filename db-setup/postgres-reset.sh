# reset postgress databases in docker
docker exec dbtest-postgres psql -U travis -c "DROP DATABASE IF EXISTS nycflights;"
docker exec dbtest-postgres psql -U travis -c "CREATE DATABASE nycflights;"
