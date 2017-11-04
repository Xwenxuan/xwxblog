package com.xwx.myblog.service;

import com.xwx.myblog.entity.Article;
import com.xwx.myblog.entity.Page;

import java.util.List;

/**
 * Created by 73667 on 2017/10/30.
 */
public interface ArticleService {
    public void addArticle(Article article);
    public Article getArticle(int aid);
    public List<Article> findList();
    public Page<Article> findPage();
}
