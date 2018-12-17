#!/usr/bin/env bash

# 登陆 centos 提示错误 ABRT has detected 2 problem(s). For more info run: abrt-cli list --since 1544679777 (abrt查看错误信息)
abrt-cli list --since 1544679777
# 最后,root权限执行 The Auto reporting feature is disabled 'abrt-auto-reporting enabled' asa user with root privileges
abrt-auto-reporting enabled
