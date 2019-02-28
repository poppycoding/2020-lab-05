package com.mchz.datahospital.util;

import java.util.List;

import cn.hutool.json.JSONObject;
import com.mchz.datahospital.common.Status;
import com.mchz.datahospital.exception.HospitalException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

/**
 * <p>
 * T: 封装统一jdbc工具类
 * </p>
 *
 * @package: com.mchz.datahospital.util
 * @author: Elijah.D
 * @time: CreateAt 2019/2/21 && 13:52
 * @description: 原生jdbc操作数据库
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Slf4j
@Component
public class JdbcTemplateUtils {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcTemplateUtils(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * jdbcTemplate通用select
     *
     * @param sql         查询语句
     * @param mapper      rowMapper转换类
     * @param filedValues where查询条件值
     * @return 结果集
     */
    public List<JSONObject> querySql(String sql, RowMapper<JSONObject> mapper, Object... filedValues) {

        List<JSONObject> jsonObjects;

        try {
            jsonObjects = jdbcTemplate.query(sql, filedValues, mapper);
        } catch (Exception e) {
            log.error("========== jdbc执行sql异常, 堆栈信息 {}", e.getMessage());
            throw new HospitalException(Status.BAD_SAL_GRAMMAR);
        }

        return jsonObjects;
    }

    /**
     * 查询单个封装 TODO 待完善测试
     *
     * @param sql         sql语句
     * @param mapper      映射字段
     * @param filedValues 字段值
     * @return 查询对象
     */
    public Object queryForObject(String sql, RowMapper<Object> mapper, Object... filedValues) {
        Object t;

        try {
            t = jdbcTemplate.queryForObject(sql, filedValues, mapper);
        } catch (Exception e) {
            log.error("========== jdbc执行sql异常, 堆栈信息 {}", e.getMessage());
            throw new HospitalException(Status.BAD_SAL_GRAMMAR);
        }

        return t;
    }

    /**
     * jdbcTemplate通用update(insert,delete表格)
     *
     * @param sql         执行sql
     * @param filedValues where查询条件值
     */
    public int executeSql(String sql, Object... filedValues) {
        int rowNumber;

        try {
            rowNumber = jdbcTemplate.update(sql, filedValues);
        } catch (Exception e) {
            log.error("========== jdbc执行sql异常,堆栈信息 {}", e.getMessage());
            throw new HospitalException(Status.BAD_SAL_GRAMMAR);
        }

        return rowNumber;
    }
}
