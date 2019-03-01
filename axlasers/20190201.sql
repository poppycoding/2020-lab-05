SELECT d.root_table_name, d.child_table_name
FROM relation_table d
WHERE d.job_id = 99
AND d.config_name =
AND d.root_schema =
AND d.child_schema =



SELECT CONCAT(GROUP_CONCAT(DISTINCT (root_table_name)) ,GROUP_CONCAT(DISTINCT (child_table_name)))
FROM relation_table d,result_meta_table_display t
WHERE d.job_id = 83
AND d.config_name = t.config_name
AND d.root_schema = t.`schema`
AND d.child_schema = t.`schema`
AND (d.root_table_name = t.table_name OR d.child_table_name = t.table_name)


SELECT *
FROM relation_table d
WHERE (d.root_table_name = 'EMR_GONGNENGDXX' OR d.child_table_name = 'EMR_GONGNENGDXX')


INSERT INTO APP_WE_CHAT_USER VALUES(APP_WE_CHAT_USER_SEQ.nextval,'openId','emp_code','superiorId',"bindAt",'avatar','superiorcode')
INSERT INTO APP_WE_CHAT_USER VALUES(APP_WE_CHAT_USER_SEQ.nextval,?,?,?,?,?,?)




UPDATE APP_WE_CHAT_USER SET SUPERIOR_OPEN_ID = 'ojvZ61DzFNxp4c0Cj1UcW_EBiYHU' WHERE SUPERIOR_EMPLOYEE_CODE = '200004';
UPDATE APP_WE_CHAT_USER SET SUPERIOR_OPEN_ID = ? WHERE SUPERIOR_EMPLOYEE_CODE = ?;



SELECT OPEN_ID FROM APP_WE_CHAT_USER WHERE EMPLOYEE_CODE = '200005'
SELECT OPEN_ID FROM APP_WE_CHAT_USER WHERE EMPLOYEE_CODE = ?



SELECT SUPERIOR_EMPLOYEE_CODE FROM APP_USER_RELATION WHERE EMPLOYEE_CODE = '200004' AND AUTHORIZE_CODE = '1';
SELECT SUPERIOR_EMPLOYEE_CODE FROM APP_USER_RELATION WHERE EMPLOYEE_CODE = ? AND AUTHORIZE_CODE = ?


INSERT INTO APP_WE_CHAT_USER VALUES(APP_WE_CHAT_USER_SEQ.nextval,'openId','code','s',13213,'asdfasf','s') ;
UPDATE APP_WE_CHAT_USER SET SUPERIOR_OPEN_ID = 'ojvZ61DzFNxp4c0Cj1UcW_EBiYHU' WHERE SUPERIOR_EMPLOYEE_CODE = '200004';
SELECT OPEN_ID FROM APP_WE_CHAT_USER WHERE EMPLOYEE_CODE = '200005'
SELECT SUPERIOR_EMPLOYEE_CODE FROM APP_USER_RELATION WHERE EMPLOYEE_CODE = '200004' AND AUTHORIZE_CODE = '1';



SELECT SUPERIOR_OPEN_ID FROM APP_WE_CHAT_USER WHERE OPEN_ID = 'ojvZ61DzFNxp4c0Cj1UcW_EBiYHU'
SELECT SUPERIOR_OPEN_ID FROM APP_WE_CHAT_USER WHERE OPEN_ID = ?


INSERT INTO APP_REPORT_DETAIL VALUES(APP_REPORT_DETAIL_SEQ.nextval,'OPEN_ID','EMPLOYEE_CODE','SUPERIOR_OPEN_ID','TYPE','CONTENT','SUBMIT_AT')
INSERT INTO APP_REPORT_DETAIL VALUES(APP_REPORT_DETAIL_SEQ.nextval,?,?,?,?,?,?)


select APP_REPORT_DETAIL_SEQ.currval from dual

UPDATE APP_REPORT_DETAIL SET CONTENT = '修改报告内容' WHERE ID = 36
UPDATE APP_REPORT_DETAIL SET CONTENT = ? WHERE ID = ?


