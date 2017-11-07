package com.xwx.myblog.dao;

/**
 * Created by 73667 on 2017/10/31.
 */
public interface CategoryDao {
    public int getId(String cname);
    public String getCategoryById(int cid);
}
