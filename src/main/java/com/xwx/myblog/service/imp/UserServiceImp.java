package com.xwx.myblog.service.imp;

import com.xwx.myblog.dao.UserDao;
import com.xwx.myblog.entity.User;
import com.xwx.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 73667 on 2017/10/30.
 */
@Service
public class UserServiceImp implements UserService{
    @Autowired
    private UserDao dao;
    public void addUser(User user) {
        dao.addUser(user);
    }

    public User getUser(String username) {
        return dao.getUser(username);
    }

    public void updateUser(User user) {
        dao.updateUser(user);
    }

    public String getRoles(String username) {
        return dao.getRoles(username);
    }
    public int getUid(String username) {
        return dao.getUid(username);
    }
}
