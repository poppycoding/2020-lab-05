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
