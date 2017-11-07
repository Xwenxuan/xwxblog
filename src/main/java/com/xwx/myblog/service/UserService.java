package com.xwx.myblog.service;

import com.xwx.myblog.entity.User;

/**
 * Created by 73667 on 2017/10/30.
 */
public interface UserService {
    public void addUser(User user);
    public User getUser(String username);
    public void updateUser(User user);
    public String getRoles(String username);
    public int getUid(String username);
    public String getUserName(int uid);
}
