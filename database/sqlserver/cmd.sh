#!/usr/bin/env bash

# 查看版本
Select @@version


# 查看数据库编码: 936 简体中文GBK 950 繁体中文BIG5 437 美国/加拿大英语 932 日文 949 韩文 866 俄文 65001 unicode UFT-8
SELECT COLLATIONPROPERTY('Chinese_PRC_Stroke_CI_AI_KS_WS', 'CodePage');

