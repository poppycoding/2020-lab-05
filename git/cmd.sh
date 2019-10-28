#!/usr/bin/env bash
##### 拉取git项目时: ssh需要设置密钥,http只需要输入账号密码

#########################################安装使用：git bash
# 查看git-bash版本,更新版本
git --version
#2.17.1之前用
git update
#2.17.1之后用
git update-git-for-windows




#########################################git常用命令

# 1.查看git配置，-l（list）查看所有配置信息，可以加上三个作用域local， global， system限定范围
git config -l --global
git config -l --local
git config -l --system

# 2.配置config
git config --global user.name 'Eliajh'
git config --global user.email 'xxx@gmail.com'













# git merge命令
git merge test




# 查看用户信息
git config user.name
git config user.email

# 设置/修改用户信息
git config --global user.name "xlaser"
git config --global user.email "xlaser@gmail.com"






# git修改提交信息

# 最近5次简要信息 (详细git log -5)
git log --oneline -5

# 选择要修改的commitID下面一个!! 会展示选择的commitID之后所有的提交记录
git rebase -i commitID

# 确认要修改的commitID将pick改为reword
pick -> reword

# 之后再push
push

