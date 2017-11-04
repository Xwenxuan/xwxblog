package com.xwx.myblog.web;

import com.xwx.myblog.entity.Article;
import com.xwx.myblog.service.ArticleService;
import com.xwx.myblog.service.CategoryService;
import com.xwx.myblog.service.UserService;
import com.xwx.myblog.utils.StringUtils;
import com.xwx.myblog.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 73667 on 2017/10/31.
 */
@Controller
@RequestMapping("/a/blogWrite")
public class BlogController {
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;
    @Autowired
    CategoryService categoryService;
    @RequestMapping("/submit")
    public String test(HttpServletRequest request,String title,String category,String tag){
        Article article = new Article();
        String md = request.getParameter("my-editormd-html-code");
        String note = StringUtils.getContent(md);
        article.setContent(md);
        article.setNote(note);
        article.setTitle(title);
        int cid = categoryService.getId(category);
        article.setCid(cid);
        article.setTag(tag);
        int uid = userService.getUid(UserUtil.getCurrentUserName());
        article.setUid(uid);
        article.setImage(StringUtils.getImgUrl(md));
        articleService.addArticle(article);
        return "redirect:/a/index";
    }
}
