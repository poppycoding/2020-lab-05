#!/usr/bin/env bash

# start yapi
pm2 start d:/dev/Yapi/my-yapi/vendors/server/app.js  --name yapi
pm2 info yapi
pm2 stop yapi
pm2 start yapi
pm2 restart yapi

# first package
mvn verify sonar:sonar -D skipTests