# upsource安装使用linux

# 下载linux版本的zip压缩包到服务器,也可以先下载到本地上传到服务器(链接获取:可以在google点击下载,查看详情进度条上面查找具体链接)
# 文件1G左右大小,请耐心等待下载
curl -O https://download.jetbrains.8686c.com/upsource/upsource-2019.1.1644.zip

# 解压
upzip upsource-2019.1.1644.zip
mv upsource-2019.1.1644.zip upsource

# 修改ip端口等有必要的配置
cd upsource
vim conf/internal/bundle.properties
# ip/port
base-url=http\://10.248.37.193\:8080
listen-port=8080

# 启动/停止
bin/upsource.sh start
bin/upsource.sh stop
bin/upsource.sh restart

# web访问(启动后生成token),初始化简单配置,设置admin账号密码信息
# Configuration Wizard will be available on [http://10.248.37.193:8080?wizard_token=LjQ07k1oRf6a2J34i28T] after start
http://10.248.37.193:8080

# 配置权限相关: 添加用户角色信息,首次登陆需要改密码,邀请需要配置邮箱通知等smtp信息
...

# 导入项目: 配置仓库地址,认证等信息(建议使用秘钥)
...

# idea下载upsource插件,配置连接自动打开浏览器,填写账号密码完成认证
http://10.248.37.193:8080


# 网页/idea中可以添加comments,@相关人员
...

# 网页中可以添加review,idea中可以查看
...
