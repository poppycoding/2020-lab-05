SELECT
root_schema ,root_table_name, child_table_name, min(ratio) ratio
from
relation_table
WHERE
job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY
BINARY root_table_name, BINARY child_table_name


select
DISTINCT a.table_name, a.table_type, a.scale
from
result_table_classification a
right join
(
SELECT root_table_name, child_table_name from
(
SELECT root_table_name,child_table_name from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'



select
a.id,
a.table_name,
count(DISTINCT a.table_name), a.table_type, a.scale,  w.root_table_name, w.root_column_name, w.child_table_name, w.child_column_name
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name


UPDATE relation_table set status = 0
UPDATE relation_table set status = 2 where ratio = 1



select
a.id,
a.table_name,
count(DISTINCT a.table_name), a.table_type, a.scale,  w.root_table_name, w.root_column_name, w.child_table_name, w.child_column_name,w.status
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,status from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, status from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name



select
-- count(DISTINCT a.table_name),
a.id, a.table_name, a.table_type, a.scale,
w.root_table_name, w.root_column_name, w.child_table_name, w.child_column_name,w.status
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,status from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, status from relation_table
where job_id = 1015 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 1015 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
-- GROUP BY a.table_name



INSERT INTO `sourcedata`.`result_table_classification`(`id`, `job_id`, `config_id`, `config_name`, `schema`, `table_id`, `table_name`, `table_type`, `subject_rate`, `reference_rate`, `trading_rate`, `statistical_rate`, `modified`, `scale`) VALUES (18497, 1015, 4, '27库', 'WFBEMR', 25159, 'BL_BINGCHENGJLXMXX', '主体', 68.7000, 26.4200, 2.6800, 2.2000, 00, 2);
INSERT INTO `sourcedata`.`result_table_classification`(`id`, `job_id`, `config_id`, `config_name`, `schema`, `table_id`, `table_name`, `table_type`, `subject_rate`, `reference_rate`, `trading_rate`, `statistical_rate`, `modified`, `scale`) VALUES (18275, 1015, 4, '27库', 'WFBEMR', 25159, 'BL_BINGCHENGJLXMXX', '主体', 68.7000, 26.4200, 2.6800, 2.2000, 00, 2);




select
GROUP_CONCAT( a.table_id SEPARATOR '>>') table_ids,
GROUP_CONCAT( a.table_name SEPARATOR '>>') table_names,
GROUP_CONCAT( a.table_type SEPARATOR '>>') table_types,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( w.status SEPARATOR '>>') statuss,
GROUP_CONCAT( a.table_id SEPARATOR '>>') column_names
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,status from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, status from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name ORDER BY table_id;



select
count(a.table_id) count,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name)),
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT(((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name)),
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( w.status SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,status,ratio from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, status,ratio from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name ORDER BY table_id;




select
count(a.table_id) count,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name) SEPARATOR '>>') root_table_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name) SEPARATOR '>>') child_table_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( w.status SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name ORDER BY table_id;


select
count(a.table_id) count,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = #{query.configName} and `schema` = #{query.schema} and table_name = w.root_table_name) SEPARATOR '>>') root_table_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = #{query.configName} and `schema` = #{query.schema} and table_name = w.child_table_name) SEPARATOR '>>') child_table_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( w.status SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio from relation_table
where job_id = 76 and config_name = #{query.configName} and root_schema = #{query.schema} and child_schema = #{query.schema} and ratio &gt;= #{query.ratio}
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = #{query.configName} and a.`schema` = #{query.schema}
GROUP BY a.table_name


select count(a.table_id) count, a.table_id, a.table_name, a.table_type, GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT( (SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name) SEPARATOR '>>') root_table_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names, GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name) SEPARATOR '>>') child_table_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names, GROUP_CONCAT( IF(w.status is null,0,w.status) w.status SEPARATOR '>>') statuses, GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from result_table_classification a
right join ( SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from ( SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio
from relation_table WHERE job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05 GROUP BY BINARY root_table_name, BINARY child_table_name ) q ) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name) WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR' GROUP BY a.table_name


