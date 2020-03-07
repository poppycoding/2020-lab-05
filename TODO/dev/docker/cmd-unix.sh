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
docker image ls
docker image ls -q
docker image ls hello-world
# -filter可以加过滤条件,eg:版本since,before
docker image ls -f since=hello-world:latest
# format格式go语法
docker image ls --format "{{.ID}}:\t {{.Repository}}:\t {{.Tag}}"
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"


# 新镜像导致旧镜像失效悬挂,ls展示,prune清理
docker image ls -f dangling=true
docker image prune

# 清理容器
docker container prune

# 总体实际空间
docker system df

# 查看运行的镜像
docker ps -a

##### 若删除之前报错: Error response from daemon: No such image: ...latest,运行如下命令,清空相关卷,依赖等
docker system prune -a

# 删除对应id的镜像 (docker ps -a | awk 'NR==2{print $1}'| xargs docker rm),强制删除-f
docker rm  ID
# docker.io/nginx:仓库名
docker image rm $(docker image ls -q docker.io/nginx)
# 过滤条件删除
docker image rm $(docker image ls -q -f before=mongo:3.2)

# 安装运行nginx服务
docker run -d -p 80:80 --name webserver nginx

# 停止删除
docker stop webserver
docker rm webserver

# TODO 待测试
docker run image_name apt-get install -y app_name


# docker用unix socket通信,但是只有root用户,以及docker用户组的用户,但实际环境很少有root权限,因此创建docker用户组,添加权限
groupadd docker

# 添加当前用户到docker用户组
usermod -aG docker $USER


# eg:
# -t选项让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上，-i则让容器的标准输入保持打开
# rm：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 docker rm
docker run -it --rm \ ubuntu:18.04 \ bash


########## 进入已经启动的容器终端,建议exec命令
# 退出会stop容器
docker attach 69d1
# 退出不会stop容器
docker exec -it 69d1 bash



########## 镜像导入导出: 7691a814370e
# export
docker export 7691a814370e > xx.tar
# import
cat xx.tar | docker import - test/nginx:v1.2


######### 清空容器

# 查看所有容器id
docker ps -aq
# 停止所有容器
docker stop $(docker ps -aq)
# 删除所有
docker rm $(docker ps -aq)
# 删除所有镜像
docker rmi $(docker images -q)