package com.xwx.myblog.service;

import com.xwx.myblog.entity.ArticleSave;

import java.util.List;

/**
 * Created by 73667 on 2017/11/6.
 */
public interface ArticleSaveService {
    public void addArticleSave(ArticleSave articleSave);
    public ArticleSave getArticleSave(int sid);
    public List<ArticleSave> findList();
    public void deleteArticleSave(ArticleSave articleSave);
    public void updateArticleSave(ArticleSave articleSave);
}
