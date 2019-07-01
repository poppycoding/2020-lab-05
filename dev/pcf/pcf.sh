#!/usr/bin/env bash


# demo
git clone https://github.com/cloudfoundry-samples/cf-sample-app-spring.git
cd cf-sample-app-spring

# 登录pcf
cf login -a https://api.run.pivotal.io
cf push


# view service
cf services


# log
cf logs cf-demo --recent
# live log
cf logs cf-demo


# create db bind
cf marketplace -s elephantsql
cf create-service elephantsql turtle cf-demo-db
cf bind-service cf-demo cf-demo-db


# restage
cf restage cf-demo



# add instances to 2
cf scale cf-demo -i 2



# increase memory to 1G
cf scale cf-demo -m 1G
# decrease  memo to 512M
cf scale cf-demo -k 512M


