#!/bin/bash
sed -i "s/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=PLAINTEXT:\/\/localhost:9092/" config/server.properties
bin/zookeeper-server-start.sh config/zookeeper.properties >> zookeeper.log &
bin/kafka-server-start.sh config/server.properties >> kafka.log
