#!/usr/bin/env bash
##### 拉取git项目时: ssh需要设置密钥,http只需要输入账号密码

#########################################安装使用：git bash
# 查看git-bash版本,更新版本
git --version
#2.17.1之前用
git update
#2.17.1之后用
git update-git-for-windows


# Linux需要安装最新版本,参考：https://www.cnblogs.com/lhbryant/p/6928894.html
#安装git依赖包
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker

# 删除已有的git
yum remove git

# 下载git源码,速度慢的话手动网页下载ftp上传
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
# 网页查看命令help,如查看log的相关
git help --web log


# 查看git配置,-l（list）查看所有配置信息,可以加上三个作用域local, global, system限定范围
git config -l --global
git config -l --local
git config -l --system

# 作用于范围比较,实际上.git下的config就是local的配置,会优先于全局配置
#local > global > system

# 配置config
git config --global user.name 'Eliajh'
git config --global user.email 'xxx@gmail.com'
# 清除某一个配置
git config unset --global user.email

# 也可以找到配置文件位置直接编辑
# local
vim .git/config
# 也可以直接config指定编辑
git config --global --edit

# 提交空记录
git commit --allow-empty -m'这里可以提交一个空记录'

git status


# 新建文件之后add,可以多个,然后提交
git add .. ..

# 如果是修改文件,已经被git追踪的可以直接update,然后commit提交
git add -u
# 还可以直接-am不需要放到暂存区,直接提交到远程
git commit -am'test am'


# 文件重命名用逻辑步骤：修改
# 修改
mv reademe reademe.md
# 删除旧文件
git rm reademe
# 添加新文件
git add reademe.md

# 可以用mv命令实现,本质上最后暂存区git都记录了rename
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


# 使用git自带的图形化界面gitk命令,左上角file中有start git gui可以查看详情提交等
gitk
gitk --all
# 如果是centos界面可能会报错,请安装tcl,tk： /usr/local/git/bin/gitk: line 3: exec: wish: not found
yum install tcl
yum install tk

# 注意两者在cherry-pick时有区别,pick的时候保留作者信息,注重版权,但是committer是你,
author
committer


# .git目录
# 1.HEAD当前的工作分支：如下就在test分支,这里修改test为master等价于checkout到master
refs/heads/test

# 2.config下的是local配置

# 3.查看refs的内容： heads,tags
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

# git中的对象： commit, tree, blob
# commit：当前位置的一次快照,内容就是一个tree,然后里面包含了各种文件夹tree,和文件bolb
# tree：代表文件夹,里面是blob
# blob：代表文件,git下只要文件内容一致,那么只会存在一个blob给文件名字无关


# 分离头指针：指的是当前工作目录不在任何分支上,如果这个时候切换分支,git日后会清除掉这个记录
You are in 'detached HEAD' state.
# 例如：创建分支的时候忘记加参数-b就会造成不在任何分支上
git checkout -b new-branch-name
git checkout 90c6c0e63465e0e5a0e8cdd4f9381d733161c3a2
# 这个时候切换分支,git会提示这个分离头指针的问题,如果要保留就需要基于这个游离状态创建新分支
# 两种创建分支的命令checkout不仅创建分支而且直接切换到分支,branch则不是
git branch your__branch_name 90c6c0e63465e0e5a0e8cdd4f9381d733161c3a2


# head的用法波浪号加数字等价于尖括号,这个的HEAD代表的就是当前的commit
git diff HEAD HEAD^
git diff HEAD HEAD~1
git diff HEAD HEAD^^
git diff HEAD HEAD~2


# 删除分支-d, -D
git branch -d branch_name
# 强制删除-D
git branch -D branch_name


# 对最近一次的commit做变更
git commit --amend
# 修改一次commit消息,rebase变基操作,基于父亲做变更,也就是要修改的commit上次提交的id,进入交互式界面,修改pick为r
git rebase -i father_commit_id

# 1.合并连续的commit消息,基于父亲变基,不需要写区间,估计默认是Head到选择的id之间,然后选择一个pick,下面的修改pick为s
git rebase -i father_commit_id
# 2.合并不连续的commit消息,正常就是基于父亲,选择要合并的消息,然后手动移到一起修改pick为s,
# 同时会报错：error: could not apply 986ddab... 使用continue继续操作即可
git rebase --continue
# 3.注意如果是根部的消息合并,没有父亲可选,需要手动复制commitid到rebase上去,同时合并后之后发现git tree上会有两个根部节点



# 比较暂存区和HEAD的差异
git diff --cached

# 比较工作区和暂存区,默认比较所有,可以指定不同的文件或者多个
git diff
git diff file_name

