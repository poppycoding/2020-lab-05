#!/usr/bin/env bash

# kill app process
ps -ef | grep data-manager.jar | grep -v grep | awk '{print $2}' | xargs kill -9


# kill app process
lsof -i:8080 | awk 'NR==2{print $2}' | xargs kill -9


#
python3 /discover_data/sourcedata-py/main1.py 2 11


./kafka-topics.sh --zookeeper localhost:2181 --list

./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_sample
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_db
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_table
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_view
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_column
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_server
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_kettle
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_deploy


./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic test_ha
./kafka-console-producer.sh --broker-list localhost:9092 --topic test_ha

./kafka-console-consumer.sh --zookeeper localhost:2181 --topic test_ha --from-beginning
