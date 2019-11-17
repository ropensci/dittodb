# reset postgress databases
psql -h localhost -U travis -c "DROP DATABASE IF EXISTS nycflights;"
psql -h localhost -U travis -c "CREATE DATABASE nycflights;"
