# reset postgress databases
sudo -u postgres psql -U travis -c "DROP DATABASE IF EXISTS nycflights;"
sudo -u postgres psql -U travis -c "CREATE DATABASE nycflights;"
