if [ -z "$(docker ps -a -q -f name=dittodb-postgres)" ]
then
  echo "Starting docker container fresh..."
else
  echo "Do you wish to remove and recreate the running containers?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) docker stop dittodb-postgres; docker rm dittodb-postgres; break;;
          No ) echo "Cancelling, no changes made"; exit;;
      esac
  done
fi

bash db-setup/postgres-docker-container-only.sh

# retry until postgres is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  ( docker exec -i dittodb-postgres psql -U postgres ) < db-setup/postgres-reset.sql && break
  n=$[ $n+1 ]
done

( docker exec -i dittodb-postgres psql -U postgres nycflights ) < db-setup/postgres-nycflights.sql
