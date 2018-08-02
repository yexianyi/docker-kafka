#!/bin/bash
partitions=${PARTITION:-1}
replica=${REPLICA:-1}
brokers=${BROKERS:-1}

#Launch Zookeeper
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zookeeper.log &

for((i=0;i<brokers;i++));
    do
        #config kafka for each broker
        cp config/server.properties config/server-$i.properties
        sed -i "s/broker.id=0/broker.id=${i}/" config/server-$i.properties
        sed -i "s/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/:909$((2+i))/" config/server-$i.properties
        sed -i "s/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=PLAINTEXT:\/\/localhost:909$((2+i))/" config/server-$i.properties
        sed -i "s/log.dirs=\/tmp\/kafka-logs/log.dirs=\/tmp\/kafka-logs-${i}/" config/server-$i.properties

        #Launch server {i}
        nohup bin/kafka-server-start.sh config/server-$i.properties > kafka-$i.log &
    done

tail -f logs/server.log