select count(a.table_id) count, a.table_id, a.table_name, a.table_type, GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names, GROUP_CONCAT( (SELECT table_type FROM result_table_classification where job_id = ? and config_name = ? and `schema` = ? and table_name = w.root_table_name) SEPARATOR '>>') root_table_types, GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names, GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names, GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = ? and config_name = ? and `schema` = ? and table_name = w.child_table_name) SEPARATOR '>>') child_table_types, GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names, GROUP_CONCAT( w.status SEPARATOR '>>') statuses, GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios from result_table_classification a right join ( SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from ( SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio from relation_table WHERE job_id = ? and config_name = ? and root_schema = ? and child_schema = ? and ratio >= ? GROUP BY BINARY root_table_name, BINARY child_table_name ) q ) w on (a.table_name = w.root_table_name or a.table_name = w.child_table_name) WHERE a.job_id = ? and a.config_name = ? and a.`schema` = ? GROUP BY a.table_name




UPDATE relation_table set status = null WHERE job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR'  and child_table_name = 'TE_MOBANLX' and root_table_name = 'BL_BINGLIBCJL'
SELECT  * FROM  relation_table WHERE  job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and child_table_name = 'TE_MOBANLX'


IF(w.status is null,0,w.status)

-- if判断varchar时不可用null
select concat_ws('@','11','22',if(null is null ,"null",null),"33");



