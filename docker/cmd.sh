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

# 安装运行nginx服务
docker run -d -p 80:80 --name webserver nginx

# 停止删除
docker stop webserver
docker rm webserver

# todo 待测试
docker run image_name apt-get install -y app_name


# docker用unix socket通信,但是只有root用户,以及docker用户组的用户,但实际环境很少有root权限,因此创建docker用户组,添加权限
groupadd docker

# 添加当前用户到docker用户组
usermod -aG docker $USER


# eg:
# it：这是两个参数，一个是 -i：交互式操作，一个是 -t 终端。我们这里打算进入 bash 执行一些命令并查看返回结果，因此我们需要交互式终端。
# rm：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 docker rm。
docker run -it --rm \ ubuntu:18.04 \ bash

