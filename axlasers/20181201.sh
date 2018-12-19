#!/usr/bin/env bash
1.oracle数据泵
imp dms/dms@orcl  file=/home/oracle/dms.dmp ignore=y full=y;

impdp dms/dms@192.168.202.2/orcl DIRECTORY=exp_dir DUMPFILE=dms.dmp REMAP_SCHEMA=SRCUSER:user

impdp dms/dms DIRECTORY=exp_dir DUMPFILE=dms.dmp SCHEMAS=SH;

impdp DMS/dms DIRECTORY=exp_dir DUMPFILE=dms.dmp REMAP_SCHEMA=xctg:DMS

impdp DMS/dms DIRECTORY=exp_dir DUMPFILE=dms.dmp

# 创建查看逻辑目录 select * from dba_directories;
create directory exp_dir as '/home/oracle';
grant read,write on directory exp_dir to public;

# xhct gwht CTMSPROD psprd hc_xhct xctg xhd_bis,xhd_code,xhd_tos xhd
create user xhct identified by xhct;
grant dba to xhct;
create user hc_xhct identified by hc_xhct;
grant dba to hc_xhct;
create user psprd identified by psprd;
grant dba to psprd;
create user gwht identified by gwht;
grant dba to gwht;
create user CTMSPROD identified by CTMSPROD;
grant dba to CTMSPROD;
create user xhd identified by xhd;
grant dba to xhd;
create user xctg identified by xctg;
grant dba to xctg;
create user xhd_bis identified by xhd_bis;
grant dba to xhd_bis;
create user xhd_code identified by xhd_code;
grant dba to xhd_code;
create user xhd_tos identified by xhd_tos;
grant dba to xhd_tos;

drop user xhct cascade;
drop user hc_xhct cascade;
drop user psprd cascade;
drop user gwht cascade;
drop user CTMSPROD cascade;
drop user xhd_bis cascade;
drop user xhd_code cascade;
drop user xhd_tos cascade;

create tablespace PDW_XCGT datafile '/oracle/app/oradata/orcl/pdw_xcgt_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;
create tablespace ODS_GWHT datafile '/oracle/app/oradata/orcl/ods_gwht_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;
create tablespace ODS_PSPRD datafile '/oracle/app/oradata/orcl/ods_psprd_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;
create tablespace ODS_HC_XHCT datafile '/oracle/app/oradata/orcl/ods_xhct_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;
create tablespace JZX datafile '/oracle/app/oradata/orcl/jzx_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;



# 导出:
expdp xctg/Oracle123@orcl  directory=dir content=metadata_only schemas=xhct dumpfile=xhct.dmp


# 导入:
#ORA-00959: tablespace 'PDW_XCGT' does not exist
impdp xhct/xhct directory=exp_dir dumpfile=xhct.dmp remap_schema=xhct:xhct logfile=xhct.log


impdp xhd_bis/xhd_bis directory=exp_dir dumpfile=xhd_bis.dmp remap_schema=xhd_bis:xhd_bis logfile=xhd_bis.log
impdp xhd_code/xhd_code directory=exp_dir dumpfile=xhd_code.dmp remap_schema=xhd_code:xhd_code logfile=xhd_code.log
impdp xhd_tos/xhd_tos directory=exp_dir dumpfile=xhd_tos.dmp remap_schema=xhd_tos:xhd_tos logfile=xhd_tos.log


#ORA-00959: tablespace 'ODS_GWHT' does not exist
impdp gwht/gwht directory=exp_dir dumpfile=gwht.dmp remap_schema=gwht:gwht logfile=gwht.log


#Job "CTMSPROD"."SYS_IMPORT_FULL_01" completed with 3 error(s) at Wed Dec 19 13:48:48 2018 elapsed 0 00:03:16
impdp CTMSPROD/CTMSPROD directory=exp_dir dumpfile=CTMSPROD.dmp remap_schema=CTMSPROD:CTMSPROD logfile=CTMSPROD.log


#ORA-00959: tablespace 'ODS_PSPRD' does not exist
impdp psprd/psprd directory=exp_dir dumpfile=psprd.dmp remap_schema=psprd:psprd logfile=psprd.log


#ORA-00959: tablespace 'ODS_HC_XHCT' does not exist
impdp hc_xhct/hc_xhct directory=exp_dir dumpfile=hc_xhct.dmp remap_schema=hc_xhct:hc_xhct logfile=hc_xhct.log


#ORA-00959: tablespace 'PDW_XCGT' does not exist
impdp xctg/xctg directory=exp_dir content=metadata_only dumpfile=xctg.dmp remap_schema=xctg:xctg logfile=xctg.log
