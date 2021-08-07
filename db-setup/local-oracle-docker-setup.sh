if [ -z "$(docker ps -a -q -f name=dittodb-oraclexe)" ]
then
  echo "Starting docker container fresh..."
else
  echo "Do you wish to remove and recreate the running containers?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) docker stop dittodb-oraclexe; docker rm dittodb-oraclexe; break;;
          No ) echo "Cancelling, no changes made"; exit;;
      esac
  done
fi

bash db-setup/oracle-xe-docker-container-only.sh

# retry until oracle is up (or 15 times)
# TODO: wait until status is healthy?
n=0
until [ $n -ge 50 ]
do
  echo "so sleepy $n"
  sleep 30
  docker ps | grep -q "(healthy).*dittodb-oraclexe"
  if [[ $? = 0 ]]; then
    break
  fi
  n=$[ $n+1 ]
done

# TODO: do we need a separate .sql file here?
( docker exec -i dittodb-oraclexe sqlplus sys/r2N5y7V@XE as sysdba ) < db-setup/postgres-reset.sql && break


# TODO: do we need a separate .sql file here?
( docker exec -i dittodb-dittodb-oraclexe sqlplus / as sysdba postgres nycflights ) < db-setup/postgres-nycflights.sql
