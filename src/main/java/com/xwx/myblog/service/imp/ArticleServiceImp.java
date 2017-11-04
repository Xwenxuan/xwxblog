package com.xwx.myblog.service.imp;

import com.xwx.myblog.dao.ArticleDao;
import com.xwx.myblog.entity.Article;
import com.xwx.myblog.entity.Page;
import com.xwx.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 73667 on 2017/10/30.
 */
@Service
public class ArticleServiceImp implements ArticleService{
    @Autowired
    ArticleDao dao;
    public void addArticle(Article article) {
        dao.addArticle(article);
    }

    public Article getArticle(int aid) {
        return dao.getArticle(aid);
    }
    public List<Article> findList() {
        return  dao.findList();
    }

    public Page<Article> findPage() {
        return new Page<Article>();
    }
}
