#!/usr/bin/env bash

######################################## 有域名手动编译ngrok内网穿透
# 安装环境gti(下载),gcc(编译)
yum install gcc -y
yum install git -y

# go语言环境
yum install -y mercurial git bzr subversion golang golang-pkg-windows-amd64 golang-pkg-windows-386

# 版本检查
git --version
go version

# 源码
git clone https://github.com/inconshreveable/ngrok.git

# 生成证书（三级域名:www.a.b.com,注意www.a.b.com与a.b.com指向同一个ip，通过ping测试）
cd ngrok

export NGROK_DOMAIN="a.b.com"
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out device.key 2048
openssl req -new -key device.key -subj "/CN=$NGROK_DOMAIN" -out device.csr
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 5000

# 替换证书，单条执行，按y确认
cp rootCA.pem assets/client/tls/ngrokroot.crt
cp device.crt assets/server/tls/snakeoil.crt
cp device.key assets/server/tls/snakeoil.key

# 服务端生成
GOOS=linux GOARCH=amd64 make release-server
# 控制台启动 tunnelAddr默认：4443
./bin/ngrokd -domain="a.b.com" -httpAddr=":80" -httpsAddr=":443" -tunnelAddr=":8088" &
# 后台启动
nohup ./bin/ngrokd -domain="a.b.com" -httpAddr=":80" -httpsAddr=":443" -tunnelAddr=":8088" -log=stdout &


# 客户端生成
# win
GOOS=windows GOARCH=amd64 make release-client
# linux
GOOS=linux GOARCH=amd64 make release-client
# mac
GOOS=darwin GOARCH=amd64 make release-client

# 上传到对应的服务器（linux可执行权限）
chmod +777 ngrok

# 新建ngrok.cfg配置文件写入注意端口
server_addr: "a.b.com:8088"
trust_host_root_certs: false

# 控制台启动（监听80端口自定义）
./ngrok -config=ngrok.cfg -log=ngrok.log -subdomain=www 80
# 后台启动
nohup ./ngrok -config=ngrok.cfg -log=stdout -subdomain=www 80 &








######################################## 无域名ngrok内网穿透
# 直接下载可执行ngrok文件
https://ngrok.com/download
# win（监听8080端口自定义）
ngrok.exe http 8080
# linux
./ngrok http 8080

# 备注： 域名随机，8个小时失效，性能差解析慢！
