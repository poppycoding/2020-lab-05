#!/usr/bin/env bash



############ 端口-进程互相查询命令
netstat -nap | grep 8080 | grep LISTEN
netstat -nap | grep 10425 | grep LISTEN



############ kill命令
# kill process: dms.jar (v反转)
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9

# kill process: port-8080 (2行2列)
lsof -i:8080 | awk 'NR==2{print $2}' | xargs kill -9
