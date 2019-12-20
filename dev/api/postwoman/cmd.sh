# postwoman安装启动
git clone https://github.com/liyasthomas/postwoman.git
npm install

# 默认端口访问:localhost:3000
npm run dev


# 修改默认端口,也即是修改nuxt启动端口
cd postwoman
vim nuxt.config.js

# 33行添加端口信息: port: "4000",注意语法host后添加逗号,重新启动即可
  server: {
    host: "0.0.0.0", // default: localhost
    port: "4000"

  }


# 如果安装pm2管理器,通过pm2启动如下
pm2 start d:/dev/postwoman/postwoman/node_modules/nuxt/bin/nuxt.js --name postwoman

# pm2相关命令
pm2 list
pm2 start postwoman
...
