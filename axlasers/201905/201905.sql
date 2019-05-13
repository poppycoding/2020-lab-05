select INSTANCE_NAME from v$instance;

-- 学生
create TABLE student (
id int PRIMARY KEY AUTO_INCREMENT,
name varchar(10) )

-- 成绩
create table student_course (
id int PRIMARY KEY AUTO_INCREMENT,
s_id int,
c_id int,
score int )

-- 课程
create table course (
id int PRIMARY KEY AUTO_INCREMENT,
name varchar(10) )

-- 利用子查询批量插入数据
insert into student_course (s_id,c_id,score)
select s.id s_id, c.id c_id, (select floor(20 + (RAND() * 100))) score
from student s
right join course c
on 1 = 1


-- 查询测试，语文考100分的学生
select s.* from student s where s.id in
(
select s_id from student_course sc where sc.c_id = 1 and sc.score = 100
)


-- 十位数随机字符串
select substring(MD5(RAND()),1,10)；
select MD5(RAND())；
select RAND()；


-- 删除已有的存储过程
drop procedure IF EXISTS batchInsert;


--  定义结束符为 $$
delimiter $$
--创建新的存储过程
create procedure insertdata()
    -> begin
--    变量声明
    -> declare i int default 0;
--    循环体
    -> while i < 10 do
--    插入数据
    -> INSERT INTO user (userLoginAccount,userPassword,userName,userAge) VALUE (i , '4321' ,  i , 5 ) ;
--    迭代条件
    -> set i = i + 1;
--    结束循环
    -> end while;
--    结束存储过程
    -> end $$


-- 调用储存过程
--重定义结束符
delimiter ;

--调用存储过程
call batchInsert();




--定义储存过程
drop procedure IF EXISTS batchInsert;

delimiter $$
create procedure batchInsert()
begin
declare i int default 0;
while i < 10001 do
INSERT INTO student (name) select substring(MD5(RAND()),1,10) ;
set i = i + 1;
end while;
end $$


--模糊查看储存过程
SHOW PROCEDURE STATUS LIKE 'bat%'

-- 调用储存过程
delimiter ;
call batchInsert();



--返回一个不大于f的最大整数
floor(f)

--返回一个随机浮点值 v ，范围在 0 到1 之间 (即, 其范围为 0 ≤ v ≤ 1.0)。若已指定一个整数参数 N ，则它被用作种子值，用来产生重复序列。
rand()；
rand(n)；



--若要在i ≤ R ≤ j 这个范围得到一个随机整数R ，需要用到表达式
--例如， 若要在7 到 12 的范围（包括7和12）内得到一个随机整数, 可使用以下语句：
FLOOR(i + RAND() * (j – i + 1))；

select floor(7 + (RAND() * 6));






delimiter $$
create procedure batchInsert()
begin
declare i int default 0;
while i < 100001 do
INSERT INTO student (name) select substring(MD5(RAND()),1,10);
set i = i + 1;
end while;
end $$

drop procedure IF EXISTS batchInsert;
SHOW PROCEDURE STATUS LIKE 'bat%'

delimiter ;
call batchInsert();


insert into student_course (s_id,c_id,score)
select s.id s_id, c.id c_id, (select floor(20 + (RAND() * 101))) score
from student s
right join course c
on 1 = 1


select s.* from student s where s.id in
(
select sc.s_id from student_course sc where sc.c_id = 1 and sc.score = 100
)



--索引之前
explain EXTENDED
select s.* from student s where s.id in
(
select sc.s_id from student_course sc where sc.c_id = 1 and sc.score = 100
);
+----+--------------+-------------+------------+--------+---------------+---------+---------+------------------+---------+----------+-------------+
| id | select_type  | table       | partitions | type   | possible_keys | key     | key_len | ref              | rows    | filtered | Extra       |
+----+--------------+-------------+------------+--------+---------------+---------+---------+------------------+---------+----------+-------------+
|  1 | SIMPLE       | <subquery2> | NULL       | ALL    | NULL          | NULL    | NULL    | NULL             | NULL    |   100.00 | Using where |
|  1 | SIMPLE       | s           | NULL       | eq_ref | PRIMARY       | PRIMARY | 4       | <subquery2>.s_id |       1 |   100.00 | NULL        |
|  2 | MATERIALIZED | sc          | NULL       | ALL    | NULL          | NULL    | NULL    | NULL             | 1097817 |     1.00 | Using where |
+----+--------------+-------------+------------+--------+---------------+---------+---------+------------------+---------+----------+-------------+

show warnings;
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Level   | Code | Message                                                                                                                                                                                                                                                    |
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warning | 1681 | 'EXTENDED' is deprecated and will be removed in a future release.                                                                                                                                                                                          |
| Note    | 1003 | /* select#1 */ select `demo`.`s`.`id` AS `id`,`demo`.`s`.`name` AS `name` from `demo`.`student` `s` semi join (`demo`.`student_course` `sc`) where ((`demo`.`s`.`id` = `<subquery2>`.`s_id`) and (`demo`.`sc`.`score` = 100) and (`demo`.`sc`.`c_id` = 1)) |
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


--索引之后
create index sc_c_id_index  on student_course(c_id);
create index sc_score_index on student_course(score);


explain EXTENDED
select s.* from student s where s.id in
(
select sc.s_id from student_course sc where sc.c_id = 1 and sc.score = 100
);
+----+--------------+-------------+------------+-------------+------------------------------+------------------------------+---------+------------------+------+----------+------------------------------------------------------------+
| id | select_type  | table       | partitions | type        | possible_keys                | key                          | key_len | ref              | rows | filtered | Extra                                                      |
+----+--------------+-------------+------------+-------------+------------------------------+------------------------------+---------+------------------+------+----------+------------------------------------------------------------+
|  1 | SIMPLE       | <subquery2> | NULL       | ALL         | NULL                         | NULL                         | NULL    | NULL             | NULL |   100.00 | Using where                                                |
|  1 | SIMPLE       | s           | NULL       | eq_ref      | PRIMARY                      | PRIMARY                      | 4       | <subquery2>.s_id |    1 |   100.00 | NULL                                                       |
|  2 | MATERIALIZED | sc          | NULL       | index_merge | sc_c_id_index,sc_score_index | sc_score_index,sc_c_id_index | 5,5     | NULL             | 1984 |   100.00 | Using intersect(sc_score_index,sc_c_id_index); Using where |
+----+--------------+-------------+------------+-------------+------------------------------+------------------------------+---------+------------------+------+----------+------------------------------------------------------------+


show warnings;
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Level   | Code | Message                                                                                                                                                                                                                                                    |
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warning | 1681 | 'EXTENDED' is deprecated and will be removed in a future release.                                                                                                                                                                                          |
| Note    | 1003 | /* select#1 */ select `demo`.`s`.`id` AS `id`,`demo`.`s`.`name` AS `name` from `demo`.`student` `s` semi join (`demo`.`student_course` `sc`) where ((`demo`.`s`.`id` = `<subquery2>`.`s_id`) and (`demo`.`sc`.`score` = 100) and (`demo`.`sc`.`c_id` = 1)) |
+---------+------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
