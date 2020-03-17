#!/usr/bin/env bash

# 查看服务安装情况，例如：erlang
rpm -qa | grep -i erlang
rpm -qa telnet*

# 删除包
rpm -e erlang-hipe-21.2-1.el7.x86_64
# 报依赖错误（error: Failed dependencies:）
rpm -e erlang-hipe-21.2-1.el7.x86_64 --nodeps
# error: %preun(xxxxxx) scriptlet failed, exit status 1
rpm -e --noscripts erlang-hipe-21.2-1.el7.x86_64


# 下载curl/wget
curl -O https://download.jetbrains.8686c.com/upsource/upsource-2019.1.1644.zip
wget https://download.jetbrains.8686c.com/upsource/upsource-2019.1.1644.zip
