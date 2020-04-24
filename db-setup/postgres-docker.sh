# before running this, make sure stop the travis postgres
# sudo /etc/init.d/postgresql stop || true

docker pull postgres

# on macos, you can only run port forwards
docker run --name dittodb-postgres -p 2345:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=r2N5y7V* -d postgres:latest
