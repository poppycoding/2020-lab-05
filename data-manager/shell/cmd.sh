#!/usr/bin/env bash

# kill app process
ps -ef | grep data-manager.jar | grep -v grep | awk '{print $2}' | xargs kill -9
