
docker pull container-registry.oracle.com/database/express:latest

# Get the port used in DITTODB_ORACLE_TEST_PORT, else use the default
ORACLEPORT=${DITTODB_ORACLE_TEST_PORT:-1521}

# on macos, you can only run port forwards
docker run --name dittodb-oraclexe -p $ORACLEPORT:1521 -e ORACLE_PWD='r2N5y7V' -d container-registry.oracle.com/database/express:latest
