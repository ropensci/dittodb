# before running this, make sure stop the travis postgres
# sudo /etc/init.d/postgresql stop || true

docker pull postgres

# Get the port used in DITTODB_MARIA_TEST_PORT, else use the default
POSTGRESPORT=${DITTODB_PG_TEST_PORT:-5432}

# on macos, you can only run port forwards
docker run --name dittodb-postgres -p $POSTGRESPORT:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=r2N5y7V* -d postgres:latest
