#!/bin/bash

export HOST_IP=`boot2docker ip`
echo 'HOST_IP='$HOST_IP

CONTAINERS=$(docker ps | grep 9092 | awk '{print $1}')
BROKERS=$(for CONTAINER in $CONTAINERS; do docker port $CONTAINER 9092 | sed -e "s/0.0.0.0:/$HOST_IP:/g"; done)
export DOCKER_BROKERS=`echo $BROKERS | sed -e 's/ /,/g'`
echo 'DOCKER_BROKERS='$DOCKER_BROKERS

CONTAINERS=$(docker ps | grep 2181 | awk '{print $1}')
ZOOKEEPERS=$(for CONTAINER in $CONTAINERS; do docker port $CONTAINER 2181 | sed -e "s/0.0.0.0:/$HOST_IP:/g"; done)
export DOCKER_ZOOKEEPERS=`echo $ZOOKEEPERS | sed -e 's/ /,/g'`
echo 'DOCKER_ZOOKEEPERS='$DOCKER_ZOOKEEPERS
