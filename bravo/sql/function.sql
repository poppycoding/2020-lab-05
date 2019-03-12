


-- if判断varchar字段的时候不可用null

IF(w.status is null,0,w.status)

select concat_ws('@','11','22',if(null is null ,"null",null),"33");
