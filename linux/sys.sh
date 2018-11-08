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




###########

