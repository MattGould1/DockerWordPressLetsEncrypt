#!/bin/bash
# load env variables
source .env

echo $MYSQL_CONTAINER_NAME

docker exec $MYSQL_CONTAINER_NAME sh -c 'exec mysql -hlocalhost -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /home/database/backup.sql'
echo 'Restore complete'
