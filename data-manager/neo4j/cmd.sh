#!/usr/bin/env bash

#windows: neo4j cmd
neo4j.bat status | stop | start | restart


#linuxs: neo4j cmd
./neo4j status | stop | start | restart


#changePwd 没有忘记密码,修改密码
:server change-password

#deletePwd 忘记密码
删除data/dbms/auth文件--重新启动
