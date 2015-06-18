#!/bin/bash

#### When you run a script it gets its own shell and its own environment, which disappears again as soon as the script is finished. To keep the environment variables around, source the script into your shell/script:
source broker-list.sh

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=$HOST_IP -e ZK_PORT_2181_TCP_ADDR=$DOCKER_ZOOKEEPERS -i -t kafkadocker_kafka:latest /bin/bash
