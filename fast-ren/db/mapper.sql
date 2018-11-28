
-- 查询用户权限id集合
select distinct rm.menu_id
from sys_user_role ur, sys_role_menu rm
where ur.user_id = {#id} and ur.role_id = rm.role_id

-- 查询用户权限name集合
select m.perms
from sys_user_role ur, sys_role_menu rm, sys_menu m
where ur.user_id = {#id} and ur.role_id = rm.role_id and m.menu_id = rm.menu_id

