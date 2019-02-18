package com.xlasers.opening.common.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * <p>
 * T: Spring的ApplicationContext的持有者,可以用静态方法的方式获取spring容器中的bean
 * </p>
 *
 * @package: com.xlasers.opening.common.util
 * @author: Elijah.D
 * @time: CreateAt 2019/2/18 && 16:02
 * @description: 静态获取spring对象
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Component
public class SpringContextHolder implements ApplicationContextAware {
    /**
     * 静态全局对象context
     */
    private static ApplicationContext context;

    /**
     * 获取全局对象
     *
     * @return 全局对象
     */
    public static ApplicationContext getContext() {
        return context;
    }

    /**
     * 判断是否包含bean
     *
     * @param beanName bean名字
     * @return 包含 {@code true} 不包含 {@code false}
     */
    public static boolean containsBean(String beanName) {
        return context.containsBean(beanName);
    }

    /**
     * 判断bean是否单例
     *
     * @param beanName bean名字
     * @return 单例 {@code true} 非单例 {@code false}
     */
    public static boolean isSingleton(String beanName) {
        return context.isSingleton(beanName);
    }

    /**
     * 通过名字获取bean
     *
     * @param beanName bean名字
     * @param <T>      泛型
     * @return bean
     */
    @SuppressWarnings("unchecked")
    public static <T> T getBean(String beanName) {

        return (T) context.getBean(beanName);
    }

    /**
     * 通过类型获取bean
     *
     * @param requiredType bean类型
     * @param <T>          泛型
     * @return bean
     */
    public static <T> T getBean(Class<T> requiredType) {

        return context.getBean(requiredType);
    }

    /**
     * 通过名字,类型获取bean
     *
     * @param beanName     bean名字
     * @param requiredType bean类型
     * @param <T>          泛型
     * @return bean
     */
    public static <T> T getBean(String beanName, Class<T> requiredType) {
        return context.getBean(beanName, requiredType);
    }

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        SpringContextHolder.context = context;
    }
}
