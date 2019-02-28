package com.mchz.datahospital.exception;

import com.mchz.datahospital.common.ApiResponse;
import com.mchz.datahospital.common.Status;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

/**
 * <p>
 * H: 全局异常拦截处理
 * </p>
 *
 * @package: com.mchz.datahospital.exception
 * @author: Elijah.D
 * @time: CreateAt 2019/2/19 && 17:03
 * @description: 统一异常处理
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Slf4j
@ControllerAdvice
public class HospitalExceptionHandler {
    /**
     * 统一拦截分配
     *
     * @param e 错误栈
     * @return apiRes
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ApiResponse handlerException(Exception e) {
        if (e instanceof NoHandlerFoundException) {
            log.error("【全局异常拦截】NoHandlerFoundException: 请求方法 {}, 请求路径 {}", ((NoHandlerFoundException) e).getRequestURL(), ((NoHandlerFoundException) e).getHttpMethod());
            return ApiResponse.ofStatus(Status.REQUEST_NOT_FOUND);
        } else if (e instanceof MethodArgumentNotValidException) {
            log.error("【全局异常拦截】MethodArgumentNotValidException", e.getMessage());
            return ApiResponse.of(Status.BAD_REQUEST.getCode(), ((MethodArgumentNotValidException) e).getBindingResult().getAllErrors().get(0).getDefaultMessage(), null);
        } else if (e instanceof MethodArgumentTypeMismatchException) {
            log.error("【全局异常拦截】MethodArgumentTypeMismatchException: 参数名 {}, 异常信息 {}", ((MethodArgumentTypeMismatchException) e).getName(), e.getMessage());
            return ApiResponse.ofStatus(Status.PARAM_NOT_MATCH, ((MethodArgumentTypeMismatchException) e).getName());
        } else if (e instanceof HttpMessageNotReadableException) {
            log.error("【全局异常拦截】HttpMessageNotReadableException: 错误信息 {}", e.getMessage());
            return ApiResponse.ofStatus(Status.PARSE_JSON_ERROR);
        } else if (e instanceof WxErrorException) {
            log.error("【全局异常拦截】WxErrorException: 错误信息 {}", e.getMessage());
            return ApiResponse.of(((WxErrorException) e).getError().getErrorCode(), ((WxErrorException) e).getError().getErrorMsg(), null);
        } else if (e instanceof MissingServletRequestParameterException) {
            log.error("【全局异常拦截】MissingServletRequestParameterException: 错误信息 {}", e.getMessage());
            return ApiResponse.ofStatus(Status.PARAM_NOT_NULL, ((MissingServletRequestParameterException) e).getParameterName());
        } else if (e instanceof HospitalException) {
            log.error("【全局异常拦截】HospitalException: 状态码 {}, 异常信息 {}", ((HospitalException) e).getCode(), e.getMessage());
            return ApiResponse.ofException((HospitalException) e);
        }
        log.error("【全局异常拦截】: 异常信息 {} ", e.getMessage());
        return ApiResponse.ofStatus(Status.UNKNOWN_ERROR);
    }
}
