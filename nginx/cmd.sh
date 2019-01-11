#!/usr/bin/env bash

#nginx
#检查配置文件语法
./nginx -t
#nginx: the configuration file /usr/local/nginx/nginx.conf syntax is ok
#nginx: configuration file /usr/local/nginx/nginx.conf test is successful

# (nginx -t之后返回配置文件路径:/usr/local/nginx/nginx.conf)
# 启动nginx
./nginx -c /etc/nginx/nginx.conf
ps -ef | grep nginx

#重启加载配置
./nginx -s reload

#重启不加载配置
./nginx -s reopen

#停止(停止之后不能用重启命令,只能-c + 配置文件)
./nginx -s stop




######################################### error
# 413 Request Entity Too Large nginx限制文件上传大小问题
# 修改nginx.conf 在http{}段中加入client_max_body_size 20m,自定义最大上传的20m。
client_max_body_size 20m;
