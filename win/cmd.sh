#!/usr/bin/env bash

#https://www.jianshu.com/p/bb0ba62b519c


# win下的包管理器:scoop(等价于Linux的apt,mac下的homebrew)安装使用
# cmd命令行切换到powerShell
powerShell

# 安装下载
set-executionpolicy remotesigned -s cu
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# 安装权限(有些程序或许需要),包安装目录默认C:\Users\xxx\scoop\apps
scoop install sudo

# 尝试安装curl,注意-安装需要解压,会默认安装7z
scoop install curl
scoop install grep sed less touch


# 安装不存在的包: Couldn't find manifest for 'jdk'
scoop install jdk
# scoop自带的下载APP比较少一些其他第三方的软件需要添加bucket中，如下方法添加
scoop bucket add extras https://github.com/lukesampson/scoop-extras.git
# 安装三方包如：jdk
scoop install extras/oraclejdk


# 其他相关 ... ...
scoop install python ruby go perl
