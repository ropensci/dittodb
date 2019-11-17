# reset postgress databases
createuser -s travis || true
sudo -u postgres psql -c "DROP DATABASE IF EXISTS nycflights;"
sudo -u postgres psql -c "CREATE DATABASE nycflights;"
