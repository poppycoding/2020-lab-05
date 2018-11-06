#!/bin/bash
echo 'The program is stopping ... ...'
ps -ef | grep dms.jar | grep -v grep | awk '{print $2}' | xargs kill -9
echo '... ... ...'
echo 'the program stop successfully !'
