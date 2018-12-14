#!/usr/bin/env bash

#The Network Time Protocol (NTP) is a protocol used to synchronize computer system clock automatically over a networks. The machine can have the system clock use Coordinated Universal Time (UTC) rather than local time.
############ 修改系统时区,解决java程序获取系统时间与实际时间不一致问题
# 查看系统时区
timedatectl

# 设置成上海时区 Time zone: Asia/Shanghai (CST, +0800)
timedatectl  set-timezone Asia/Shanghai

# 设置开启ntp网络时间
timedatectl set-ntp on

# 设置开启ntp时间同步
timedatectl set-ntp true



########### 防火墙(centos7) https://www.cnblogs.com/zhangzhibin/p/6231870.html
# status running & not running
firewall-cmd --state
# stop
systemctl stop firewalld.service



############ 查看内存
free -g
df -h
du -sh



############ .tar .tar.gz .gz
# 解压
tar zxvf FileName.tar.gz
tar xvf FileName.tar
gunzip FileName.gz
unzip FileName.zip
rar x FileName.rar
# 压缩
tar cvf FileName.tar DirName
tar zcvf FileName.tar.gz DirName
gzip FileName
zip FileName.zip DirName
rar a FileName.rar DirName



############ 搜索终端屏幕
ctrl + shift + f




############ HISTORY
# 设置历史格式
export HISTTIMEFORMAT='%F %T '

# 文本形式查看历史命令
history | grep -i "tail"

# 搜索keyword，再次输入
ctrl + R + keyword



# 查看linux版本
cat /etc/redhat-release
lsb_release -a


# 带宽信息查看
sudo ethtool eth1



# 查找文件,根据文件大小(c是byte),文件名查找,支持正则
find / -size 1500c
find /home -name  test.*
