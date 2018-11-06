#!/usr/bin/env bash

# kill app process
ps -ef | grep data-manager.jar | grep -v grep | awk '{print $2}' | xargs kill -9


# kill app process
lsof -i:8080 | awk 'NR==2{print $2}' | xargs kill -9
