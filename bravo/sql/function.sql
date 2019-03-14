

-- ------------------------------------------Mysql

-- if判断varchar字段的时候不可用null
IF(w.status is null,0,w.status)
select concat_ws('@','11','22',if(null is null ,"null",null),"33");


-- 使用locate(substr,str)函数，如果包含，返回>0的数，否则返回0
-- 例子：判断site表中的url是否包含'http://'子串,如果不包含则拼接在url字符串开头
update site set url =concat('http://',url) where locate('http://',url)=0
