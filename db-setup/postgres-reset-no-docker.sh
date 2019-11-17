# reset postgress databases
sudo -u postgres createuser -s travis
sudo -u postgres psql -U travis -c "DROP DATABASE IF EXISTS nycflights;"
sudo -u postgres psql -U travis -c "CREATE DATABASE nycflights;"
