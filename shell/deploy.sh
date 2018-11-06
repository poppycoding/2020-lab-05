#!/usr/bin/env bash

# 更新代码
cd /code/sourcedata
git pull

# 打包编译
mvn clean package -Dmaven.test.skip=true

# 杀死正在运行的进程
port=8080
#根据端口号查询对应的pid
pid=$(netstat -nlp | grep :${port} | awk '{print $7}' | awk -F"/" '{ print $1 }');

#杀掉对应的进程，如果pid不存在，则不执行
if [  -n  "${pid}"  ];  then
    kill  -9  ${pid};
fi

# 删除程序包
rm -rf /sourcedata/sourcedata.jar
# 复制程序包
mv /code/sourcedata/target/sourcedata.jar /sourcedata
# 运行程序
cd /sourcedata
nohup java -jar sourcedata.jar &