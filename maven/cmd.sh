#!/usr/bin/env bash

######### maven本地导入jar.在jar包当前位置执行

# ojdbc
mvn install:install-file -Dfile=ojdbc6-12.1.0.1-atlassian-hosted.jar  -DgroupId=com.oracle -DartifactId=ojdbc6   -Dversion=12.1.0.1-atlassian-hosted  -Dpackaging=jar

# therapi
mvn install:install-file -Dfile=therapi-runtime-javadoc-scribe-0.8.0.jar -DgroupId=com.github.therapi  -DartifactId=therapi-runtime-javadoc-scribe -Dversion=0.8.0 -Dpackaging=jar

# pomi
mvn install:install-file -Dfile=poi-ooxml-4.0.0.jar -DgroupId=org.apache.poi  -DartifactId=poi-ooxml -Dversion=4.0.0 -Dpackaging=jar


