#!/usr/bin/env bash
##### 拉取git项目时: ssh需要设置密钥,http只需要输入账号密码

#########################################安装使用：git bash
# 查看git-bash版本,更新版本
git --version
#2.17.1之前用
git update
#2.17.1之后用
git update-git-for-windows


# Linux需要安装最新版本，参考：https://www.cnblogs.com/lhbryant/p/6928894.html
#安装git依赖包
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker

# 删除已有的git
yum remove git

# 下载git源码，速度慢的话手动网页下载ftp上传
wget https://www.kernel.org/pub/software/scm/git/git-2.8.3.tar.gz

#解压git安装包
tar -zxvf git-2.8.3.tar.gz
cd ..

# 配置git安装路径
make prefix=/usr/local/git all
make prefix=/usr/local/git install

# 查看git版本号
git --version




#########################################git常用命令
# 网页查看命令help，如查看log的相关
git help --web log


# 查看git配置，-l（list）查看所有配置信息，可以加上三个作用域local， global， system限定范围
git config -l --global
git config -l --local
git config -l --system

# 作用于范围比较,实际上.git下的config就是local的配置，会优先于全局配置
#local > global > system

# 配置config
git config --global user.name 'Eliajh'
git config --global user.email 'xxx@gmail.com'
# 清除某一个配置
git config unset --global user.email

# 提交空记录
git commit --allow-empty -m'这里可以提交一个空记录'

git status


# 新建文件之后add，可以多个,然后提交
git add .. ..

# 如果是修改文件，已经被git追踪的可以直接update，然后commit提交
git add -u
# 还可以直接-am不需要放到暂存区，直接提交到远程
git commit -am'test am'


# 文件重命名用逻辑步骤：修改
# 修改
mv reademe reademe.md
# 删除旧文件
git rm reademe
# 添加新文件
git add reademe.md

# 可以用mv命令实现，本质上最后暂存区git都记录了rename
git mv remade remade.md


# 创建分支基于某一次commit id,不需要完整的id
git checkout -b 90c6c0e634


# git 查看log命令
git log
# 查看图形化所有分支tree情况
git log --graph --all
# 查看默认是当前分支
git log --oneline
# 查看dev分支
git log --oneline dev
# 查看所有分支
git log --oneline --all
# 查看n个log
git log --oneline --all -n4


# 使用git自带的图形化界面gitk命令，左上角file中有start git gui可以查看详情提交等
gitk
# 如果是centos界面可能会报错，请安装tcl，tk： /usr/local/git/bin/gitk: line 3: exec: wish: not found
yum install tcl
yum install tk

# 注意两者在cherry-pick时有区别,pick的时候保留作者信息,注重版权,但是committer是你,
author
committer


# .git目录
# 1.HEAD当前的工作分支：如下就在test分支,这里修改test为master等价于checkout到master
refs/heads/test

# 2.config下的是local配置

# 3.查看refs的内容： heads，tags
# heads里存放了所有的工作空间也就是分支文件,实际上就是当前分支的commit id.
# tags里存放的是所有的tag信息,实际也是commit id,里程碑的意思.

# git里的对象类型查看,git中都是加密摘要,只要不重复,可以输入任意长度查看比如: a1e416b18923f76519753075e0809c603f8b82d7
# 查看heads中的master文件,可以看到是:commit
git cat-file -t master
# 或者查看master文件的commit id可以得到结果: commit
git cat-file -t a1e416b18

# -p也可以文件的内容,-t是查看类型
git cat-file -p master

######### objects文件夹,里面是一堆2个字母的文件夹,进去是
drwxr-xr-x 2 root root 4.0K Oct 29 17:42 da
... ...
drwxr-xr-x 2 root root 4.0K Oct 29 16:45 fd
drwxr-xr-x 2 root root 4.0K Oct 29 16:07 info
# 压缩算法???
drwxr-xr-x 2 root root 4.0K Oct 29 16:07 pack
# 随便进入一个里面是一个文件a1e416b18923f76519753075e0809c603f8b82d7,注意!!文件夹的名称+文件的名字是一个对象
# 实际上是一个blob文件类型
git cat-file -t fda1e416b18923f
# 查看你文件内容
git cat-file -p fda1e416b18923f


















# git修改提交信息

# 最近5次简要信息 (详细git log -5)
git log --oneline -5

# 选择要修改的commitID下面一个!! 会展示选择的commitID之后所有的提交记录
git rebase -i commitID

# 确认要修改的commitID将pick改为reword
pick -> reword

# 之后再push
push

