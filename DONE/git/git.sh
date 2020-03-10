#!/usr/bin/env bash
############### 拉取git项目时: ssh需要设置密钥,http只需要输入账号密码 ###############


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


# 查看/更新版本
git --version
git update-git-for-windows


# 网页查看命令help,如查看log的相关
git help --web log


# 图形化界面
gitk
gitk --all
git gui
# 如果是centos界面可能会报错,请安装tcl,tk： /usr/local/git/bin/gitk: line 3: exec: wish: not found
yum install tcl
yum install tk


# git有三个作用域,优先级从高到低依次是:local -- global -- system,通常用来配置git账户信息,查看配置详情可以用confgi list命令
git config -l --local
git config -l --global
git config -l --system


# git配置/清除账户信息,也就是提交代码生成的name和email
git config --global user.name 'Elijah'
git config --local user.name 'Elijah'
git config --global user.email 'Elijah@gmail.com'
git config --unset --global user.email


# 如果上述设置不生效,或者执行失败,可以vim直接编辑本地.git/config是local配置,或者命令行全局编辑global配置文件
vim .git/config
git config --global --edit


# common
git status
git add reademe.md
git add .
git add -u
git mv remade remade.md


# commit
git commit --allow-empty -m '这里可以提交一个空记录'
git commit -am '可以直接提交不在暂存区的文件'


# log
git log
git log --graph --all
git log --oneline
git log --oneline dev
git log --oneline -6


# .git目录
# 1.HEAD当前的工作分支：如下就在test分支,这里修改test为master等价于checkout到master
refs/heads/test

# 2.查看refs的内容： heads,tags
# heads里存放了所有的工作空间也就是分支文件,实际上就是当前分支的commit id.
# tags里存放的是所有的tag信息,实际也是commit id,里程碑的意思.


# git里的对象类型查看,git中都是加密摘要,只要不重复,可以输入任意长度查看比如: a1e416b18923f76519753075e0809c603f8b82d7
# 查看heads中的master文件,可以看到是:commit
git cat-file -t master
# 或者查看master文件的commit id可以得到结果: commit
git cat-file -t a1e416b18

# -p也可以文件的内容,-t是查看类型
git cat-file -p master


# git中的对象： commit, tree, blob
# commit：当前位置的一次快照,内容就是一个tree,然后里面包含了各种文件夹tree,和文件bolb
# tree：代表文件夹,里面是blob
# blob：代表文件,git下只要文件内容一致,那么只会存在一个blob给文件名字无关


# head的用法: 波浪号加数字等价于尖括号,这个的HEAD代表的就是当前的commit
git diff HEAD HEAD^
git diff HEAD HEAD~1
git diff HEAD HEAD^^
git diff HEAD HEAD~2

# 比较暂存区和HEAD的差异
git diff --cached

# 比较工作区和暂存区,默认比较所有,可以指定不同的文件或者多个
git diff
git diff file_name

# 比较不同分支的差异(可以指定某个文件-- file)
git diff dev master -- file_name
# 比较不同commit的差异
git diff commitID1 commitID2 -- file_name





############################################# Branch #############################################
# 创建分支基于某一次commit id,不需要完整的id
git checkout -b new_branch 90c6c0e634
# git基于master创建新分支new branch
git checkout -b new_branch master
# branch命令也可以创建分支但是不自动切换,checkout直接切换到新建的分支
git branch new_branch 90c6c0e
# 推送到远程,建立关系
git push --set-upstream origin new_branch

# 删除分支-d
git branch -d branch_name
# 强制删除-D
git branch -D branch_name
# 删除远端分支
git branch --delete --remotes  origin/feature/agent
git branch -dr origin/feature/agent

# 分支重命名(old->new)
# 1.重命名local分支名
git branch -m old new
# 2.删除远端old分支
git branch -dr origin/old
# 3.重新推送本地new到远端,并且建立关联关系
git push --set-upstream origin new

# git查看分支关联的远程信息
git branch -vv


