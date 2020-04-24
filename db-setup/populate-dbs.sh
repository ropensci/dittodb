psql -h 127.0.0.1 -U postgres -p 2345 -f db-setup/postgres-reset.sql
psql -h 127.0.0.1 -U postgres -p 2345 -d nycflights -f db-setup/postgres-nycflights.sql

mysql -h 127.0.0.1 -u root -p 6033 -e "source db-setup/mariadb-reset.sql"
mysql -h 127.0.0.1 -u root -p 6033 -e "source db-setup/mariadb-nycflights.sql"
