package com.mchz.datamanager.shiro;

import java.security.MessageDigest;
import java.util.UUID;

import com.mchz.datamanager.common.Status;
import com.mchz.datamanager.exception.DataManagerException;
import lombok.extern.slf4j.Slf4j;

/**
 * @package: com.mchz.datamanager.shiro
 * @author: Elijah.D
 * @time: CreateAt 2018/10/17 && 9:13
 * @description:
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@Slf4j
public class TokenGenerator {
    /**
     * 16进制数
     */
    private static final char[] HEX_CODE = "0123456789abcdef".toCharArray();

    private TokenGenerator() {
    }

    /**
     * Generate token string.
     *
     * <p> 生成token
     *
     * @return the string
     */
    public static String generateToken() {

        return generateValue(UUID.randomUUID().toString());
    }

    /**
     * Generate value string.
     *
     * <p> 生成token
     *
     * @param data the data
     * @return the string
     */
    public static String generateValue(String data) {

        try {
            MessageDigest algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(data.getBytes());
            byte[] msgDigest = algorithm.digest();
            return toHexString(msgDigest);
        } catch (Exception e) {

            log.error("【TokenGenerator】生成Token失败 !");
            throw new DataManagerException(Status.FAILED_CREATE_TOKEN);
        }
    }

    /**
     * To hex string string.
     *
     * <p> 生成16进制数
     *
     * @param data the data
     * @return the string
     */
    public static String toHexString(byte[] data) {

        if (data == null) {
            return null;
        }

        StringBuilder builder = new StringBuilder(data.length * 2);
        for (byte b : data) {

            builder.append(HEX_CODE[b >> 4 & 0xF]);
            builder.append(HEX_CODE[b & 0xF]);
        }
        return builder.toString();
    }
}
