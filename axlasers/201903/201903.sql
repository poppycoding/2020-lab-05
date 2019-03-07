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
