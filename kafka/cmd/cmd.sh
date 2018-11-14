#!/usr/bin/env bash

############ start zk (内置zk)
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zk.log 2>&1 &



############ start kafka
1.nohup bin/kafka-server-start.sh config/server.properties > kafka.log 2>&1 &

2.bin/kafka-server-start.sh -daemon config/server.properties



############ check zk节点信息
bin/kafka-topics.sh --zookeeper localhost:2181 --list


############ 创建topic,复制replication 3份,分区partitions 5个
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 5 --topic test


./kafka-console-producer.sh --broker-list localhost:9092 --topic test_ha

./kafka-console-consumer.sh --bootstrap-server 192.168.241.13:9092 --topic metadata_topic_table --from-beginning




############ cmd: start monitor
# jar: https://github.com/quantifind/KafkaOffsetMonitor/releases

# monitor启动; 通过java -cp命令, -zk后面加zk地址端口,逗号拼接;

# window & linux环境均可执行如下命令,启动报错Failed to load class "org.slf4j.impl.StaticLoggerBinder" ===>> 忽略即可!

# 查看端口:AbstractConnector:Started SocketConnector@0.0.0.0:50822

# web: http://127.0.0.1:50822/#/  ===>> 浏览器访问即可!

java -cp KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk 192.168.241.11:2181,192.168.241.17:2181,192.168.241.13:2181 --refresh 5.minutes --retain 1.day &





############ cmd: start manager
# zip: 源码用的play框架,需要用sbt编译,麻烦!==>直接网盘资源: https://blog.csdn.net/isea533/article/details/73727485

# application.conf: 修改zk地址,kafka-manager.zkhosts="192.168.241.11:2181,192.168.241.17:2181,192.168.241.13:2181"
# 注意: kafka-manager.zkhosts似乎任意一个正确的zk地址即可,后续web页面手动自定义填写相关zk地址

# 配置权限: basicAuthentication.enabled=true 开启账号密码相关

# windows下直接bat命令执行,默认9000端口,通过如下命令,指定端口后台运行,linux同理

# web: http://127.0.0.1:8099  ===>> 浏览器访问即可!

# 新建一个集群名称:Cluster Name; 输入zk的ip逗号分隔: Cluster Zookeeper Hosts; kafka版本选择最接近部署的版本,保存即可查看相关信息!

# 杀掉进程重启的时候,删除报错的pid文件: This application is already running (Or delete /root/apps/kafka-manager/RUNNING_PID file).

nohup bin/kafka-manager -Dconfig.file=conf/application.conf -Dhttp.port=8099 &
