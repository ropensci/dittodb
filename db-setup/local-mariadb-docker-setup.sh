if [ -z "$(docker ps -a -q -f name=dittodb-mariadb)" ]
then
  echo "Starting docker container fresh..."
else
  echo "Do you wish to remove and recreate the running containers?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) docker stop dittodb-mariadb; docker rm dittodb-mariadb; break;;
          No ) echo "Cancelling, no changes made"; exit;;
      esac
  done
fi

bash db-setup/mariadb-docker-container-only.sh

# retry until mariadb is up (or 15 times)
n=0
until [ $n -ge 15 ]
do
  sleep 5
  ( docker exec -i dittodb-mariadb mariadb -pr2N5y7V* ) < db-setup/mariadb-reset.sql && break
  n=$[ $n+1 ]
done

( docker exec -i dittodb-mariadb mariadb -pr2N5y7V* ) < db-setup/mariadb-nycflights.sql
