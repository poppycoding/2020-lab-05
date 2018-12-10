#!/usr/bin/env bash

# kill app process
ps -ef | grep data-manager.jar | grep -v grep | awk '{print $2}' | xargs kill -9


# kill app process
lsof -i:8080 | awk 'NR==2{print $2}' | xargs kill -9


# 手动调采集脚本
python3 /discover_data/sourcedata-py/main1.py 2 11


bin/kafka-topics.sh --zookeeper localhost:2181 --list

# 集群备份 + 分区
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_sample
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_db
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_table
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_view
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_column
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_server
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_kettle
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic metadata_topic_deploy

# cloudera集群
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_sample
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_db
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_table
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_view
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_column
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_server
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_kettle
bin/kafka-topics --create --zookeeper master:2181 --replication-factor 3 --partitions 3 --topic metadata_topic_deploy

bin/kafka-console-producer --broker-list master:9092 --topic metadata_topic_sample

bin/kafka-console-consumer --zookeeper master:2181 --topic metadata_topic_sample --from-beginning

bin/kafka-topics --zookeeper master:2181 --list







bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic test_ha

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test_ha

bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test_ha --from-beginning


# 单节点replication-factor复制因子参数必须存在,且大于零
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_sample
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_db
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_table
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_view
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_column
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_server
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_kettle
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic metadata_topic_deploy

