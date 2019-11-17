# reset postgress databases
psql -h postgres -U travis -c "DROP DATABASE IF EXISTS nycflights;"
psql -h postgres -U travis -c "CREATE DATABASE nycflights;"
