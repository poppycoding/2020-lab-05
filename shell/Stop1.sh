#!/bin/bash
echo 'The program is stopping ... ...'
#ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
lsof -i:8091 | awk 'NR==2{print $2}' | xargs kill -9
echo '... ... ...'
echo 'the program stop successfully !'