SELECT COUNT(ID) FROM APP_REPORT_DETAIL WHERE SUPERIOR_OPEN_ID = 'ojvZ61PyT_jS63v1aUzf8IAMEdFU' AND SUBMIT_AT > 21
SELECT COUNT(ID) FROM APP_REPORT_DETAIL WHERE SUPERIOR_OPEN_ID = ? AND SUBMIT_AT > ?

SELECT * FROM
(
SELECT tt.*, ROWNUM AS rowno FROM
 (
 SELECT t.* FROM emp t WHERE hire_date BETWEEN TO_DATE ('20060501', 'yyyymmdd') AND TO_DATE ('20060731', 'yyyymmdd') ORDER BY create_time DESC, emp_no
 ) tt WHERE ROWNUM <= 20
) table_alias WHERE table_alias.rowno >= 10;


-- 每页显示10条分页
select * from
(
select rownum rm, t.*  from APP_REPORT_DETAIL t
) tm
where rm > 10 and rm <= 20

-- 换成代码形式
select * from
(
select rownum rm, t.*  from t_user t
) tm
where rm > pageSize * ( pageNow - 1 ) and rm <= pageSize * pageNow



SELECT * FROM
(
SELECT rownum rm, t.*  FROM APP_REPORT_DETAIL t WHERE EMPLOYEE_CODE = 666 ORDER BY SUBMIT_AT DESC
) tm
WHERE rm > 10 and rm <= 20


SELECT * FROM (SELECT rownum rm, t.* FROM APP_REPORT_DETAIL t WHERE SUPERIOR_OPEN_ID = ? ORDER BY SUBMIT_AT DESC) tm WHERE rm > pageSize * (currentPage - 1) and rm <= pageSize * currentPage
SELECT * FROM (SELECT rownum rm, t.* FROM APP_REPORT_DETAIL t WHERE SUPERIOR_OPEN_ID = ? ORDER BY SUBMIT_AT DESC) tm WHERE rm > ? * (? - 1) and rm <= ? * ?


SELECT * FROM APP_REPORT_DETAIL WHERE OPEN_ID = 'ojvZ61DzFNxp4c0Cj1UcW_EBiYHU' AND SUBMIT_AT > 1551168909272
SELECT * FROM APP_REPORT_DETAIL WHERE OPEN_ID = ? AND SUBMIT_AT > ?


INSERT INTO "MEDICAL_HOS"."APP_WE_CHAT_USER"("ID", "OPEN_ID", "EMPLOYEE_CODE", "SUPERIOR_OPEN_ID", "BIND_AT", "AVATAR", "SUPERIOR_EMPLOYEE_CODE") VALUES ('18', 'ojvZ61JwzwTEWlMymZHQryGj8PEs', '1_2000019', NULL, '1551332931445', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1b1ZPmMGsEzygbFajtrcuzTW8fLoQicibgTq5J5OXRDbuSWPVZen4sKV0wrxpapmCyo0UVxBBXYEQ/132', '1_2000019');
INSERT INTO "MEDICAL_HOS"."APP_WE_CHAT_USER"("ID", "OPEN_ID", "EMPLOYEE_CODE", "SUPERIOR_OPEN_ID", "BIND_AT", "AVATAR", "SUPERIOR_EMPLOYEE_CODE") VALUES ('14', 'ojvZ61DzFNxp4c0Cj1UcW_EBiYHU', '1_2000004', 'ojvZ61JwzwTEWlMymZHQryGj8PEs', '1551332686876', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1b1ZPmMGsEzygbFajtrcuzTW8fLoQicibgTq5J5OXRDbuSWPVZen4sKV0wrxpapmCyo0UVxBBXYEQ/132', '1_2000019');
INSERT INTO "MEDICAL_HOS"."APP_WE_CHAT_USER"("ID", "OPEN_ID", "EMPLOYEE_CODE", "SUPERIOR_OPEN_ID", "BIND_AT", "AVATAR", "SUPERIOR_EMPLOYEE_CODE") VALUES ('17', 'ojvZ61PyT_jS63v1aUzf8IAMEdFU', '1_2000005', 'ojvZ61JwzwTEWlMymZHQryGj8PEs', '1551332873631', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1b1ZPmMGsEzygbFajtrcuzTW8fLoQicibgTq5J5OXRDbuSWPVZen4sKV0wrxpapmCyo0UVxBBXYEQ/132', '1_2000019');
