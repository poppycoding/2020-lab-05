#!/usr/bin/env bash
########## 单节点redis集群搭建

# 下载tar: http://download.redis.io/releases/
wget http://download.redis.io/releases/redis-5.0.0.tar.gz

# 解压编译
tar zxvf redis-5.0.0.tar.gz
cd redis-5.0.0

make
# make报错: make[3]: gcc: Command not found >> 安装gcc之后make
yum -y install gcc automake autoconf libtool make


# 配置文件创建
mkdir redis-cluster-conf

cd redis-cluster-conf
mkdir 6379
mkdir 7379
mkdir 8379
mkdir 9379

cp ../redis.conf 6379
cp ../redis.conf 7379
cp ../redis.conf 8379
cp ../redis.conf 9379

# 修改对应的配置文件(port/pidfile需要随着文件夹修改)
port 6379  #端口
cluster-enabled yes #启用集群模式
cluster-config-file nodes.conf
cluster-node-timeout 5000 #超时时间
appendonly yes
daemonize yes #后台运行
protected-mode no #非保护模式
pidfile  /var/run/6379.pid


# 启动节点
src/redis-server ./redis-cluster-conf/6379/redis.conf
src/redis-server ./redis-cluster-conf/7379/redis.conf
src/redis-server ./redis-cluster-conf/8379/redis.conf
src/redis-server ./redis-cluster-conf/9379/redis.conf

# 启动集群
src/redis-cli --cluster create 192.168.200.156:6379 192.168.200.156:7379 192.168.200.156:8379 192.168.200.156:9379 --cluster-replicas 1

