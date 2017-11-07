package com.xwx.myblog.utils;

import com.xwx.myblog.dao.CategoryDao;
import com.xwx.myblog.dao.UserDao;
import com.xwx.myblog.service.CategoryService;
import com.xwx.myblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by 73667 on 2017/11/6.
 */
public class OtherUtils {

   private static CategoryDao categoryDao = SpringContextHolder.getBean(CategoryDao.class);
    private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);

    public static String getCategoryById(int cid) {
        return categoryDao.getCategoryById(cid);
    }
    public static String getUserName(int uid) {
        return userDao.getUserName(uid);
    }
}
