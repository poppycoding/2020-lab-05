#!/usr/bin/env bash

# 通过注册表修改浏览器代理
@echo off?
echo Start HK proxy..........
echo System will close your browser..........
taskkill /f /im iexplore.exe
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "10.128.255.41:80" /f
color 2
Start "" "C:\Program Files\Internet Explorer\iexplore.exe" "https://www.google.com/"

echo HK proxy applied successfully...
#echo press any key to close
taskkill /f /im iexplore.exe
# pause
exit