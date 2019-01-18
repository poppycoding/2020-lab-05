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





CREATE view KST_HIS_DA
(DAID,JZKH,SFBZKH,JDDAID,ZYH,TJH,DWTJH,XM,CSSJ,ZJHM,LY,FYLB,LXDZ,LXDH,LXR,LXRGX,LXRDH,LXRDZ,JDSJ,XB,CQID,ZJLX,GZDW)
as
select patid,cardno,sbh,NULL,NULL,NULL,NULL,hzxm,birth,sfzh,0,
(case when ybdm = '101' then 0 else 1 end),
lxdz,lxdh,NULL,NULL,NULL,NULL,lrrq,
(case when sex = '男' then 1 when sex = '女' then 2 else 3 end),
NULL,NULL,NULL
from SF_BRXXK where tybz=0
union all
select a.patid,a.cardno,NULL,NULL,a.blh,NULL,NULL,a.hzxm,a.birth,a.sfzh,1,
(case when a.ybdm = '201' then 0 else 1 end),
a.lxdz,(case when a.lxdh = '' then b.lxrdh else a.lxdh end),
b.lxr,NULL,b.lxrdh,NULL,a.djrq,
(case when a.sex = '男' then 1 when a.sex = '女' then 2 else 3 end),
NULL,NULL,NULL
from ZY_BRXXK a, ZY_BRSYK b
where a.patid = b.patid
and b. brzt <> 9



INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (1, '超级管理员', 1, '', 'admin', 1544440514649, 'wuhongming', 1546404589951);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (28, '管理员1', 1, NULL, 'wuhongming', 1544440572383, 'wuhongming', 1544440572383);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (29, '管理员2', 1, NULL, 'wuhongming', 1544440583466, 'wuhongming', 1544440583466);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (31, '管理员4', 1, NULL, 'wuhongming', 1544440600633, 'fang', 1544513420770);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (32, 'dsv', 1, 'sfg', 'wuhongming', 1544441970906, 'wuhongming', 1546404701282);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (38, 'rt', 1, 'rt', 'wuhongming', 1545187216997, 'wuhongming', 1545187216997);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (50, '234', 1, '', 'wuhongming', 1545211234982, 'wuhongming', 1545211318428);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (56, 'errrr', 1, 'eeee', 'admin', 1545310279232, 'admin', 1545310279232);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (58, 'eeee', 1, '', 'admin', 1545310496489, 'admin', 1545987230355);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (59, '@3', 1, '测试人员eeee', 'admin', 1545984104192, 'admin', 1545985063343);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (65, '测试dada', 1, '', 'fang', 1546062101969, '测试', 1546946185657);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (66, '235', 1, '2452', 'wuhongming', 1546998891072, 'wuhongming', 1546998891072);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (67, '2354', 1, '2452', 'wuhongming', 1546998898965, 'wuhongming', 1546998898965);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (68, '235434', 1, '2452', 'wuhongming', 1546998902405, 'wuhongming', 1546998902405);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (69, '23543456', 1, '2452', 'wuhongming', 1546998905902, 'wuhongming', 1546998905902);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (70, '23543456546', 1, '2452', 'wuhongming', 1546998908868, 'wuhongming', 1546998908868);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (73, '23543456546332', 1, '2452', 'wuhongming', 1546998918319, 'wuhongming', 1546998918319);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (74, '2354345654633254', 1, '2452', 'wuhongming', 1546998921794, 'wuhongming', 1546998921794);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (78, '235493', 1, '2452', 'wuhongming', 1546998937454, 'wuhongming', 1546998937454);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (79, '2354934', 1, '2452', 'wuhongming', 1546998940174, 'wuhongming', 1546998940174);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (80, '23549345', 1, '2452', 'wuhongming', 1546998943207, 'wuhongming', 1546998943207);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (81, 'vsdvs', 1, 'sdvs', 'wuhongming', 1547013830432, 'wuhongming', 1547013830432);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (82, 't1', 1, '数据管理', 'wuhongming', 1547013860431, 'wuhongming', 1547013860431);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (83, '12345678901234567890', 1, '2452', 'wuhongming', 1547014134694, 'wuhongming', 1547014134694);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (84, 'wd', 1, '数据分析', 'wuhongming', 1547014192172, 'wuhongming', 1547014192173);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (85, 'we', 0, 'sfg', 'wuhongming', 1547014462372, 'wuhongming', 1547014462372);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (90, '45456', 1, '45456', 'wuhongming', 1547016006285, 'wuhongming', 1547016006285);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (92, '4545678', 1, '4545678', 'wuhongming', 1547016015665, 'wuhongming', 1547016015665);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (93, '490', 1, '490', 'wuhongming', 1547016023313, 'wuhongming', 1547016023313);
INSERT INTO `sys_role`(`id`, `role_name`, `status`, `remark`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES (94, '4901', 1, '4901', 'wuhongming', 1547016027748, 'wuhongming', 1547016027748);




INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (1, 'CISDB', 1, 5, 0, 'wuhongming', 1545980293873, 'wuhongming', 1547014823510, '', 1, NULL, 1547014823510, 1547045832236, 1, 'CISDB', 3, 23810, 0, '/data/export/data-manager/db/1/1083014832917188608.xlsx', 1, 1180, 51, 22578, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (2, 'THIS4', 2, 10, 0, 'wuhongming', 1545980316785, 'wuhongming', 1547015320533, '', 1, NULL, 1547015320533, 1547083564825, 1, 'THIS4', 1, 54439, 0, '/data/export/data-manager/db/2/1083173094845190144.xlsx', 1, 2825, 285, 51328, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (3, 'whmtest', 3, 10, 0, 'wuhongming', 1545980421592, 'wuhongming', 1547185981056, '', 1, '54196', 1547190056867, 1547190149803, 2, 'whmtest', 10, 153, 0, '/data/export/data-manager/db/3/1083620144833499136.xlsx', 1, 11, 8, 133, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (4, 'XCTG', 4, 10, 0, 'wuhongming', 1545980807386, 'wuhongming', 1547002420970, '', 1, NULL, 1547002420970, 1547005203557, 0, 'neworcl', 1, 10513, 0, '/data/export/data-manager/db/4/1082844423844401152.xlsx', 1, 299, 0, 10213, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (5, 'hc_xhct', 5, 5, 0, 'wuhongming', 1545980859912, 'wuhongming', 1547003683291, '', 1, NULL, 1547003683291, 1547083578706, 0, 'neworcl', 1, 14060, 0, '/data/export/data-manager/db/5/1083173304371646464.xlsx', 1, 506, 110, 13443, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (6, 'GWHT', 6, 10, 0, 'wuhongming', 1545980902839, 'wuhongming', 1547004194579, '', 1, NULL, 1547004194580, 1547013279763, 0, 'neworcl', 1, 13851, 0, '/data/export/data-manager/db/6/1082878297953669120.xlsx', 1, 473, 97, 13280, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (11, 'XHCT', 7, 10, 0, 'wuhongming', 1546048198042, 'wuhongming', 1547010855272, '', 1, NULL, 1547010855272, 1547024223237, 0, 'neworcl', 1, 11619, 0, '/data/export/data-manager/db/11/1082924198172692480.xlsx', 1, 519, 0, 11099, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (12, 'PSPRD', 8, 10, 0, 'wuhongming', 1546048245752, 'wuhongming', 1547093442850, '', 0, NULL, 1547093442850, NULL, 0, 'neworcl', 1, 12038, 0, '/data/export/data-manager/db/12/1082946785388924928.xlsx', 1, 640, 0, 11397, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (13, 'kettle2', 5, 10, 1, 'wuhongming', 1546048558104, 'wuhongming', 1546048558104, NULL, 2, NULL, 1547105059467, NULL, 0, 'orcl', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (14, 'dw_hos', 9, 5, 0, 'admin', 1546051103928, 'wuhongming', 1547012411981, '', 1, NULL, 1547012411981, 1547031754247, 0, 'orcl', 1, 4669, 0, '/data/export/data-manager/db/14/1082955785492893696.xlsx', 1, 311, 10, 4347, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (15, 'batj', 10, 5, 0, 'admin', 1546051135826, 'wuhongming', 1547013879255, '', 1, NULL, 1547013879255, 1547032800794, 0, 'orcl', 1, 2451, 0, '/data/export/data-manager/db/15/1082960175096270848.xlsx', 1, 167, 12, 2271, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (16, 'ypxt', 11, 5, 0, 'admin', 1546051162707, 'wuhongming', 1546997814663, '', 1, NULL, 1546997814663, 1546998164807, 0, 'orcl', 1, 2684, 0, '/data/export/data-manager/db/16/1082814901367476224.xlsx', 1, 187, 1, 2495, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (17, 'bqxt', 12, 5, 0, 'admin', 1546051214302, 'wuhongming', 1546998039278, '', 1, NULL, 1546998039278, 1546998770145, 0, 'orcl', 1, 5979, 0, '/data/export/data-manager/db/17/1082817440309710848.xlsx', 1, 415, 10, 5553, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (18, 'xtgl', 13, 5, 0, 'admin', 1546051236224, 'wuhongming', 1546998226029, '', 1, NULL, 1546998226029, 1546998927123, 0, 'orcl', 1, 1789, 0, '/data/export/data-manager/db/18/1082818098559586304.xlsx', 1, 167, 4, 1617, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (19, 'mzxt', 14, 5, 0, 'admin', 1546051261743, 'wuhongming', 1546999050128, '', 1, NULL, 1546999050128, 1546999571073, 0, 'orcl', 1, 2967, 0, '/data/export/data-manager/db/19/1082820799519395840.xlsx', 1, 193, 13, 2760, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (20, 'kettle(kpi)1', 6, 5, 1, 'wuhongming', 1546060320156, 'wuhongming', 1547103106830, '', 1, NULL, 1547103106830, 1547103110040, 0, 'orcl', 1, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (21, 'kettle(dm)', 7, 5, 1, 'wuhongming', 1546060369570, 'wuhongming', 1547104930202, '', 1, NULL, 1547104930202, 1547104933669, 0, 'orcl', 1, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (22, 'CTMSPROD', 15, 5, 0, 'wuhongming', 1546077805414, 'wuhongming', 1547000151935, '', 1, NULL, 1547000151935, 1547002269666, 0, 'neworcl', 1, 10900, 0, '/data/export/data-manager/db/22/1082832118238810112.xlsx', 1, 441, 0, 10458, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (23, 'HCBSYQ', 16, 5, 0, 'wuhongming', 1546078025756, 'wuhongming', 1546999516896, '', 1, '98472', 1546999516896, 1546999891628, 0, 'neworcl', 1, 1, 0, '/data/export/data-manager/db/23/1082822143965794304.xlsx', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (24, 'kettle(monitor)', 8, 5, 1, 'wuhongming', 1546393918449, 'wuhongming', 1546393918449, NULL, 1, NULL, 1547105162485, NULL, 0, 'orcl', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (25, 'kettle(OGG)', 9, 5, 1, 'wuhongming', 1546394343602, 'wuhongming', 1547089273438, '', 1, NULL, 1547089273438, 1547089277131, 0, 'orcl', 1, 16, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (26, 'kettle(to_pdw)', 10, 5, 1, 'wuhongming', 1546395919902, 'dtf', 1547102254483, '', 1, NULL, 1547102254483, 1547102258404, 0, 'orcl', 1, 16, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (27, 'kettle(xiam_buquan)', 11, 5, 1, 'wuhongming', 1546396517853, 'fang', 1547174864886, '', 0, NULL, 1547174864886, NULL, 0, 'orcl', 1, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (28, 'kettle(inc)', 12, 5, 1, 'wuhongming', 1546396715453, 'wuhongming', 1546396715453, NULL, 1, NULL, 1547174876295, NULL, 0, 'orcl', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (29, 'whm12', 17, 5, 0, 'wuhongming', 1546403366527, 'wuhongming', 1547001218201, '', 1, NULL, 1547001218201, 1547002279678, 1, 'whm12', 4, 164, 0, '/data/export/data-manager/db/29/1082832173326798848.xlsx', 1, 14, 13, 136, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (46, 'whmtest333', 0, NULL, 2, 'dtf', 1546588201734, 'dtf', 1546588201734, NULL, 2, NULL, 1546588201734, 1546588255283, NULL, NULL, 1, 160, 0, NULL, 1, 14, 13, 132, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (48, 'Import_Model', 0, NULL, 2, 'dtf', 1546829019454, 'dtf', 1546829019454, NULL, 1, NULL, 1546829019454, 1546829022244, NULL, NULL, 3, 5, 0, NULL, 1, 1, 1, 2, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (49, 'Import_Model2', 0, NULL, 2, 'dtf', 1546828884754, 'dtf', 1546828884754, NULL, 1, NULL, 1546828884754, 1546828887613, NULL, NULL, 2, 5, 0, NULL, 1, 1, 1, 2, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (50, 'whm111', 18, 5, 0, 'wuhongming', 1546916614797, 'dtf', 1546997216202, '', 1, NULL, 1546997216202, 1546997244175, 1, 'whm111', 1, 7, 0, '/data/export/data-manager/db/50/1082811040007327744.xlsx', 1, 1, 0, 5, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (51, 'Test', 19, 5, 0, 'wuhongming', 1546917347323, 'dtf', 1546997217417, '', 1, NULL, 1546997217417, 1546997251443, 1, 'Test', 1, 17, 0, '/data/export/data-manager/db/51/1082811070453780480.xlsx', 1, 2, 0, 14, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (52, 'kettle(bq)', 13, 5, 1, 'wuhongming', 1547105523649, 'wuhongming', 1547105534973, '', 1, NULL, 1547105534973, 1547105540121, 0, 'orcl', 1, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `collect_job`(`id`, `job_name`, `source_id`, `sample_line`, `collect_type`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`, `status`, `thread_id`, `start_time`, `end_time`, `db_type`, `db_name`, `version`, `count_all`, `count_err`, `file_path`, `db_all`, `table_all`, `view_all`, `column_all`, `db_err`, `table_err`, `view_err`, `column_err`) VALUES (53, 'kettle(ft)', 14, 5, 1, 'wuhongming', 1547105874454, 'wuhongming', 1547105886115, '', 1, NULL, 1547105886120, 1547105892681, 0, 'orcl', 1, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (1, 'CISDB', 1, '192.168.200.117', '1433', 'sa', 'hzmc321#', 'CISDB', NULL, 'table,view', 'wuhongming', 1545980293766, 'wuhongming', 1545980293766, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (2, 'THIS4', 1, '192.168.200.117', '1433', 'sa', 'hzmc321#', 'THIS4', NULL, 'table,view', 'wuhongming', 1545980316766, 'wuhongming', 1545980316766, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (3, 'whmtest', 2, '192.168.240.201', '3306', 'root', 'Hzmc321#', 'whmtest', NULL, 'table,view', 'wuhongming', 1545980421545, 'wuhongming', 1545980421545, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (4, 'XCTG', 0, '192.168.202.11', '1521', 'XCTG', 'XCTG', 'neworcl', NULL, 'table,view', 'wuhongming', 1545980807375, 'wuhongming', 1545980807375, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (5, 'hc_xhct', 0, '192.168.202.11', '1521', 'HC_XHCT', 'oracle', 'neworcl', NULL, 'table,view', 'wuhongming', 1545980859890, 'wuhongming', 1545980859891, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (6, 'GWHT', 0, '192.168.202.11', '1521', 'GWHT', 'oracle', 'neworcl', NULL, 'table,view', 'wuhongming', 1545980902775, 'wuhongming', 1545980902775, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (7, 'XHCT', 0, '192.168.202.11', '1521', 'XHCT', 'oracle', 'neworcl', NULL, 'table,view', 'wuhongming', 1546048197938, 'wuhongming', 1546048197938, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (8, 'PSPRD', 0, '192.168.202.11', '1521', 'PSPRD', 'oracle', 'neworcl', NULL, 'table,view', 'wuhongming', 1546048245745, 'wuhongming', 1546048245745, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (9, 'dw_hos', 0, '192.168.226.27', '1521', 'DW_HOS', 'dw_hos', 'orcl', NULL, 'table,view', 'admin', 1546051103768, 'admin', 1546051103768, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (10, 'batj', 0, '192.168.226.27', '1521', 'BATJ', 'oracle', 'orcl', NULL, 'table,view', 'admin', 1546051135790, 'admin', 1546051135790, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (11, 'ypxt', 0, '192.168.226.27', '1521', 'YPXT', 'oracle', 'orcl', NULL, 'table,view', 'admin', 1546051162686, 'admin', 1546051162686, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (12, 'bqxt', 0, '192.168.226.27', '1521', 'BQXT', 'oracle', 'orcl', NULL, 'table,view', 'admin', 1546051214239, 'admin', 1546051214239, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (13, 'xtgl', 0, '192.168.226.27', '1521', 'XTGL', 'oracle', 'orcl', NULL, 'table,view', 'admin', 1546051236174, 'admin', 1546051236174, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (14, 'mzxt', 0, '192.168.226.27', '1521', 'MZXT', 'oracle', 'orcl', NULL, 'table,view', 'admin', 1546051261679, 'admin', 1546051261679, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (15, 'CTMSPROD', 0, '192.168.202.11', '1521', 'CTMSPROD', 'oracle', 'neworcl', NULL, 'table', 'wuhongming', 1546077805383, 'wuhongming', 1546077805383, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (16, 'HCBSYQ', 0, '192.168.202.11', '1521', 'HCBSYQ', 'oracle', 'neworcl', NULL, 'table', 'wuhongming', 1546078025748, 'wuhongming', 1546078025748, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (17, 'whm12', 1, '192.168.202.13', '1433', 'sa', 'hzmc321#', 'whm12', NULL, 'table,view', 'wuhongming', 1546403366508, 'wuhongming', 1546403366508, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (18, 'whm111', 1, '192.168.202.13', '1433', 'sa', 'hzmc321#', 'whm111', NULL, 'table', 'wuhongming', 1546916614627, 'wuhongming', 1546916614627, NULL);
INSERT INTO `db_config`(`id`, `config_name`, `config_type`, `host`, `port`, `username`, `password`, `db_name`, `schema_name`, `conn_props`, `create_by`, `create_at`, `update_by`, `update_at`, `remark`) VALUES (19, 'Test', 1, '192.168.200.117', '1433', 'sa', 'hzmc321#', 'Test', NULL, 'table', 'wuhongming', 1546917347311, 'wuhongming', 1546917347311, NULL);





SELECT application , string_agg(DISTINCT md_concepet,';')  md_concepet
FROM mc_service_log
where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'
GROUP BY application



SELECT
application,
string_agg(DISTINCT md_concepet,';')  md_concepet,
MAX(excute_time),
count(application)
FROM mc_service_log
<where>
    type != 'S'
    <if test="mdConcepet!=null and mdConcepet!=''">and md_concepet = #{mdConcepet}</if>
    <if test="application!=null and application!=''">and application = #{application}</if>
    <if test="beforeTime!=null and beforeTime!='' and afterTime!=null and afterTime!=''">
    and excute_time between #{beforeTime} and #{afterTime}
    </if>
</where>
GROUP BY application



SELECT
application ,
string_agg(DISTINCT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),';')  tables,
MAX(excute_time),
count(application)
FROM mc_service_log
<where>
    type != 'S'
    <if test="application!=null and application!=''">and application = #{application}</if>
    <if test="beforeTime!=null and beforeTime!='' and afterTime!=null and afterTime!=''">
    and excute_time between #{beforeTime} and #{afterTime}
    </if>
     <if test="mdConcepet!=null and mdConcepet!=''">and md_concepet = #{mdConcepet}</if>
    and application in (SELECT DISTINCT application FROM mc_service_log where md_concepet = 'RD_TYPE_MESSAGE')
</where>
GROUP BY application


SELECT
application ,
string_agg(DISTINCT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),';')  md_concepet,
MAX(excute_time),
count(application)
FROM mc_service_log
<where>
    type != 'S'
    <if test="application!=null and application!=''">and application = #{application}</if>
    <if test="beforeTime!=null and beforeTime!='' and afterTime!=null and afterTime!=''"> and excute_time between #{beforeTime} and #{afterTime}</if>
    <if test="mdConcepet!=null and mdConcepet!=''">and application in (SELECT DISTINCT application FROM mc_service_log where md_concepet = #{mdConcepet})</if>
</where>
GROUP BY application


SELECT
application ,
string_agg(DISTINCT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),';')  md_concepet,
MAX(excute_time) excute_time,
count(application) id
FROM mc_service_log
where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'
and application in (SELECT DISTINCT application FROM mc_service_log where md_concepet = 'RD_TYPE_MESSAGE')
and application = '应用2'
GROUP BY application


SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = 'MD_COMPANY_CUSTOMBROKER'

SELECT * FROM mc_service_log where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'

SELECT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),
count(md_concepet),MAX(excute_time) excute_time FROM mc_service_log where type !='S' and  application = '应用1' GROUP BY md_concepet


SELECT
(SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),
count(md_concepet) successCount,
MAX(excute_time) excute_time
FROM mc_service_log
WHERE
type != 'S' and application = #{application}
GROUP BY md_concepet



SELECT
application ,
string_agg(DISTINCT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),';')  md_concepet,
MAX(excute_time) excute_time,
count(application) id
FROM mc_service_log
where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'
and application in (SELECT DISTINCT application FROM mc_service_log where md_concepet = 'RD_TYPE_MESSAGE')
and application = '应用2'
GROUP BY application


SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = 'MD_COMPANY_CUSTOMBROKER'

SELECT * FROM mc_service_log where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'

SELECT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),
count(md_concepet),MAX(excute_time) excute_time FROM mc_service_log where type !='S' and  application = '应用1' GROUP BY md_concepet


SELECT DISTINCT application FROM mc_service_log where type !='S'

SELECT DISTINCT md_concepet,md_concepet_cn FROM mc_md_type_relation
SELECT DISTINCT md_concepet,md_concepet_cn FROM mc_md_type_relation

 SELECT DISTINCT md_concepet mdConcepet,md_concepet_cn mdConcepetCn FROM mc_md_type_relation





SELECT
application ,
string_agg(DISTINCT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),';')  md_concepet,
MAX(excute_time) excute_time,
count(application) id
FROM mc_service_log
where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'
and application in (SELECT DISTINCT application FROM mc_service_log where md_concepet = 'RD_TYPE_MESSAGE')
and application = '应用2'
GROUP BY application


SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = 'MD_COMPANY_CUSTOMBROKER'

SELECT * FROM mc_service_log where type !='S' and excute_time < '2029-01-15 10:13:05.585' and  excute_time > '2019-01-15 10:13:05.585'

SELECT (SELECT md_concepet_cn FROM mc_md_type_relation where md_concepet = mc_service_log.md_concepet),
(SELECT count(application) FROM mc_service_log where type !='S' and  application = '应用1'),
count(md_concepet) ,MAX(excute_time) excute_time FROM mc_service_log where type !='S' and  application = '应用1' GROUP BY md_concepet


SELECT DISTINCT application FROM mc_service_log where type !='S'

SELECT DISTINCT md_concepet,md_concepet_cn FROM mc_md_type_relation
SELECT DISTINCT md_concepet,md_concepet_cn FROM mc_md_type_relation

 SELECT DISTINCT md_concepet mdConcepet,md_concepet_cn mdConcepetCn FROM mc_md_type_relation
