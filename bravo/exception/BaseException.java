package com.mchz.datahospital.exception;

import com.mchz.datahospital.common.Status;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * B: 全局异基类
 * </p>
 *
 * @package: com.mchz.datahospital.exception
 * @author: Elijah.D
 * @time: CreateAt 2018/10/15 && 16:46
 * @description: 异常基类
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = 3903606557699184213L;

    /**
     * 状态码
     */
    private Integer code;

    /**
     * 响应信息
     */
    private String message;

    /**
     * 响应数据
     */
    private Object data;

    /**
     * 状态枚举生成异常
     *
     * @param status 状态枚举
     */
    public BaseException(Status status) {
        super(status.getMessage());
        code = status.getCode();
        message = status.getMessage();
    }

    /**
     * 状态枚举,响应数据生成异常
     *
     * @param status 状态枚举
     * @param data   响应数据
     */
    public BaseException(Status status, Object data) {
        this(status);
        this.data = data;
    }

    /**
     * 状态码,异常消息生成异常
     *
     * @param code    状态码
     * @param message 响应信息
     */
    public BaseException(Integer code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    /**
     * 状态码,异常消息,响应数据生成异常
     *
     * @param code    状态码
     * @param message 响应信息
     * @param data    响应数据
     */
    public BaseException(Integer code, String message, Object data) {
        this(code, message);
        this.data = data;
    }
}
