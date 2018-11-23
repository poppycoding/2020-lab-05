#!/usr/bin/env bash

# start es
nohup bin/elasticsearch &


# install es head
Git clone git://github.com/mobz/elasticsearch-head.git
Cd elasticsearch-head
Npm install


# start head (安装前要完成nodejs, grunt的安装,npm方式启动，在head插件目录中执行 )
grunt server &
Open http://localhost:9100


