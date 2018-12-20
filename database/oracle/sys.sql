
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
(select count(*) table_num from dba_tables where owner='CTMSPROD') t,
(select count(*) view_num from dba_views where owner = 'CTMSPROD') v,
(select count(column_name) column_num from dba_tab_columns where owner='CTMSPROD') c




--5.表空间
--创建:create tablespace 表间名 datafile '数据文件名' size 表空间大小 autoextend 自动扩展 unlimited 无限制
create tablespace data_test datafile '/oracle/app/oradata/orcl/data_test_tbs.dbf' size 100M autoextend on next 10M maxsize unlimited;
--查看
SELECT tablespace_name, file_id, file_name, round(bytes / (1024 * 1024), 0) total_space FROM dba_data_files ORDER BY tablespace_name;




--6.oracle相关操作
--[创建用户]:create user 用户名 identified by 口令[即密码]；
create user username identified by pwd;
--[创建默认表空间的用户] create user 用户名 identified by 密码 default tablespace 表空间表;
create user username identified by pwd default tablespace data_test;
--[删除用户]:drop user 用户名 cascade(如果有数据对象,必须加上cascade参数);
drop user test cascade;



--oracle为兼容以前版本，提供三种标准角色（role）:connect(临时)/resource(正式)/dba(管理员).
--授权：grant connect, resource to 用户名
grant connect, resource to test;
--撤销：revoke connect, resource from 用户名;
revoke connect, resource from test;



--用户还可以在oracle创建自己的role(需要拥有create role系统权限)
--创建
create role testRole;
--拥有testRole角色的所有用户都具有对class表的select查询权限
grant select on class to testRole;
--删除角色,相关的权限将从数据库全部删除
drop role testRole;