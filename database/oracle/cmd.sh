#!/usr/bin/env bash
#用expdp导出dmp，有五种导出方式：
#第一种：“full=y”，全量导出数据库；
expdp user/passwd@orcl dumpfile=expdp.dmp directory=data_dir full=y logfile=expdp.log;

#第二种：schemas按用户导出；
expdp user/passwd@orcl schemas=user dumpfile=expdp.dmp directory=data_dir logfile=expdp.log;

#第三种：按表空间导出；
expdp sys/passwd@orcl tablespace=tbs1,tbs2 dumpfile=expdp.dmp directory=data_dir logfile=expdp.log;

#第四种：导出表；
expdp user/passwd@orcl tables=table1,table2 dumpfile=expdp.dmp directory=data_dir logfile=expdp.log;

#第五种：按查询条件导；
expdp user/passwd@orcl tables=table1='where number=1234' dumpfile=expdp.dmp directory=data_dir logfile=expdp.log;


#用impdp命令导入，对应五种方式：
#第一种：“full=y”，全量导入数据库；
impdp user/passwd directory=data_dir dumpfile=expdp.dmp full=y;

#第二种：同名用户导入，从用户A导入到用户A；
impdp A/passwd schemas=A directory=data_dir dumpfile=expdp.dmp logfile=impdp.log;

#第三种：
#①从A用户中把表table1和table2导入到B用户中；
impdp B/passwdtables=A.table1,A.table2 remap_schema=A:B directory=data_dir dumpfile=expdp.dmp logfile=impdp.log;

#②将表空间TBS01、TBS02、TBS03导入到表空间A_TBS，将用户B的数据导入到A，并生成新的oid防止冲突；
impdp A/passwdremap_tablespace=TBS01:A_TBS,TBS02:A_TBS,TBS03:A_TBS remap_schema=B:A FULL=Y transform=oid:n directory=data_dir dumpfile=expdp.dmp logfile=impdp.log

#第四种：导入表空间；
impdp sys/passwd tablespaces=tbs1 directory=data_dir dumpfile=expdp.dmp logfile=impdp.log;

#第五种：追加数据table_exists_action:导入对象已存在时执行的操作。有效关键字:SKIP,APPEND,REPLACE和TRUNCATE
impdp sys/passwd directory=data_dir dumpfile=expdp.dmp schemas=system table_exists_action=replace logfile=impdp.log;

