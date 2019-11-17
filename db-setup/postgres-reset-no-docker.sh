# reset postgress databases
sudo -u postgres psql -c "DROP DATABASE IF EXISTS nycflights;"
sudo -u postgres psql -c "CREATE DATABASE nycflights;"
