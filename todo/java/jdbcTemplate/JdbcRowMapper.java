package com.mchz.datahospital.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import cn.hutool.json.JSONObject;
import org.springframework.jdbc.core.RowMapper;

/**
 * <p>
 * R: jdbc查询mapper封装实现
 * </p>
 *
 * @package: com.mchz.datahospital.util
 * @author: Elijah.D
 * @time: CreateAt 2019/2/22 && 15:32
 * @description: rowMapper
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
public class JdbcRowMapper implements RowMapper<JSONObject> {
    /**
     * jdbcTemplate查询mapper封装
     *
     * @param rs     结果集
     * @param rowNum 行号
     * @return 字段对应
     * @throws SQLException
     */
    @Override
    public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
        //取出元数据信息
        ResultSetMetaData metaData = rs.getMetaData();

        //获取列信息
        JSONObject json = new JSONObject();
        for (int i = 0; i < metaData.getColumnCount(); i++) {
            String columnName = metaData.getColumnName(i + 1);

            //非空转换,防止字段丢失
            Object columnValue = rs.getObject(i + 1);
            if (columnValue == null) {
                columnValue = "";
            }

            json.put(columnName, columnValue);
        }

        return json;
    }
}
