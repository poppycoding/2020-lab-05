-- 1.统计数量
-- table
select count(*) from sysobjects  where xtype='U'
-- view
select count(*) from sysobjects  where xtype='V'
-- columns
select count(*) from syscolumns  where id =1810105489

-- 2.总数列表
SELECT u.table_num, v.view_num, (c1.column_num1+c2.column_num2) column_num,(u.table_num + v.view_num + c1.column_num1+c2.column_num2+ 1) count_all
from
(select count(*) table_num from sysobjects where xtype='U') u,
(select count(*) view_num from sysobjects where xtype='V') v,
(select count(*) column_num1 from syscolumns where id in (select u.id from sysobjects u where xtype='U')) c1,
(select count(*) column_num2 from syscolumns where id in (select v.id from sysobjects v where xtype='V')) c2




