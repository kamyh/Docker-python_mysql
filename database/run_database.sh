#!/usr/bin/env bash

docker build -t mysql .
docker run -d -p 3316:3306 -v /data/mysql:/var/lib/mysql mysql

sleep 5s

TAG="mysql"

CONTAINER_ID=$(docker ps | grep $TAG | awk '{print $1}')

IP=$(docker inspect $CONTAINER_ID | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')

mysql -u admin -proot -h $IP
