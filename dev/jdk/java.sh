#!/usr/bin/env bash
# 执行java类3种类型HelloWorld
# 单纯的java
javac HelloWorld
java HelloWorld

# 含有包名com.xx的java
javac -d . HelloWorld.java
java com.xx.HelloWorld

# com.xx.A引用其B包,拷贝到同一个路径下
javac -d . *.java
java com.xx.A
