#!/usr/bin/env bash

#mysql手写ping程序获取连接时,报错时区问题,可以临时设置数据库时区命令(或者代码里设置url拼接加上时区&serverTimezone=GMT%2B8)
#查看
show variables like "%time_zone%";
#修改
set global time_zone = '+8:00';
#刷新
flush privileges;



#查看数据库版本
mysql -v
