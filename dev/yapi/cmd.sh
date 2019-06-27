#!/usr/bin/env bash

# https://www.jianshu.com/p/9a9505e213de

# 环境要求 nodejs（7.6+)  mongodb（2.6+） git   pm2: pm2带有负载均衡功能的Node应用的进程管理器

# 安装server
npm install -g yapi-cli
yapi server

# 浏览器访问本地9090
# 启动mongo
mongod -dbpath D:/Dev/DB/MongoDB/MongoDB/data

# 浏览器页面开始部署,安装依赖时可能一直卡在这里，这时可以手动停掉,进入部署路径my-yapi/vendors，删除node_modules文件夹，
# 然后在my-yapi/vendors下手动运行命令安装依赖：
npm i

# 启动服务(命令行界面非后台)
node vendors/server/app.js

# 初始化管理员账户,修改config.json中的账号之后vendors中运行
#初始化管理员账号成功,账号名："****@admin.com"，密码："ymfe.org"
npm run install-server

# 安装pm2
npm install pm2 -g
# 后台启动服务
pm2 start vendors/server/app.js

# 常用命令
pm2 list
# <app_name|id|'all'|json_conf>
pm2 show     id
pm2 stop     app_name
pm2 restart  id
pm2 delete   all