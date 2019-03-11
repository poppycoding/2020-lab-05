package com.mchz.datahospital.common;

import lombok.Getter;
import org.springframework.http.converter.HttpMessageNotReadableException;

/**
 * <p>
 * E: 全局状态码
 * </p>
 *
 * @package: com.mchz.datahospital.common
 * @author: Elijah.D
 * @time: CreateAt 2019/2/19 && 17:03
 * @description: 状态码封装
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Getter
public enum Status {

    /**
     * 操作成功
     */
    OK(200, "操作成功 !"),

    /**
     * 请求错误
     */
    BAD_REQUEST(400, "请求错误 !"),

    /**
     * 未授权
     */
    UNAUTHORIZED(401, "无效token,验证失败 !"),

    /**
     * 请求不存在
     */
    REQUEST_NOT_FOUND(404, "请求不存在 !"),

    /**
     * 未知异常
     */
    UNKNOWN_ERROR(500, "服务器出错啦 !"),

    /**
     * json参数解析异常{@link HttpMessageNotReadableException}
     *
     * <p>eg: long类型字段,用integer接收</p>
     */
    PARSE_JSON_ERROR(1000, "JSON参数解析异常!"),

    /**
     * 参数不匹配
     */
    PARAM_NOT_MATCH(1001, "参数不匹配 !"),

    /**
     * 请求参数不能为空
     */
    PARAM_NOT_NULL(1002, "请求参数不能为空 !"),

    /**
     * sql语法错误
     */
    BAD_SAL_GRAMMAR(2000, "错误! 请检查sql语法"),

    /**
     * 用户职工号/授权码错误
     */
    LOGIN_FAILED(3000, "错误! 输入的职工号-授权码不匹配,请重试!"),

    /**
     * 绑定失败
     */
    BIND_FAILED(3001, "jdbc异常! 用户绑定职工号发生错误,请联系管理员,稍后重试!"),

    /**
     * 重复发绑定
     */
    BIND_REPEATED(3002, "绑定异常! 该职工号对应用户已经绑定!"),

    /**
     * 保存报告失败
     */
    SAVE_REPORT_FAILED(4000, "jdbc异常! 保存报告发生错误,请联系管理员,稍后重试!"),

    /**
     * 前端接口调错,重复保存报告,后续应该更新报告
     */
    SAVE_REPORT_REPEATED(4001, "报告提交异常! 今天已经提交,后续进行更操作,前端查看接口是否调用错误!"),

    /**
     * 报告类型错误
     */
    REPORT_TYPE_ERROR(4002, "错误! 总结类型-1:日报, 2:周报, 3:月度总结, 4:年度总结"),

    /**
     * 获取报告详情错误,该id不存在
     */
    REPORT_DETAIL_ERROR(4003, "获取总结详情异常! 该id下无数据,疑似手动误操作数据库导致!"),

    /**
     * 更新报告失败
     */
    UPDATE_REPORT_FAILED(4004, "异常! 更新报告错误,对应该id的报告不存在,疑似手动误操作数据库导致!");

    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 内容
     */
    private final String message;

    Status(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
