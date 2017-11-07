package com.xwx.myblog.service.imp;

import com.xwx.myblog.dao.ArticleSaveDao;
import com.xwx.myblog.entity.ArticleSave;
import com.xwx.myblog.service.ArticleSaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 73667 on 2017/11/6.
 */
@Service
public class ArticleSaveServiceImp implements ArticleSaveService{
    @Autowired
    private ArticleSaveDao dao;
    public void addArticleSave(ArticleSave articleSave) {
        dao.addArticleSave(articleSave);
    }

    public ArticleSave getArticleSave(int sid) {
        return dao.getArticleSave(sid);
    }

    public List<ArticleSave> findList() {
        return dao.findList();
    }

    public void deleteArticleSave(ArticleSave articleSave) {
        dao.deleteArticleSave(articleSave);
    }

    public void updateArticleSave(ArticleSave articleSave) {
        dao.updateArticleSave(articleSave);
    }
}
