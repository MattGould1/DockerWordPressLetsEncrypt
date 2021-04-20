#!/bin/bash

# load env variables
source .env

docker exec $MYSQL_CONTAINER_NAME sh -c 'exec mysqldump \
  -hlocalhost \
  -uroot \
  -p$MYSQL_ROOT_PASSWORD \
  $MYSQL_DATABASE \
  > /home/database/backup.sql'

# Use said to replace the url in the db with the production server url
sed -i "s|http\:\/\/localhost\:8080|$PRODUCTION_SERVER|g" database/backup.sql
sed -i "s|http\:\/\/localhost|$PRODUCTION_SERVER|g" database/backup.sql
sed -i "s|http\:\/\/127.0.0.1|$PRODUCTION_SERVER|g" database/backup.sql

echo 'Backup complete'
