 select DISTINCT a.table_name, a.table_type, a.scale
        from result_table_classification a
        right join
        (
        SELECT root_table_name, child_table_name from
        (
        SELECT root_table_name,child_table_name
        from relation_table
        where job_id = 1 and config_name = '27库'
        and root_schema = 'WFBEMR' and child_schema = 'WFBEMR'
        and ratio >='10%'
        GROUP BY BINARY root_table_name, BINARY child_table_name
        ) q
        ) w
        on a.table_name = w.root_table_name or a.table_name = w.child_table_name
        where
            a.job_id = 1
            and a.config_name = '27库' and a.`schema` = 'WFBEMR'
            and a.table_name = 'BL_KESHIMBQX'

