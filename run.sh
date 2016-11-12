#!/usr/bin/env bash

docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

cd ~/test_db_1/core/
sudo docker build -t core .
sudo docker run -d --name core core

cd ~/test_db_1/database/
sudo docker build -t database .
sudo docker run -d --name database -p 3316:3306 -v /data/mysql:/var/lib/mysql database


##################
# ONLY FOR DEBUG #
##################
sleep 5s
TAG="database"
CONTAINER_ID=$(docker ps | grep $TAG | awk '{print $1}')
IP=$(docker inspect $CONTAINER_ID | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')

echo $IP

#mysql -u admin -proot -h $IP

docker exec -it core /bin/bash