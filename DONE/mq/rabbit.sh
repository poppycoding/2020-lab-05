#!/usr/bin/env bash
############################################# Docker #############################################
# https://juejin.im/post/5dabec98e51d4524c06047aa


# 获取镜像列表,自定义拉取版本
docker search rabbitMq
docker pull docker.io/rabbitmq:3.8-management

# 查看rabbitMQ镜像ID: b23cfb64730
docker images

# 创建运行容器: name指定了容器名称,d指定容器以后台守护进程方式运行,p指定容器内部端口号与宿主机之间的映射,
# rabbitMq默认要使用15672为其web端界面访问时端口,5672为数据通信端口
docker run --name rabbitmq -d -p 15672:15672 -p 5672:5672 4b23cfb64730

# 查看正在运行的容器: 3ae75edc48e2416292db6bcae7b1054091cb
docker ps

# 查看容器日志
docker logs -f 3ae75ed

# 默认是guest访问限制,添加root
# 进入到rabbitMq容器内部
docker exec -i -t 3ae bin/bash

# 看所有用户即可看到root用户已经添加成功
rabbitmqctl list_users

# 用户名:root,密码:123456
rabbitmqctl add_user root 123456
# 赋予root用户所有权限
rabbitmqctl set_permissions -p / root ".*" ".*" ".*"
# 赋予root用户administrator角色
rabbitmqctl set_user_tags root administrator
rabbitmqctl list_users

# exit
exit







############################################# Rpm #############################################
# 待定
rpm -Uvh https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.3/rabbitmq-server-3.7.3-1.el7.noarch.rpm

# 准erlang环境
# 添加
vim /etc/yum.repos.d/rabbitmq-erlang.repo
[rabbitmq-erlang]
name=rabbitmq-erlang
baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/20/el/7
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1
# 安装
yum install -y erlang

# 准备rabbitmq环境 3.6: wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm
# 3.7版本下载: http://www.rabbitmq.com/install-rpm.html#downloads
yum install rabbitmq-server-3.7.10-1.el7.noarch.rpm

# 启动/关闭/重启
systemctl start rabbitmq-server
systemctl status rabbitmq-server
systemctl restart rabbitmq-server

#设置为开机启动
systemctl enable rabbitmq-server

# 查看已有插件，直接安装
rabbitmq-plugins list

# web插件: 15672
rabbitmq-plugins enable rabbitmq_management

# 日志插件,同时配置web页面: https://blog.csdn.net/u013256816/article/details/76039201
# 默认日志路径: /var/tmp/rabbitmq-tracing/publish.log
rabbitmq-plugins enable rabbitmq_tracing

# 额外插件地址：https://www.rabbitmq.com/community-plugins.html
# wget或者sftp下载上传到对应的plugins位置解压
/usr/lib/rabbitmq/lib/rabbitmq_server-3.7.10/plugins

# 例如：延迟队列插件下载zip，解压之后安装
rabbitmq-plugins enable rabbitmq_delayed_message_exchange

# 查看已经安装插件
rabbitmq-plugins list --enabled

# 开放,15672,5672端口
firewall-cmd --zone=public --add-port=15672/tcp --permanent
firewall-cmd --zone=public --add-port=5672/tcp --permanent
firewall-cmd --reload

# 添加配置文件内容(允许guest访问): [{rabbit, [{loopback_users, []}]}].
vi /etc/rabbitmq/rabbitmq.config

# 添加 admin/admin用户
rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p "/" admin '.*' '.*' '.*'
rabbitmqctl list_user_permissions admin

# 查看所有队列信息
rabbitmqctl list_queues

# 交换机信息
rabbitmqctl list_exchanges
