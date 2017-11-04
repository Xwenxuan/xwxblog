package com.xwx.myblog.realm;

import com.xwx.myblog.entity.User;
import com.xwx.myblog.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by 73667 on 2017/10/30.
 */
public class MyRealm extends AuthorizingRealm{
    @Autowired
    private UserService service;
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = (String)principalCollection.getPrimaryPrincipal();
        String role = service.getRoles(username);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> roles = new HashSet<String>();
        roles.add(role);
        info.setRoles(roles);
        return info;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String)authenticationToken.getPrincipal();
        User user = service.getUser(username);
        String realmName = getName();
        if(user != null) {
            AuthenticationInfo info = new SimpleAuthenticationInfo(user.getUserName(),user.getPassword(),realmName);
            return info;
        }
        return null;
    }
}
