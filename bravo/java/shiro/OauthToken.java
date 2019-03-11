package com.mchz.datamanager.shiro;

import lombok.AllArgsConstructor;
import org.apache.shiro.authc.AuthenticationToken;

/**
 * The type Oauth token.
 *
 * @package: com.mchz.datamanager.shiro
 * @author: Elijah.D
 * @time: CreateAt 2018/10/17 && 9:11
 * @description: 自定义控制token
 * @copyright: Copyright © 2018 xlasers
 * @version: V1.0
 * @modified: Elijah.D
 */
@AllArgsConstructor
public class OauthToken implements AuthenticationToken {
    private static final long serialVersionUID = 7196595157510578548L;

    /**
     * The Token.
     */
    private final String token;

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {

        // return token;
        return getPrincipal();
    }
}