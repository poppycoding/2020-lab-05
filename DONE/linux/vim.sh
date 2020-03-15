#!/usr/bin/env bash

# file format查看修改文件格式
:set ff?
:set ff=unix


# vim
# 跳至文件的第一行
gg
# 跳至文件第n行
[n]G

yy # 复制一行
p  # 粘贴一行
dd #  删除一行
dw #  删除一个单词



# 对比a,b两个文件
vimdff a b
