# This docker file is for creating Kafka Standalone
FROM yexianyi/oracle-jdk:centos7

ARG KAFKA_DOWNLOAD_LINK=http://www-us.apache.org/dist/kafka/2.0.0/kafka_2.11-2.0.0.tgz

MAINTAINER Xianyi Ye <https://cn.linkedin.com/in/yexianyi>

WORKDIR /home

RUN yum update -y \
	
	# Download and unzip Kafka
	&& wget $KAFKA_DOWNLOAD_LINK \
	&& tar -xzf kafka_2.11-2.0.0.tgz \
	&& rm -f kafka_2.11-2.0.0.tgz \
	
	#Uninstall unecessary package
	&& yum -y remove wget \
	&& yum clean all \
	&& yum autoremove -y \
WORKDIR /home/kafka_2.11-2.0.0

EXPOSE 2181 9092
CMD bin/zookeeper-server-start.sh config/zookeeper.properties && bin/kafka-server-start.sh config/server.properties
