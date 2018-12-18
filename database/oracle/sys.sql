
--1.查看table创建(最后更新)时间
select CREATED(LAST_DDL_TIME) from ALL_OBJECTS where OBJECT_TYPE='TABLE' and OBJECT_NAME= your_table_name;



--2.利用expdp ,impdp导入导出时的逻辑目录sql
create directory exp_dir as '/home/oracle';
-- 查看是否创建成功
select * from dba_directories;
-- 该目录授权给所有人(或者指定用户to some user)
grant read,write on directory exp_dir to public;



--3.查看数据库[表格-视图-列(table+view)]数量
--user_tables(当前登陆)
select count(*) from user_tables;
select count(*) from user_views;
select count(column_name) from user_tab_columns [where table_name = 'TEST'];
--dba_tables(dba权限)
select count(*) from dba_tables where owner='TEST';
select count(*) from dba_views where owner = 'TEST'
select count(column_name) from dba_tab_columns [where owner='TEST'];
--all_tables(dba权限)
select count(*) from all_tables where owner='TEST';
select count(*) from all_views where owner = 'TEST';
select count(column_name) from all_tab_columns [where owner='TEST'];



--4.查看schema下所有: 数据库+表格+视图+列数量
SELECT
t.table_num, v.view_num, c.column_num, (t.table_num + v.view_num + c.column_num + 1) count_all
FROM
(select count(*) table_num from dba_tables where owner='HC_XHCT') t,
(select count(*) view_num from dba_views where owner = 'HC_XHCT') v,
(select count(column_name) column_num from dba_tab_columns where owner='HC_XHCT') c
