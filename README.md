# docker-kafka
## For standalone:<br>
docker run -it -p9092:9092 -p2181:2181 -d yexianyi/kafka <br>
or <br>
docker run -it -P -d yexianyi/kafka <br>

## Useful Commands:<br>

### Create Topic:<br>
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test<br>

### Send some messages<br>
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test<br>

### Consume message:<br>
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning<br>

### Start Zookeeper in manually<br>
bin/zookeeper-server-start.sh config/zookeeper.properties<br>

### Start kafka Server in manually<br>
bin/kafka-server-start.sh config/server.properties<br>
