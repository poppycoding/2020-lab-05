package com.mchz.datahospital.util;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import cn.hutool.core.util.ReflectUtil;
import cn.hutool.core.util.StrUtil;
import lombok.Data;
import lombok.experimental.Accessors;
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
@Data
@Accessors(chain = true)
public class HospitalRowMapper<T> implements RowMapper<T> {
    // TODO  Object o = jdbcTemplate.queryForObject(getSql, new HospitalRowMapper<>().setClassT(ReportDetail.class.getName()), reportId);
    public String classT;

    /**
     * jdbcTemplate查询mapper封装
     *
     * @param rs     结果集
     * @param rowNum 行号
     * @return 字段对应
     * @throws SQLException
     */
    @Override
    public T mapRow(ResultSet rs, int rowNum) throws SQLException {
        T bean = ReflectUtil.newInstance(classT);

        // 获取元数据信息
        ResultSetMetaData metaData = rs.getMetaData();

        // 填充列信息
        for (int i = 0; i < metaData.getColumnCount(); i++) {
            String columnName = metaData.getColumnName(i + 1);
            Object columnValue = rs.getObject(i + 1);

            // TODO oracle类型需要转换,否则setFieldValue方法字段类型与值不匹配抛出异常
            Class<?> filedType = ReflectUtil.getField(bean.getClass(), StrUtil.toCamelCase(columnName.toLowerCase())).getType();
            if (columnValue.getClass().equals(BigDecimal.class)) {
                if (filedType.equals(Long.class)) {
                    columnValue = ((BigDecimal) columnValue).longValue();
                }
                if (filedType.equals(Integer.class)) {
                    columnValue = ((BigDecimal) columnValue).intValue();
                }
            }

            //TODO msyql类型尚未测试
            ReflectUtil.setFieldValue(bean, StrUtil.toCamelCase(columnName.toLowerCase()), columnValue);
        }

        return bean;
    }
}
