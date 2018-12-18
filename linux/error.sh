#!/usr/bin/env bash

# 登陆 centos 提示错误 ABRT has detected 2 problem(s). For more info run: abrt-cli list --since 1544679777 (abrt查看错误信息)
abrt-cli list --since 1544679777
# 最后,root权限执行 The Auto reporting feature is disabled 'abrt-auto-reporting enabled' asa user with root privileges
abrt-auto-reporting enabled



# linux内核锁 BUG: soft lockup - CPU#2 stuck for 22s! [lsmd:767],务器跑大量高负载程序，造成cpu soft lockup.
# soft lockup：内核软死锁，这个bug并没有让系统彻底死机，但是若干进程/线程被锁死在某个状态。
echo 30 > /proc/sys/kernel/watchdog_thresh
tail -1 /proc/sys/kernel/watchdog_thresh
# 临时生效
sysctl -w kernel.watchdog_thresh=30


# 永久生效 ? ?
vi /etc/sysctl.conf
kernel.watchdog_thresh=30
