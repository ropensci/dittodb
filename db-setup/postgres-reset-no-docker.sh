# reset postgress databases
sudo -u postgres createuser -s travis
psql -U travis -c "DROP DATABASE IF EXISTS nycflights;"
psql -U travis -c "CREATE DATABASE nycflights;"
