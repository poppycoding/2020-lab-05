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
systemctl stop firewalld.service
# 另一种关闭方法
service iptables status
service iptables stop

# 开放端口4379
firewall-cmd --zone=public --add-port=4379/tcp --permanent




############ 查看内存
free -g
df -h
du -sh

# 查看文件占用
du -sh *

# 查看文件时单位 -lh
ll -lh
ls -lh


############ .tar  .tar.gz(.tar.gzip)  .gz
# 解压
tar xvf FileName.tar
tar zxvf FileName.tar.gz
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



# 查看linux版本（lsb_release -a）
cat /etc/redhat-release
# 内核版本
uname -r
# 操作系统几位
getconf LONG_BIT



# 查看linux配置内核
# 总核数 = 物理CPU个数 X 每颗物理CPU的核数
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数
#一般情况下，逻辑cpu=物理CPU个数×每颗核数，如果不相等的话，则表示服务器的CPU支持超线程技术

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc -l

# 查看CPU信息（型号）
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c

#查看内 存信息
cat /proc/meminfo



# 带宽信息查看
sudo ethtool eth1



# 查找文件,根据文件大小(c是byte),文件名查找,支持正则
find / -size 1500c
find /home -name  test.*



# 新建用户,密码es
useradd es
passwd es

# 重置root/es密码
passwd root/es


# 更改hostname
hostname haha

# export



# 授权执行命令:  u:所有者 g:所在组 o:其他组 a:所有人(u、g、o的总和)
# 1. chmod   u=rwx, g=rx, o=x   文件目录名
# 2. chmod   o+w  文件目录名 给其他组的用户增加写的权限
# 3. chmod   a-x    文件目录名 给所有人去掉可执行文件的权限
chmod  u=rwx,g=rw,o=wx file


#r=4 w=2 x=1: chmod u=rwx,g=rx,o=x file 相当于 chmod 751 file
chmod 777 file


# 查看系统服务,并且设置开机是否启动
#上下键：可以在中间的方框当中，在各个服务之间移动；
#空格键：可以用来选择你所需要的服务，[*]表示开起启动；
#tab键：可以在方框、OK、Cancel之间移动；
#[F1]键：可以显示该服务的说明。
ntsysv
# 如果没有可以手动安装
yum install ntsysv




# telnet命令无效,或者:connect to address 127.0.0.1: Connection refused,需要安装/重新安装服务
# 先安装xinetd因为telnet要依靠xinetd服务启动
yum install xinetd
# 新增/修改配置文件,disable = yes 改成 disable = no
vim /etc/xinetd.d/telnet
#service telnet
#{
#        flags           = REUSE
#        socket_type     = stream
#        wait            = no
#        user            = root
#        server          = /usr/sbin/in.telnetd
#        log_on_failure  += USERID
#        disable         = no     #将语句 disable = yes 改成 disable = no 保存退出。激活 telnet 服务
#}
# 启动xinetd(/etc/init.d/xinetd start)
service xinetd start
service xinetd status

# 重装telnet
yum install telnet-server #安装telnet服务
yum install telnet.* #安装telnet客户端

# 查看服务(less,more,cat命令)
less /etc/services | grep telnet

# 测试执行telnet host [ip],会提示:Escape character is '^]'
telnet 127.0.0.1
# 这个提示的意思是按Ctrl + ] 会呼出telnet的命令行，出来telnet命令好之后就可以执行telnet命令，退出quit!
# 注意,如果是云主机，必须保证安全组中的对应的端口打开,否则telnet配置无效,如果普通虚拟机关闭防火墙即可!

# 查询公网ip
curl -s https://ip.cn


# linux查询结果输出到文本
# 增量 >>
java -XX:+PrintFlagsInitial >> /root/jvm.txt
# 覆盖写入 >
java -XX:+PrintFlagsInitial > /root/jvm.txt




# 查看环境变量,两个命都差不多
env
export

# 单一查看
echo $USER
echo $PATH

# 修改变量,直接用export即可
export PATH=$PATH:/opt/au1200_rm/build_tools/bin
# 也可以修改变量文件:
vi /etc/profile
# 或者
vi /root/.bashrc




# 跨ip传输文件 https://blog.csdn.net/gatieme/article/details/51673229

# 指定用户名，命令执行后输入密码，第1个仅指定了远程的目录，文件名字不变，第2个指定了文件名
scp local_file remote_username@remote_ip:remote_folder
scp local_file remote_username@remote_ip:remote_file
#没有指定用户名，命令执行后输入用户名和密码，第3个仅指定了远程的目录，文件名字不变，第4个指定了文件名
scp local_file remote_ip:remote_folder
scp local_file remote_ip:remote_file
#eg
scp 12347.stack root@116.196.92.240:/opt
scp 12347.stack root@116.196.92.240:/opt/newname.stack




# 跨ip传输文件夹
scp -r local_folder remote_username@remote_ip:remote_folder
scp -r local_folder remote_ip:remote_folder
#eg
scp -r logs/ root@192.168.240.154:/opt/