# 分离头指针：指的是当前工作目录不在任何分支上,如果这个时候切换分支,git日后会清除掉这个记录
You are in 'detached HEAD' state.
# 创建分支,忘记加参数-b就会造成不在任何分支上,这个时候切换分支,git会提示这个分离头指针的问题,如果要保留就需要基于这个游离状态创建新分支
git checkout 90c6c0e



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

# blame查看提交细节,L限定行数
git blame file
git blame -L 10,20 file

# log也能查看,不如blame详细,L限定行数
git log file
git log -L 10,20:file






############################################# Mirror #############################################
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


# 仓库迁移1
git remote rename origin old-origin
# 添加新的远程仓库
git remote add origin git@new.git
# all:推送所有分支, tags:推送所有本地新增的标签,默认情况下不会推送tag
git push -u origin --all
git push -u origin --tags
# 其他成员重设远程仓库地址
git remote set-url origin git@new.git


# 仓库迁移2
# 镜像命令添加本地内容到远程(注意本地必须存在所有分支,否则无法镜像未拉取的分支)
git push --mirror git@new.git
# 重设远程仓库地址
git remote set-url origin git@new.git

# 查看当前远程仓库地址
git remote -v






############################################# Push #############################################
# pull 和 fetch
# fetch是拉取远端内容到本地,但是不与本地发生关联
git fetch remote master
# pull先fetch到本地,然后与本地merge关联到一棵树
git pull remote master


# fast-forwards：fast-forward是直接合并,看不出之前dev的任何记录
git merge dev
# No-Fast-forward: no-ff会多生成一个commit记录,并强制保留dev分支的开发记录
git merge --no-ff -m "No Fast Forward" dev

# merge遇到两个分支没有关联,相互独立的两棵树时报错merging unrelated histories,（使用git merge -h）
#fatal: refusing to merge unrelated histories
git merge dev --allow-unrelated-histories

# merge遇到冲突时，可以命令行修改，也可以图形化界面修改，也可以用--abort退出merge
git merge --abort

# 当解决完冲突之后，生成新的commit即可
git commit -am 'Resolve the conflicts'

# 会抹去远程所有commit信息，全部换成自己本地的commit
git push -f

# 强制指定远端分支指向特定的commit
git push -f origin 6a5c10b:master
git push -f origin 6a5c10b:dev

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

# fetch时添加prune参数是保证远端已经清除的分支等信息,拉取时在本地也会自动清除,如果不加不会清除本地的信息
git fetch --prune
git fetch -p






############################################# Tag #############################################
# tag里程碑
# 创建,默认是当前commit
git tag v-1.0

# 创建时添加额外备注信息
git tag -a v-1.0 -m "you can after -a add 'tag name' and add tag note info after -m!"

# 查看所有tag
git tag
# 查看远端所有tag
# 查看远端所有tag即使已经删除(暂时不确定)
git show-ref --tag
# 查看远端tag,额外多出来删除后又创建回来的tag(暂时不确定),同时tag后面特殊标记:^{},eg: refs/tags/v-0.0.1^{}
git ls-remote --tags origin

# 旧版git-v1.7.0之前删除远端tag之前,必须先删除本地tag,然后推送
# 先删除本地tag,然后同步到远端
git tag -d v-0.0.1
git push origin :refs/tags/v-0.0.1
# 删除本地所有tag
git tag -l | xargs git tag -d
# 然后同步到远端,使用awk等管道匹配删除(git show-ref --tag筛选需要确定)
git show-ref --tag| awk '{print ":"$2}' | xargs git push origin

# git-v1.7.0之后删除tag方法直接加参数--delete即可删除远端tag,本地tag删除方法同上
git push origin -d tag v-0.0.2
# 删除所有本地/远端tag
git tag -l | xargs git tag -d
git show-ref --tag | xargs git push origin -d

# 创建tag到指定commit
git tag v-2.0 commitID
git tag -a v-2.0 -m "version 2.0 success to publish haha!"

# 查看详细的tag信息
git show v-2.0

# 推送某个tag到远端
git push origin v-2.0

# 推送所有tag到远端
git push origin --tags





# 忽略文件用.gitignore文件
.gitignore



