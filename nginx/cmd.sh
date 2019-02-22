#!/usr/bin/env bash

# 下载对应stable版本

# win安装nginx-解压启动
https://nginx.org/en/download.html


# linux安装nginx-解压编译
./configure

# centos7等系统需要gcc环境编译
yum install gcc-c++

# 报错需要PCRE等一系列环境 ./configure: error: the HTTP rewrite module requires the PCRE library.
# PCRE(Perl Compatible Regular Expressions) 是一个Perl库，包括 perl 兼容的正则表达式库。nginx 的 http 模块使用 pcre 来解析正则表达式，所以需要在 linux 上安装 pcre 库，pcre-devel 是使用 pcre 开发的一个二次开发库。
yum install -y pcre pcre-devel

#zlib 库提供了很多种压缩和解压缩的方式， nginx 使用 zlib 对 http 包的内容进行 gzip ，所以需要在 Centos 上安装 zlib 库。
yum install -y zlib zlib-devel

#OpenSSL 是一个强大的安全套接字层密码库，囊括主要的密码算法、常用的密钥和证书封装管理功能及 SSL 协议，并提供丰富的应用程序供测试或其它目的使用。
#nginx 不仅支持 http 协议，还支持 https（即在ssl协议上传输http），所以需要在 Centos 安装 OpenSSL 库。
yum install -y openssl openssl-devel

# 环境完善之后
./configure

# 编译安装(可以修改配置设置编译后的路径等信息)
make install

# 查找编译后的目录(默认/usr/local/nginx/sbin)
whereis nginx




#nginx
#检查配置文件语法
./nginx -t
#nginx: the configuration file /usr/local/nginx/nginx.conf syntax is ok
#nginx: configuration file /usr/local/nginx/nginx.conf test is successful

# (nginx -t之后返回配置文件路径:/usr/local/nginx/nginx.conf)
# 启动nginx
./nginx -c /etc/nginx/nginx.conf
ps -ef | grep nginx

#重启加载配置
./nginx -s reload

#重启不加载配置
./nginx -s reopen

#停止(停止之后不能用重启命令,只能-c + 配置文件)
./nginx -s stop




######################################### error
# 413 Request Entity Too Large nginx限制文件上传大小问题
# 修改nginx.conf[注意自己配置的server,考虑include之外的配置]在server{}段中加入client_max_body_size 20m,自定义最大上传的20m。
client_max_body_size 20m;



# 403 Forbidden 限制访问错误修改配置文件nginx.conf,头部 user root即可
user root;

