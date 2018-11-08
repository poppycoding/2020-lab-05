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
