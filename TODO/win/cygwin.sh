################################ win下安装cygwin相关shell

# 1.官网下载exe: https://cygwin.com/install.html
# 选择相关依赖包安装基础环境,自行搜索网上相关资料,不太统一,大致安装gcc,make,lynx,git,vim,curl相关...可能下载10G+
# 如果没有下载完,应该问题不大,可以通过安装apt-cyg继续命令行安装(重新运行setup.exe似乎可以,太费时间!!)
gcc.. make... lynx...



# 2.配置bin目录到win的path环境变量中eg:
C:\Apps\Dev\Cygwin\bin


# 2.1如果是中文界面，修改英文末尾加入export LANG='en_US'
vim ~/.bashrc
source ..


# 3.启动安装之后apt-cyg
git clone https://github.com/transcode-open/apt-cyg.git
cd apt-cyg/
install apt-cyg /bin
# 也可以通过lynx安装apt-cyg
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin



# 3.1.常用命令
apt-cyg -h


# 4.安装curl
apt-cyg install curl


# 5.安装zsh
apt-cyg install zsh




# 6.安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# 6.1.配置zsh相关插件
# 1.修改.bash_profile最后一行加入 exec zsh ===>> 修改默认shell为zsh
vim ~/.bash_profile
source ..


# 2.安装插件git clone源码然后修改.zshrc的内容
# 3.安装自动补全autosuggestions
git clone http://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# 修改文件,添加zsh-autosuggestions即可
vim ~/.zshrc
plugins=(git zsh-autosuggestions)



# 4.安装zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 修改.zshrc文件
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)



# 5.安装autojump
git clone http://github.com/joelthelion/autojump.git $ZSH_CUSTOM/plugins/autojump

# install之后生成提示修改文件
cd /autojump
./install.py

# 修改添加脚本的提示如:[[ -s /home/elijahdu/.autojump/etc/profile.d/autojump.sh ]] && source /home/elijahdu/.autojump/etc/profile.d/autojump.sh
vim ~/.zshrc


# 如果是centos环境安装autojump请用yum否则会爆出error如下： command not found: uname
#/root/.autojump/share/autojump/autojump.zsh:22: command not found: uname
#/usr/libexec/grepconf.sh: line 5: grep: command not found
yum install autojump-zsh







