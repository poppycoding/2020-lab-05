#!/usr/bin/env bash
echo 192.168.200.156 mq > /etc/hosts
echo rabbitmq > /etc/hostname
export HOSTNAME=mq


127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6



[rabbitmq-erlang]
name=rabbitmq-erlang
baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/20/el/7
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1

yum install -y erlang

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm




[{rabbit, [{loopback_users, []}]}].










rpm -Uvh https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.3/rabbitmq-server-3.7.3-1.el7.noarch.rpm




rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator
rabbitmqctl  set_permissions -p "/" admin '.*' '.*' '.*'
rabbitmqctl list_user_permissions admin












-------

vim /etc/yum.repos.d/rabbitmq-erlang.repo


[rabbitmq-erlang]
name=rabbitmq-erlang
baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/20/el/7
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1





rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm

yum install rabbitmq-server-3.6.10-1.el7.noarch.rpm


systemctl start rabbitmq-server
systemctl status rabbitmq-server
systemctl restart rabbitmq-server
#设置为开机启动
systemctl enable rabbitmq-server



vi /etc/rabbitmq/rabbitmq.config
loopback_users = none
