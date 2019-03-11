package com.mchz.datamanager.util;

import java.util.Collections;
import java.util.List;

import cn.hutool.core.util.ObjectUtil;
import com.mchz.datamanager.common.Status;
import com.mchz.datamanager.entity.mysql.rbac.SysUserDO;
import com.mchz.datamanager.exception.DataManagerException;
import org.apache.shiro.SecurityUtils;

import static com.mchz.datamanager.common.Status.FORBID_DELETE_ADMIN;
import static com.mchz.datamanager.common.Status.FORBID_DELETE_YOURSELF;

/**
 * The type Shiro utils.
 *
 * @package: com.mchz.datamanager.util
 * @author: Elijah.D
 * @time: CreateAt 2018/10/22 && 11:15
 * @description: 权限相关工具类
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
public class ShiroUtils {
    private ShiroUtils() {
    }

    /**
     * 获取当前用户
     *
     * @return user 信息
     */
    public static SysUserDO getUser() {

        return (SysUserDO) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取当前用户userId
     *
     * @return 用户 id
     */
    public static Long getUserId() {

        if (ObjectUtil.isNull(getUser())) {
            throw new DataManagerException(Status.API_TEST_ERROR);
        }

        return getUser().getId();
    }

    /**
     * 获取当前用户名: 默认为 admin
     *
     * @return 用户 name
     */
    public static String getUserName() {

        if (ObjectUtil.isNull(getUser())) {
            return "admin";
        }

        return getUser().getUsername();
    }

    /**
     * 判断是否删除用户
     *
     * <p> 1.管理员禁止删除
     *
     * <p> 2.当前用户禁止删除
     *
     * @param id
     * @return 删除 {@code true} 不删除 {@code false}
     */
    @SuppressWarnings("unchecked")
    public static void checkDeleteUser(Object id) {

        List<Long> ids;

        // 单个删除,批量删除
        if (id.getClass().equals(Long.class)) {
            ids = Collections.singletonList((Long) id);
        } else {
            ids = (List<Long>) id;
        }

        // 管理员,禁止删除
        if (ids.contains(1L)) {
            throw new DataManagerException(FORBID_DELETE_ADMIN);
        }

        // 当前用户,禁止删除
        if (ids.contains(getUserId())) {
            throw new DataManagerException(FORBID_DELETE_YOURSELF);
        }
    }
}
