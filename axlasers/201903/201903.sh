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



#!/bin/bash
echo 'The deployment process is starting ... ...'
#ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
lsof -i:8091 | awk 'NR==2{print $2}' | xargs kill -9
echo 'The program has been stoped !'
cd ../deploy
echo 'Create a backup ==> port.bak.jar !'
mv port.jar port.bak.jar
#update
echo 'Updating project, repackaging ... ...'
cd ../code/portvision
git pull
mvn clean package
cd target
mv port.jar ../../../deploy
#restart
echo 'The update is completed and the program is starting ... ...'
cd ../../../deploy
nohup java -jar port.jar &
tail -100f logs/info.log



#!/bin/bash
echo 'The deployment process is starting ... ...'
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
echo 'The program has been stoped !'
cd ../deploy
echo 'Create a backup ==> port.bak.jar !'
mv dms.jar dms.bak.jar
#update
echo 'Updating project, repackaging ... ...'
cd ../code/datamanagersystem
git pull
mvn clean package
cd target
mv dms.jar ../../../deploy
#restart
echo 'The update is completed and the program is starting ... ...'
cd ../../../deploy
nohup java -jar dms.jar &
tail -100f logs/info.log



#!/bin/bash
echo 'the program is restarting ... ...'
#ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
lsof -i:8091 | awk 'NR==2{print $2}' | xargs kill -9
cd ../deploy
nohup java -jar port.jar &
echo 'the program is running ... ...'
tail -100f logs/info.log



#!/bin/bash
echo 'the program is restarting ... ...'
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
cd ../deploy
nohup java -jar dms.jar &
echo 'the program is running ... ...'
tail -100f logs/info.log



nohup ./jdk1.8.0_20/bin/java -jar portvision-1.4.1.jar >/dev/null 2>&1 &




#!/bin/bash
echo 'The program is stopping ... ...'
#ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
lsof -i:8091 | awk 'NR==2{print $2}' | xargs kill -9
echo '... ... ...'
echo 'the program stop successfully !'




#!/bin/bash
echo 'The program is stopping ... ...'
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
echo '... ... ...'
echo 'the program stop successfully !'

