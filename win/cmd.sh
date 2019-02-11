#!/usr/bin/env bash

#https://www.jianshu.com/p/bb0ba62b519c


# win下的包管理器:scoop(等价于Linux的apt,mac下的homebrew)安装使用
# cmd命令行切换到powerShell
powerShell

# 安装下载
set-executionpolicy remotesigned -s cu
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
