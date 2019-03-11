package com.xlasers.opening.common;

import com.xlasers.opening.common.enums.Status;
import com.xlasers.opening.common.exception.BaseException;
import lombok.Data;

/**
 * <p>
 * api: 通用返回response
 * </p>
 *
 * @package: com.xlasers.opening.common
 * @author: Elijah.D
 * @time: CreateAt 2018/10/15 && 16:54
 * @description: 统一返回封装
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Data
public class ApiResponse {
    /**
     * 状态码
     */
    private Integer code;

    /**
     * 返回内容
     */
    private String message;

    /**
     * 返回数据
     */
    private Object data;

    /**
     * 无参构造函数
     */
    private ApiResponse() {

    }

    /**
     * 全参构造函数
     *
     * @param code    状态码
     * @param message 返回内容
     * @param data    返回数据
     */
    private ApiResponse(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * <p> 构造一个自定义的API返回
     *
     * @param code    状态码
     * @param message 返回内容
     * @param data    返回数据
     * @return ApiResponse api返回
     */
    public static ApiResponse of(Integer code, String message, Object data) {
        return new ApiResponse(code, message, data);
    }

    /**
     * <p> 构造一个成功无返回数据的API返回
     *
     * @return ApiResponse api返回
     */
    public static ApiResponse ofSuccess() {
        return ofStatus(Status.OK);
    }

    /**
     * <p> 构造一个成功且带数据的API返回
     *
     * @param data 返回数据
     * @return ApiResponse api返回
     */
    public static ApiResponse ofSuccess(Object data) {
        return ofStatus(Status.OK, data);
    }

    /**
     * <p> 构造一个成功且自定义消息的API返回
     *
     * @param message 返回内容
     * @return ApiResponse api返回
     */
    public static ApiResponse ofMessage(String message) {
        return of(Status.OK.getCode(), message, null);
    }

    /**
     * <p> 构造一个有状态的API返回
     *
     * @param status 状态 {@link Status}
     * @return ApiResponse api返回
     */
    public static ApiResponse ofStatus(Status status) {
        return ofStatus(status, null);
    }

    /**
     * <p> 构造一个有状态且带数据的API返回
     *
     * @param status 状态 {@link Status}
     * @param data   返回数据
     * @return ApiResponse api返回
     */
    public static ApiResponse ofStatus(Status status, Object data) {
        return of(status.getCode(), status.getMessage(), data);
    }

    /**
     * <p> 构造一个异常的API返回
     *
     * @param <T> {@link BaseException} 的子类
     * @param t   异常
     * @return ApiResponse api返回
     */
    public static <T extends BaseException> ApiResponse ofException(T t) {
        return of(t.getCode(), t.getMessage(), t.getData());
    }
}
