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
