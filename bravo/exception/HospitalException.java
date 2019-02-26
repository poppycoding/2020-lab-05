package com.mchz.datahospital.exception;

import com.mchz.datahospital.common.Status;
import lombok.Getter;

/**
 * <p>
 * E: 全局异常类
 * </p>
 *
 * @package: com.mchz.datahospital.exception
 * @author: Elijah.D
 * @time: CreateAt 2019/2/19 && 17:03
 * @description: 统一处理异常
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Getter
public class HospitalException extends BaseException {
    private static final long serialVersionUID = 2972087296820246773L;

    public HospitalException(Status status) {
        super(status);
    }

    /**
     * 状态枚举生成异常
     *
     * @param status 状态枚举
     * @param data   响应数据
     */
    public HospitalException(Status status, Object data) {
        super(status, data);
    }

    /**
     * 状态码,异常消息生成异常
     *
     * @param code    状态码
     * @param message 响应信息
     */
    public HospitalException(Integer code, String message) {
        super(code, message);
    }

    /**
     * 状态码,异常消息,响应数据生成异常
     *
     * @param code    状态码
     * @param message 响应信息
     * @param data    响应数据
     */
    public HospitalException(Integer code, String message, Object data) {
        super(code, message, data);
    }
}
