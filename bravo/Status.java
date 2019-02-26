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
     * <p>eg: long类型字段,用integer接收,导致字段长度越界问题</p>
     * <p>eg: lombok插件用@Builder注解,造成实体类没有默认无参构造函数,导致json传参反序列化失败,禁止用builder注解!</p>
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
    BIND_FAILED(3001, "失败! 用户已经绑定职工号发生错误,稍后重试!");

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