# 比较不同分支的差异(可以指定某个文件-- file)
git diff dev master -- file_name
# 比较不同commit的差异
git diff commitID1 commitID2 -- file_name


# 暂存区撤销,恢复HEAD一样：============>> 暂存区用reset,工作区用checkout
git reset HEAD
# 暂存区部分撤销
git reset HEAD -- index.html index2.html


# 把工作区index.html(某个文件)恢复成暂存区的模样：============>> 工作区用checkout,暂存区用reset
git checkout -- index.html


# 消除某次commitID之前的所有提交用reset hard这样暂存区和工作区都回到了当前commit_id
git reset --hard commitID



# 正确删除已经提交的文件: rm file_name删除工作区,git rm file_name把删除的文件提交到暂存区==>>等价于git rm
git rm file_name


# 工作中临时加塞任务,可以使用statsh命令,把当前工作内容放到不影响工作区的地方,完成其他变更提交之后利用pop/apply还原之前的状态
# 注意还原之前如果工作区有内容会abort,此外stash不是暂存区staged,可以看成一个堆栈,pop会取出第一个
git stash

# 查看statsh堆栈列表
# stash@{0}: WIP on master: a7b6668 test 3333
# stash@{1}: WIP on master: a7b6668 test 3333
git stash list

# 取出stash存放的内容apply不会删除
git statsh apply

# 取出stash存放的内容pop会删除statsh
git stash pop


# 忽略文件用.gitignore文件
.gitignore

# 备份本地仓库
# 哑协议：clone时不带进度条,没有对文件进行压缩优化,不建议使用,bare参数表明不clone工作区内容,只clone .git文件
git clone  /root/dev/git-learning/.git /root/dev/backup/ya_xie_yi
git clone --bare /root/dev/git-learning/.git /root/dev/backup/ya_xie_yi
# 智能协议：clone时带进度条,对文件进行压缩优化,智能协议有本地的file协议,http/https/ssh协议
git clone --bare file:///root/dev/git-learning/.git /root/dev/backup/zhi_neng_xie_yi

# 增加远端用remote,也即是备份的仓库,在当前目录下用remote命令
git remote add zhineng file:///root/dev/backup/zhi_neng_xie_yi

# 直接push到远端（如果报错需要set-upstream）
git push zhineng --all

# 利用push命令推送到远端remote名字+ remote的baranch名字
git push --set-upstream zhineng branch_name

# pull 和 fetch
# fetch是拉取远端内容到本地,但是不与本地发生关联
git fetch remote master
# pull先fetch到本地,然后与本地merge关联到一棵树
git pull remote master



# fast-forwards：fast-forward是直接合并,看不出之前dev的任何记录
git merge dev
# No-Fast-forward: no-ff会多生成一个commit记录,并强制保留dev分支的开发记录
git merge --no-ff -m "No Fast Forward" dev
# fast-forwards可以直接push，不是fast-forwards的要先merge才行！？？？

# merge遇到两个分支没有关联,相互独立的两棵树时报错merging unrelated histories,（使用git merge -h）
#fatal: refusing to merge unrelated histories
git merge dev --allow-unrelated-histories

# merge遇到冲突时，可以命令行修改，也可以图形化界面修改，也可以用--abort退出merge
git merge --abort
# 当解决完冲突之后，生成新的commit即可
git commit -am 'Resolve the conflicts'


########################禁止向集成分支强制push########################
# 会抹去远程所有commit信息，全部换成自己本地的commit
git push -f
# 强制指定远端分支指向特定的commit
git push -f origin 6a5c10b:master
git push -f origin 6a5c10b:dev

########################禁止向集成分支历史做变基操作########################
# 会修改分支commit信息，其他成员本地的分支历史与远程经过变基之后的信息形成差异，导致push问题
git rebase


# github对于pull request分支合并处理方式有三种，eg:dev -> master
# 1.create a merge commit===>通过merge方式，把dev的commit信息添加到master，两个分支指向一个新的commit
# 2.squash and merge===>把dev的commit合并成一个，然后添加到master,不改变dev指向，如果有冲突，解决生成新的commit
# 3.rebase and merge===>把dev的commit都添加到master，不产生新的commit，dev不改变指向，有冲突解决后产生新的commit

# 注意用rebase策略时，如果遇到冲突过多，以及其他原因时，没法进行rebase到master时，只能先dev通过rebase变基master
# 完成rebase之后再在master分支上通过rebase/merge
git rebase origin/master
# rebase的时候，多个commit会出现多次冲突情况，只能不断地continue解决，直到最后解决完
git rebase --continue
# 解决之后用add表示resolve
git add .
##############################利用git-rerere工具减少continue############################
# 参考：https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-Rerere
##### 新版本git似乎已经自动减少continue的次数？？？



