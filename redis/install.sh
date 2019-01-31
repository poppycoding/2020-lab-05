#!/usr/bin/env bash
# https://blog.csdn.net/u012060033/article/details/78553124
# https://ywnz.com/linuxyffq/3415.html

    #####################################
    #
    #        单节点redis集群搭建
    #
    #####################################

# 下载tar: http://download.redis.io/releases/
wget http://download.redis.io/releases/redis-5.0.0.tar.gz

# 解压编译
tar zxvf redis-5.0.0.tar.gz
cd redis-5.0.0

make
# make报错: make[3]: gcc: Command not found >> 安装gcc之后make
yum -y install gcc automake autoconf libtool make


# 配置文件创建
mkdir redis-cluster-confs

cd redis-cluster-confs
mkdir 4379
mkdir 5379
mkdir 6379
mkdir 7379
mkdir 8379
mkdir 9379

cp ../redis.conf 4379
cp ../redis.conf 5379
cp ../redis.conf 6379
cp ../redis.conf 7379
cp ../redis.conf 8379
cp ../redis.conf 9379

# 修改对应的配置文件(port/pidfile需要随着文件夹修改)
bind 127.0.0.1 #69行
protected-mode no #88行 非保护模式
port 6379 #92行
daemonize yes #136行 后台运行
pidfile /data-manager/app/redis-5.0.3/redis-cluster-pids/redis-6379.pid #158行
logfile /data-manager/app/redis-5.0.3/redis-cluster-logs/log-6379.log #171行
appendonly yes #699行
cluster-enabled yes #838行 启用集群模式
cluster-config-file /data-manager/app/redis-5.0.3/redis-cluster-nodes/node-6379.conf #846行
cluster-node-timeout 15000 #852行 #超时时间
# 待定配置
#cluster-replica-validity-factor 10 #897行
#cluster-migration-barrier 1 #916行
#cluster-require-full-coverage yes #929行



# 启动节点
src/redis-server ./redis-cluster-confs/4379/redis.conf
src/redis-server ./redis-cluster-confs/5379/redis.conf
src/redis-server ./redis-cluster-confs/6379/redis.conf
src/redis-server ./redis-cluster-confs/7379/redis.conf
src/redis-server ./redis-cluster-confs/8379/redis.conf
src/redis-server ./redis-cluster-confs/9379/redis.conf

# 启动集群(注意至少6个节点)
#ERROR: Invalid configuration for cluster creation.Redis Cluster requires at least 3 master nodes. At least 6 nodes are required.
src/redis-cli --cluster create 127.0.0.1:4379 127.0.0.1:5379 127.0.0.1:6379 127.0.0.1:7379 127.0.0.1:8379 127.0.0.1:9379 --cluster-replicas 1

#>>> Performing hash slots allocation on 6 nodes...
#[WARNING] Some slaves are in the same host as their master
#Can I set the above configuration? (type 'yes' to accept): yes
#.....
#[OK] All 16384 slots covered. 启动成功 !
