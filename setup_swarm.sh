#!/bin/bash

# Get Internal IP of manager
MANAGER_IP=`docker-machine ssh aws-prod01 ifconfig eth0 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -1`

eval $(docker-machine env aws-prod01)

docker swarm init --advertise-addr $MANAGER_IP

TOKEN=$(docker swarm join-token -q worker)

eval $(docker-machine env aws-prod02)

docker swarm join --token $TOKEN $MANAGER_IP:2377