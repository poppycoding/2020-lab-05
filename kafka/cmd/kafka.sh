#!/usr/bin/env bash


# cmd: start monitor

# jar: https://github.com/quantifind/KafkaOffsetMonitor/releases

# monitor启动; 通过java -cp命令, -zk后面加zk地址端口,逗号拼接;

# window & linux环境均可执行如下命令,启动报错Failed to load class "org.slf4j.impl.StaticLoggerBinder" ===>> 忽略即可!

# 查看端口:AbstractConnector:Started SocketConnector@0.0.0.0:50822

# web: http://127.0.0.1:50822/#/  ===>> 浏览器访问即可!

java -cp KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk 192.168.241.11:2181,192.168.241.17:2181,192.168.241.13:2181 --refresh 5.minutes --retain 1.day &



# cmd: start manager

# zip: 源码用的play框架,需要用sbt编译,麻烦!==>直接网盘资源: https://blog.csdn.net/isea533/article/details/73727485

# application.conf: 修改zk地址,kafka-manager.zkhosts="192.168.241.11:2181,192.168.241.17:2181,192.168.241.13:2181"

# windows下直接bat命令执行,默认9000端口,通过如下命令,指定端口后台运行,linux同理

# web: http://127.0.0.1:8099  ===>> 浏览器访问即可!

# 新建一个集群名称:Cluster Name; 输入zk的ip逗号分隔: Cluster Zookeeper Hosts; 保存即可查看

bin/kafka-manager -Dconfig.file=conf/application.conf -Dhttp.port=8099 &