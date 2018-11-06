#!/usr/bin/env bash

version=1.4.1
ps -ef | grep portvision- | grep -v grep | awk '{print $2}' | xargs kill -9
rm -rf portvision*
wget http://file.mchz.com.cn/projects/ue/portversion/v1.4.1/portvision-$version-bin.zip
unzip portvision-$version-bin.zip
#scp dm.sql dataMasking-web-$version/sql
cd portvision-$version
chmod +x *
sh startup.sh
