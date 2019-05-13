

-- ------------------------------------------Mysql

-- if判断varchar字段的时候不可用null
IF(w.status is null,0,w.status)
select concat_ws('@','11','22',if(null is null ,"null",null),"33");




-- 使用locate(substr,str)函数，如果包含，返回>0的数，否则返回0
-- 例子：判断site表中的url是否包含'http://'子串,如果不包含则拼接在url字符串开头
update site set url =concat('http://',url) where locate('http://',url)=0




-- 集合相关
create TABLE `object_a` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oname` varchar(50) DEFAULT NULL,
  `odesc` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

create TABLE `object_b` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oname` varchar(50) DEFAULT NULL,
  `odesc` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1

insert into `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (1, 'name1', 'desc1', '2019-03-14 15:05:11');
insert into `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (2, 'name2', 'desc2', '2019-03-14 15:05:12');
insert into `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (3, 'name3', 'desc3', '2019-03-14 15:05:13');
insert into `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (4, 'name4', 'desc4', '2019-03-14 15:05:13');
insert into `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (1, 'name2', 'desc2', '2019-03-14 15:05:14');
insert into `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (2, 'name3', 'desc3', '2019-03-14 15:05:15');
insert into `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (3, 'name4', 'desc4', '2019-03-14 15:05:16');


-- 并集: 不去重复
select oname,odesc from object_a
union all
select oname,odesc from object_b

-- 并集: 去重
select oname,odesc from object_a
union
select oname,odesc from object_b

-- 交集
select a.oname,a.odesc from object_a a inner join object_b b on a.oname=b.oname and a.odesc=b.odesc
select a.oname,a.odesc from object_a a inner join object_b b using(oname,odesc)

-- 交集: 其他数据库
select oname,odesc from object_a
intersect
select oname,odesc from object_b


-- 差集
select a.oname, a.odesc
from
  object_a a
  left join object_b b
    on a.oname = b.oname
    and a.odesc = b.odesc
where b.id is null

-- 差集: 其他数据库
select a.oname, a.odesc from object_a a
minus
select b.oname, b.odesc from object_b b




--------------储存过程，循环插入10w条数据

--模糊查看储存过程
SHOW PROCEDURE STATUS LIKE 'bat%'

--删除存在
drop procedure IF EXISTS batchInsert;

--定义储存过程
delimiter $$
create procedure batchInsert()
begin
declare i int default 0;
while i < 10001 do
INSERT INTO student (name) select substring(MD5(RAND()),1,10);
set i = i + 1;
end while;
end $$

-- 调用储存过程
delimiter ;
call batchInsert();



--10位随机字符串
select substring(MD5(RAND()),1,10)；

--返回一个不大于f的最大整数
floor(f)；

--返回一个随机浮点值 v ，范围在 0 到1 之间 (即, 其范围为 0 ≤ v ≤ 1.0)。
rand()；

--若已指定一个整数参数 N ，则它被用作种子值，用来产生重复序列。
rand(n)；



--若要在i ≤ R ≤ j 这个范围得到一个随机整数R ，需要用到表达式
--例如，若要在7 到 12 的范围（包括7和12）内得到一个随机整数, 可使用以下语句： FLOOR(i + RAND() * (j – i + 1))；
select floor(7 + (RAND() * 6));

