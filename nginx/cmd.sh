#!/usr/bin/env bash

#nginx
#检查配置文件
nginx -t
#启动(nginx -t之后返回配置文件路径path)
nginx -c  path
ps -ef | grep nginx
#重启加载配置
nginx -s reload
#重启不加载配置
nginx -s reopen
#停止(停止之后不能用重启命令,只能-c + 配置文件)
nginx -s stop
