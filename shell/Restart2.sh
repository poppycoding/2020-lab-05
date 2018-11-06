#!/bin/bash
echo 'the program is restarting ... ...'
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
cd ../deploy
nohup java -jar dms.jar &
echo 'the program is running ... ...'
tail -100f logs/info.log
