

-- ------------------------------------------Mysql

-- if判断varchar字段的时候不可用null
IF(w.status is null,0,w.status)
select concat_ws('@','11','22',if(null is null ,"null",null),"33");




-- 使用locate(substr,str)函数，如果包含，返回>0的数，否则返回0
-- 例子：判断site表中的url是否包含'http://'子串,如果不包含则拼接在url字符串开头
update site set url =concat('http://',url) where locate('http://',url)=0




-- 集合相关
CREATE TABLE `object_a` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oname` varchar(50) DEFAULT NULL,
  `odesc` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `object_b` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oname` varchar(50) DEFAULT NULL,
  `odesc` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1

INSERT INTO `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (1, 'name1', 'desc1', '2019-03-14 15:05:11');
INSERT INTO `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (2, 'name2', 'desc2', '2019-03-14 15:05:12');
INSERT INTO `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (3, 'name3', 'desc3', '2019-03-14 15:05:13');
INSERT INTO `test`.`object_a`(`id`, `oname`, `odesc`, `create_time`) VALUES (4, 'name4', 'desc4', '2019-03-14 15:05:13');
INSERT INTO `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (1, 'name2', 'desc2', '2019-03-14 15:05:14');
INSERT INTO `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (2, 'name3', 'desc3', '2019-03-14 15:05:15');
INSERT INTO `test`.`object_b`(`id`, `oname`, `odesc`, `create_time`) VALUES (3, 'name4', 'desc4', '2019-03-14 15:05:16');


-- 并集: 不去重复
SELECT oname,odesc FROM object_a
UNION ALL
SELECT oname,odesc FROM object_b

-- 并集: 去重
SELECT oname,odesc FROM object_a
UNION
SELECT oname,odesc FROM object_b

-- 交集
SELECT a.oname,a.odesc FROM object_a a INNER JOIN object_b b ON a.oname=b.oname AND a.odesc=b.odesc
SELECT a.oname,a.odesc FROM object_a a INNER JOIN object_b b USING(oname,odesc)

-- 交集: 其他数据库
SELECT oname,odesc FROM object_a
INTERSECT
SELECT oname,odesc FROM object_b


-- 差集
SELECT a.oname, a.odesc
FROM
  object_a a
  LEFT JOIN object_b b
    ON a.oname = b.oname
    AND a.odesc = b.odesc
WHERE b.id IS NULL

-- 差集: 其他数据库
SELECT a.oname, a.odesc FROM object_a a
MINUS
SELECT b.oname, b.odesc FROM object_b b
