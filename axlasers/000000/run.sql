select
    INFO.ID as PERSON_INFO_ID,
	null as PAYMENT_MODE,
	INFO.ARCHIVE_NO as ARCHIVE_NO,
	01 as IDENTITY_TYPE_SFZ,
	( select SFZ.IDENTITY_NO from HRA00_PERSON_IDENT SFZ where SFZ.IDENTITY_TYPE = '01' and SFZ.PERSON_INFO_ID = INFO.ID and rownum = 1 ) as IDENTITY_NO_SFZ,
	INFO.NAME as PATIENT_NAME,
	INFO.BIRTHDAY as BIRTHDAY,
	INFO.NATIONALITY as NATIONALITY_DM,
	INFO.GENDER as GENDER_DM,
	INFO.SUB_NATIONALITY as SUB_NATIONALITY_DM,
	INFO.MARRIAGE as MARRIAGE_DM,
	INFO.BLOOD_TYPE as BLOOD_TYPE_DM,
	INFO.RH_BLOOD_TYPE as RH_BLOOD_TYPE_DM,
	INFO.EDUCATION_DEGREE as EDUCATION_DEGREE_DM,
	null as GRSF_DM,
	( select TELE.TELEPHONE_NO from HRA00_PERSON_TELE TELE where TELE.TELEPHONE_TYPE = '01' and TELE.PERSON_INFO_ID = INFO.ID and rownum = 1 ) as TELEPHONE_NO,
	INFO.S_SCQD_DM as LYQD_DM,
	INFO.S_SCQD_LXRXM as LYQDLXRXM,
	INFO.S_SCQD_LXRDH as LYQDLXRDH,
	INFO.S_SCQD_WLRY as LYQDWLRY,
	MM.EMPLOYEE_NAME as FIRST_DCOTOR,
	MM.REMARK as FIRST_ADRESS,
	MM.REGISTRATION_DATE as FIRST_DATE,
	ADDR.DETAIL_ADDRESS as SXXDZ
from HRA00_PERSON_INFO INFO
left join HRA00_PERSON_IDENT IDENT on INFO.ID = IDENT.PERSON_INFO_ID
left join ( select row_number () over ( partition by OPC.PERSON_INFO_ID order by OPC.REGISTRATION_DATE ) RN, OPC.PERSON_INFO_ID, DOCTOR.EMPLOYEE_NAME, DEPT.REMARK, OPC.REGISTRATION_DATE
            from OPC_REGISTRATION OPC
            inner join HRM_EMPLOYEE DOCTOR on OPC.DOCTOR_ID = DOCTOR.ID
            inner join HRA00_DEPARTMENT DEPT on OPC.DEPARTMENT_ID = DEPT.ID ) MM on MM.RN = 1 and MM.PERSON_INFO_ID = INFO.ID
left join HRA00_PERSON_ADDR ADDR on ADDR.PERSON_INFO_ID = INFO.ID
where
	IDENT.IDENTITY_TYPE = '01' and IDENT.IDENTITY_NO = '530629198707250181'

select id,remark as arelName from hra00_department  where DEPARTMENT_RANK = '200'


select a.id,a.s_xm,a.s_po_xm,t.s_identity_no,a.I_ZQLX_XH as inCycle,a.s_blh
from ivf_patient t, IVF_CMRS a
where a.ivf_patient_id =  t.id and t.s_identity_no = '0130151538'
group by a.id,a.s_blh,a.s_xm,a.s_po_xm, t.s_identity_no, a.s_blh ,a.I_ZQLX_XH



select * from
(
 select row_number() over(partition by a.item_code order by b.DOCHECK_TIME desc) rn,
 a.item_code,a.inspec_value,
 a.item_name,a.item_name_cn,
 b.person_info_id,b.DOCHECK_TIME
 from lis.v_inspec_result a
 left join lis.v_inspec_general_info b
 on a.general_info_id = b.id
 where b.person_info_id= '1612010082' and
 b.DOCHECK_TIME is not null
)ss
where ss.rn=1 and ss.item_code is not null