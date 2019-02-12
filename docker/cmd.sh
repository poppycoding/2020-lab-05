#!/usr/bin/env bash

# centos7-64位安装，检查版本
cat /etc/redhat-release
uname -r
getconf LONG_BIT

# yum安装
yum -y install docker

# 后台启动
systemctl start docker.service

# 测试（会自动pull然后运行，也可以先手动pull： docker pull hello-world）
docker run hello-world

# 查看镜像
docker images

# 查看运行的镜像
docker ps -a

# 删除对应id的镜像 (docker ps -a | awk 'NR==2{print $1}'| xargs docker rm)
docker rm  ID


# todo 待测试
docker run image_name apt-get install -y app_name
