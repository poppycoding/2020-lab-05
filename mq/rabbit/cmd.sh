#!/usr/bin/env bash
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


# 准备rabbitmq环境
wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm
yum install rabbitmq-server-3.6.10-1.el7.noarch.rpm


# 添加配置文件内容(允许guest访问): [{rabbit, [{loopback_users, []}]}].
vi /etc/rabbitmq/rabbitmq.config


# 启动/关闭/重启
systemctl start rabbitmq-server
systemctl status rabbitmq-server
systemctl restart rabbitmq-server

#设置为开机启动
systemctl enable rabbitmq-server



# 查看已有插件，直接安装
rabbitmq-plugins -list

# web插件: 15672
rabbitmq-plugins enable rabbitmq_management

# 额外插件地址：https://www.rabbitmq.com/community-plugins.html
# wget或者sftp下载上传到对应的plugins位置
/usr/lib/rabbitmq/lib/rabbitmq_server-3.6.10/plugins

# 例如：延迟队列插件下载zip，解压之后安装
rabbitmq-plugins enable rabbitmq_delayed_message_exchange




# 开放,15672,5672端口
firewall-cmd --zone=public --add-port=15672/tcp --permanent
firewall-cmd --zone=public --add-port=5672/tcp --permanent
firewall-cmd --reload


# 默认guest/guest访问(只能访问localhost,上面配置loopback_users即可)
# 添加 admin/admin用户
rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator
rabbitmqctl  set_permissions -p "/" admin '.*' '.*' '.*'
rabbitmqctl list_user_permissions admin



