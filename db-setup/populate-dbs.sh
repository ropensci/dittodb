psql -h 127.0.0.1 -U postgres -f db-setup/postgres-reset.sql
psql -h 127.0.0.1 -U postgres -d nycflights -f db-setup/postgres-nycflights.sql

mysql -h 127.0.0.1 -u root -e "source db-setup/mariadb-reset.sql"
mysql -h 127.0.0.1 -u root -e "source db-setup/mariadb-nycflights.sql"
