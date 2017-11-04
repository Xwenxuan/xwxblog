package com.xwx.myblog.dao;

import com.xwx.myblog.entity.Article;

import java.util.List;

/**
 * Created by 73667 on 2017/10/30.
 */
public interface ArticleDao {
    public void addArticle(Article article);
    public Article getArticle(int aid);
    public List<Article> findList();
}
