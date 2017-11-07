package com.xwx.myblog.service.imp;

import com.xwx.myblog.dao.CategoryDao;
import com.xwx.myblog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 73667 on 2017/10/31.
 */
@Service
public class CategoryServiceImp implements CategoryService{
    @Autowired
    private CategoryDao dao;
    public int getId(String cname) {
        return dao.getId(cname);
    }

    public String getCategoryById(int cid) {
        return dao.getCategoryById(cid);
    }

}