select
count(a.table_id) count,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT concat_ws("@",table_id,table_type) FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name) SEPARATOR '>>') root_table_id_and_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT  concat_ws("@",table_id,table_type) FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name) SEPARATOR '>>') child_table_id_and_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( IF(w.status is null,0,w.status) SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from result_table_classification a
right join
(SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from
(
 SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio from relation_table
 WHERE job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05 GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name) WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR' GROUP BY a.table_name

-- UPDATE relation_table set status = 2 WHERE job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR'  and child_table_name = 'TE_MOBANLX' and root_table_name = 'BL_BINGLIBCJL'


-- SELECT  * FROM  relation_table  WHERE  job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_table_name = 'TE_MOBANLX' and root_table_name = 'BL_BINGLIBCJL'

--  select concat_ws('@','11','22',if(null is null ,"null",null),"33");



-- SELECT
-- *,
-- IF(table_type is null,0,table_type)
-- -- concat_ws("@", IF(table_type is null,"未分类",table_type),table_id)
-- FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = 'BL_BINGLIBCJL'
--


select count(0) from (
select
a.table_id, a.table_name, a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT( (select concat_ws("@",table_id,table_type) from result_table_classification where job_id = ? and config_name = ? and `schema` = ? and table_name = w.root_table_name) SEPARATOR '>>') root_table_id_and_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT concat_ws("@",table_id,table_type) FROM result_table_classification where job_id = ? and config_name = ? and `schema` = ? and table_name = w.child_table_name) SEPARATOR '>>') child_table_id_and_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( if(w.status is null,0,w.status)SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios
from result_table_classification a
right join ( SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio
             from ( SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio
                    from relation_table
                    WHERE job_id = ? and config_name = ? and root_schema = ? and child_schema = ? and ratio >= ? GROUP BY BINARY root_table_name, BINARY child_table_name
                  ) q
           ) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = ? and a.config_name = ? and a.`schema` = ? and a.table_type = ? GROUP BY a.table_name) tmp_count


-- 使用locate(substr,str)函数，如果包含，返回>0的数，否则返回0
-- 例子：判断site表中的url是否包含'http://'子串,如果不包含则拼接在url字符串开头
update site set url =concat('http://',url) where locate('http://',url)=0


    <where>
        <if test="query.status == 0 ">
            locate("0",statuses) != 0
        </if>
        <if test="query.status == 1 ">
            locate("0",statuses) = 0
        </if>
    </where>


select
count(a.table_id) count,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name) SEPARATOR '>>') root_table_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT table_type FROM result_table_classification where job_id = 76 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name) SEPARATOR '>>') child_table_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( w.status SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios,
GROUP_CONCAT( w.id SEPARATOR '>>') relationIds
from
result_table_classification a
right join
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name,`status`,ratio from
(
SELECT root_table_name, root_column_name, child_table_name, child_column_name, `status`,ratio from relation_table
where job_id = 76 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY BINARY root_table_name, BINARY child_table_name
) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 76 and a.config_name = '27库' and a.`schema` = 'WFBEMR'
GROUP BY a.table_name ORDER BY table_id;



SELECT root_schema ,root_table_name, child_table_name, relation_type,  ratio , `status`,child_column_name,root_column_name,id
SELECT *
FROM relation_table
WHERE
job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05   ORDER BY root_table_name;

SELECT root_schema ,root_table_name, child_table_name, relation_type,  ratio , `status`,group_concat(`status`)
FROM relation_table
WHERE
job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
GROUP BY root_table_name,child_table_name
-- ORDER BY root_table_name



SELECT a.root_table_name, a.child_table_name
FROM
(
SELECT root_table_name, child_table_name
FROM relation_table
WHERE
job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05
) a
LEFT JOIN
(
SELECT root_table_name, child_table_name
FROM relation_table
WHERE
job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR' and child_schema = 'WFBEMR' and ratio >= 0.05 and `status` =  0
) b
ON  a.root_table_name= b.root_table_name and a.child_table_name = b.child_table_name
WHERE b.root_table_name is null



SELECT * FROM ( select a.id result_id, a.table_id, a.table_name, a.table_type, GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
 GROUP_CONCAT( (SELECT concat_ws("@",id,table_type) FROM result_table_classification where job_id = 80 and config_name = '27库' and `schema` = 'WFBEMR'  and
 table_name = w.root_table_name) SEPARATOR '>>') root_result_id_and_types, GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
 GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names, GROUP_CONCAT((SELECT concat_ws("@",id,table_type)
 FROM result_table_classification where job_id = 80 and config_name = '27库' and `schema` = 'WFBEMR'  and table_name = w.child_table_name) SEPARATOR '>>')
 child_result_id_and_types, GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
 GROUP_CONCAT( if(w.status is null,0,w.status)SEPARATOR '>>') statuses, GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios,
 GROUP_CONCAT( w.id SEPARATOR '>>') relationIds from result_table_classification a
 right join ( SELECT id,root_table_name,root_column_name,child_table_name,child_column_name,`status`,ratio
 from ( SELECT id,root_table_name,root_column_name,child_table_name,child_column_name,`status`,ratio from relation_table
 WHERE job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR'  and child_schema = 'WFBEMR'  and ratio >= 0.05
 GROUP BY BINARY root_table_name, BINARY child_table_name ) q ) w
 on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
 WHERE a.job_id = 80 and a.config_name = '27库' and a.`schema` = 'WFBEMR'  GROUP BY a.table_name ) x LIMIT ?



--球形缩小ball

-- tableName tableType
select DISTINCT a.table_name, a.table_type
from result_table_classification  a
right join
(
   SELECT root_table_name, child_table_name
	 from
   (
	 SELECT root_table_name,child_table_name
   from relation_table
   where job_id = 269 and config_name = 'HIS库' and root_schema = 'WFBEMR' and  child_schema =  'WFBEMR'  and ratio > 0.1
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q
)  w  on  a.table_name = w.root_table_name  or a.table_name = w.child_table_name

where a.job_id = 269 and a.config_name = 'hhh' and a.`schema` = 'WFBEMR'


-- links source target ratio
SELECT root_table_name, child_table_name,  min(ratio) ratio
from relation_table
where job_id = 269 and config_name = 'hhh' and root_schema = 'BA_ZXYY' and  child_schema =  'BA_ZXYY'  and ratio > 0.1
GROUP BY BINARY root_table_name, BINARY child_table_name






--方形放大square
-- nodes  Pk FK
SELECT  a.table_name,
GROUP_CONCAT(a.column_name SEPARATOR '>>') column_names ,
GROUP_CONCAT(IF(a.is_pk = 1,'PK','') SEPARATOR '>>') is_pks,
GROUP_CONCAT(IF(a.is_fk = 0,'','FK') SEPARATOR '>>') is_fks
FROM result_meta_column_display a
right join
(
   SELECT  root_table_name, child_table_name
	 from
   (
	 SELECT  root_table_name,child_table_name
   from relation_table
   where job_id = 269 and config_name = 'HIS库' and root_schema = 'WFBEMR' and  child_schema =  'WFBEMR'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q
)  w  on  a.table_name = w.root_table_name  or a.table_name = w.child_table_name

where a.job_id = 269 and  a.config_name =  'HIS库' and  a.`schema` =  'WFBEMR'
GROUP BY BINARY a.table_name


-- links from to port
SELECT
CONCAT_WS('>>',job_id, config_id, root_schema,root_table_name ) `from` , root_column_name  fromPort,
CONCAT_WS('>>',job_id, config_id, child_schema,child_table_name) `to` , child_column_name   toPort
FROM relation_table
WHERE job_id = 8 and config_name =  'hhh' and root_schema = 'BA_ZXYY' and  child_schema =  'BA_ZXYY'    and ratio > 0.999




--局部放大square

-- 二级关联
SELECT job_id, config_name, config_id, root_schema , child_schema, root_table_name , child_table_name
FROM relation_table
where
job_id = 27 and  config_name =  'his库' and  root_schema =  'WFBEMR'  and  child_schema =  'WFBEMR'
and  (BINARY root_table_name in ( 'EMR_GONGNENGDKJPZ') or  BINARY child_table_name  in( 'EMR_GONGNENGDKJPZ') )

-- nodes key tableName color 1111
SELECT  a.table_name, b.table_type,
GROUP_CONCAT(a.column_name ORDER BY a.position  SEPARATOR '>>') column_names ,
GROUP_CONCAT(IF(a.is_pk = 1,'PK','') ORDER BY a.position  SEPARATOR '>>') is_pks,
GROUP_CONCAT(IF(a.is_fk = 0,'','FK') ORDER BY a.position  SEPARATOR '>>') is_fks
FROM result_meta_column_display a
-- 交集取出表格
inner join
(
   SELECT  root_table_name table_name
   FROM (
	 SELECT  root_table_name,child_table_name
   from relation_table
   where job_id = 35 and config_name = 'hhh' and root_schema = 'WFBZJHIS' and  child_schema =  'WFBZJHIS'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q
	 -- 并集去重取出所有关联表格
	 UNION
	 SELECT  child_table_name
   FROM (
	 SELECT  root_table_name,child_table_name
   from relation_table
   where job_id = 35 and config_name = 'hhh' and root_schema = 'WFBZJHIS' and  child_schema =  'WFBZJHIS'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q2

)  w  on  a.table_name = w.table_name
-- 关联查询取出业务类型
LEFT JOIN  result_table_classification b on a.job_id = b.job_id and  a.config_name =  b.config_name and  a.`schema` =  b.`schema` and a.table_name = b.table_name
where a.job_id = 35 and  a.config_name =  'hhh' and  a.`schema` =  'WFBZJHIS'
and a.table_name in ('YZ_PATTERN_ORDER','GYS_CFZD','WZ_DA_LSSJ')
GROUP BY BINARY a.table_name

-- nodes key tableName color 22222 优化效果待定
SELECT  a.table_name, b.table_type,
GROUP_CONCAT(a.column_name ORDER BY a.position  SEPARATOR '>>') column_names ,
GROUP_CONCAT(IF(a.is_pk = 1,'PK','') ORDER BY a.position  SEPARATOR '>>') is_pks,
GROUP_CONCAT(IF(a.is_fk = 0,'','FK') ORDER BY a.position  SEPARATOR '>>') is_fks
FROM result_meta_column_display a, result_table_classification b ,
(
   SELECT  root_table_name table_name
   FROM (
	 SELECT  root_table_name,child_table_name
   from relation_table
   where job_id = 35 and config_name = 'hhh' and root_schema = 'WFBZJHIS' and  child_schema =  'WFBZJHIS'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q
	 -- 并集去重取出所有关联表格
	 UNION
	 SELECT  child_table_name
   FROM (
	 SELECT  root_table_name,child_table_name
   from relation_table
   where job_id = 35 and config_name = 'hhh' and root_schema = 'WFBZJHIS' and  child_schema =  'WFBZJHIS'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
	 ) q2
)  w
where
a.table_name = w.table_name and
a.job_id = b.job_id and  a.config_name =  b.config_name and  a.`schema` =  b.`schema` and a.table_name = b.table_name and
a.job_id = 35 and  a.config_name =  'hhh' and  a.`schema` =  'WFBZJHIS'
and a.table_name in ('YZ_PATTERN_ORDER','GYS_CFZD','WZ_DA_LSSJ')
GROUP BY BINARY a.table_name



-- 两列变一列,去重(暂时不明确,用上述的两次关联查询union即可实现并集效果)
select distinct substring_index(substring_index(a.w,',',b.help_topic_id+1),',',-1)
from
(
   SELECT concat( root_table_name,',',child_table_name) w
   from relation_table
   where job_id = 27 and config_name = 'his库' and root_schema = 'WFBEMR' and  child_schema =  'WFBEMR'  and ratio > 0
   GROUP BY BINARY root_table_name, BINARY child_table_name
) a

join  mysql.help_topic b  on b.help_topic_id < (length(a.w) - length(replace(a.w,',',''))+1)


-- links from to
SELECT
CONCAT_WS('>>',job_id, config_id, root_schema,root_table_name ) `from` , root_column_name fromPort,
CONCAT_WS('>>',job_id, config_id, child_schema,child_table_name) `to` , child_column_name toPort
FROM relation_table
WHERE job_id = 8 and config_name =  'hhh' and root_schema = 'BA_ZXYY' and  child_schema =  'BA_ZXYY'
and ( BINARY root_table_name in ('BA_BRJBXX','BA_ICDDM') or  BINARY child_table_name  in ('BA_BRJBXX','BA_ICDDM'))




select
a.id result_id,
a.table_id,
a.table_name,
a.table_type,
GROUP_CONCAT( w.root_table_name SEPARATOR '>>') root_table_names,
GROUP_CONCAT((SELECT concat_ws("@",id,table_type) FROM result_table_classification where job_id = 80 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.root_table_name) SEPARATOR '>>' )  root_result_id_and_types,
GROUP_CONCAT( w.root_column_name SEPARATOR '>>') root_column_names,
GROUP_CONCAT( w.child_table_name SEPARATOR '>>') child_table_names,
GROUP_CONCAT((SELECT concat_ws("@",id,table_type) FROM result_table_classification where job_id = 80 and config_name = '27库' and `schema` = 'WFBEMR' and table_name = w.child_table_name) SEPARATOR '>>')
child_result_id_and_types,
GROUP_CONCAT( w.child_column_name SEPARATOR '>>') child_column_names,
GROUP_CONCAT( if(w.status is null,0,w.status)SEPARATOR '>>') statuses,
GROUP_CONCAT( w.ratio SEPARATOR '>>') ratios,
GROUP_CONCAT( w.id SEPARATOR '>>') relationIds
from result_table_classification a
right join
(SELECT id,root_table_name,root_column_name,child_table_name,child_column_name,`status`,ratio from
 (SELECT id,root_table_name,root_column_name,child_table_name,child_column_name,`status`,ratio from relation_table
  WHERE job_id = 80 and config_name = '27库' and root_schema = 'WFBEMR'  and child_schema = 'WFBEMR' and ratio >= 0.05
	GROUP BY BINARY root_table_name, root_column_name, BINARY child_table_name, child_column_name
-- 	GROUP BY BINARY root_table_name, BINARY child_table_name
 ) q
) w
on (a.table_name = w.root_table_name or a.table_name = w.child_table_name)
WHERE a.job_id = 80 and a.config_name = '27库' and a.`schema` = 'WFBEMR'  GROUP BY a.table_name
