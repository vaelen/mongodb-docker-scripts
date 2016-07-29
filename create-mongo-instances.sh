#!/bin/bash

echo "Creating shard0"
docker run --name mongo1 --hostname mongo1 --net=mongo-network -p 27101:27018  -d mongo:latest --replSet "shard0" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo2 --hostname mongo2 --net=mongo-network -p 27102:27018  -d mongo:latest --replSet "shard0" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo3 --hostname mongo3 --net=mongo-network -p 27103:27018  -d mongo:latest --replSet "shard0" --shardsvr --smallfiles --oplogSize 100

echo "Creating shard1"
docker run --name mongo4 --hostname mongo4 --net=mongo-network -p 27104:27018  -d mongo:latest --replSet "shard1" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo5 --hostname mongo5 --net=mongo-network -p 27105:27018  -d mongo:latest --replSet "shard1" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo6 --hostname mongo6 --net=mongo-network -p 27106:27018  -d mongo:latest --replSet "shard1" --shardsvr --smallfiles --oplogSize 100

echo "Creating shard2"
docker run --name mongo7 --hostname mongo7 --net=mongo-network -p 27107:27018  -d mongo:latest --replSet "shard2" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo8 --hostname mongo8 --net=mongo-network -p 27108:27018  -d mongo:latest --replSet "shard2" --shardsvr --smallfiles --oplogSize 100
docker run --name mongo9 --hostname mongo9 --net=mongo-network -p 27109:27018  -d mongo:latest --replSet "shard2" --shardsvr --smallfiles --oplogSize 100

echo "Creating config servers"
docker run --name mongo-config1 --hostname mongo-config1 --net=mongo-network -p 27201:27019  -d mongo:latest --configsvr --smallfiles --oplogSize 100
docker run --name mongo-config2 --hostname mongo-config2 --net=mongo-network -p 27202:27019  -d mongo:latest --configsvr --smallfiles --oplogSize 100
docker run --name mongo-config3 --hostname mongo-config3 --net=mongo-network -p 27203:27019  -d mongo:latest --configsvr --smallfiles --oplogSize 100

echo "Creating mongos"
docker run --name mongos --hostname mongos --net=mongo-network -p 27017:27017 -d mongo:latest mongos --configdb mongo-config1,mongo-config2,mongo-config3

echo "Done"
