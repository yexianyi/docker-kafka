#!/bin/bash
bin/zookeeper-server-start.sh config/zookeeper.properties >> zookeeper.log &
bin/kafka-server-start.sh config/server.properties >> kafka.log
