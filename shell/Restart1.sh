#!/bin/bash
echo 'the program is restarting ... ...'
#ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
lsof -i:8091 | awk 'NR==2{print $2}' | xargs kill -9
cd ../deploy
nohup java -jar port.jar &
echo 'the program is running ... ...'
tail -100f logs/info.log
