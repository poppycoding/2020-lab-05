#!/usr/bin/env bash
#https://blog.csdn.net/zlzlei/article/details/46472729
#https://blog.csdn.net/github_33644920/article/details/53228129




# heap根据pid查看java进程
jmap -heap pid



# histo根据pid查看对象占用,最后一行，总实例数量与总内存占用数.
#第一列-序号，无实际意义; 第二列-对象实例数量; 第三列-对象实例占用总内存数(字节); 第四列-对象实例名称
jmap -histo pid
#num     #instances         #bytes  class name
   1:       1523182      195956336  [C
   5:       1676720       40241280  java.lang.String
   6:        559613       17907616  java.util.HashMap$Node
  10:        359342        5749472  java.lang.Integer
  11:         21911        5609216  com.mchz.datamanager.entity.neo4j.ColumnInfo
  12:         27460        4832960  com.mchz.datamanager.entity.neo4j.TableInfo



# 根据pid查看(不限于java),最后一行，占用内存总大小，请注意，此处为虚拟内存大小，占用的物理内存大小可以通过top查看
#结果:第一列-内存块起始地址; 第二列-占用内存大小; 第三列-内存权限; 第四列-内存名称，anon表示动态分配的内存，stack表示栈内存
pmap pid
#91548:   java -jar data-manager.jar
#0000000000400000      4K    r-x--     java
#0000000000600000      4K    rw---     java
#000000000140b000   2328K    rw---     [ anon ]



# 查看对应进程gc情况,5000即5s更新一次:S0C S1C S0U S1U EC EU OC OU MC MU CCSC CCSU YGC YGCT FGC FGCT GCT
jstat -gc pid 5000
