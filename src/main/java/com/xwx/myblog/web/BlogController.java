package com.xwx.myblog.web;

import com.xwx.myblog.entity.Article;
import com.xwx.myblog.entity.ArticleSave;
import com.xwx.myblog.service.ArticleSaveService;
import com.xwx.myblog.service.ArticleService;
import com.xwx.myblog.service.CategoryService;
import com.xwx.myblog.service.UserService;
import com.xwx.myblog.utils.StringUtils;
import com.xwx.myblog.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Autowired
    private ArticleSaveService articleSaveService;
    @RequestMapping("/submit")
    public String test(HttpServletRequest request,String title,String category,String tag,@RequestParam(value = "sid",required = false) String sid){
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
        if(sid != null) {
            ArticleSave articleSave = new ArticleSave();
            articleSave.setSid(Integer.parseInt(sid));
            articleSaveService.deleteArticleSave(articleSave);
        }
        return "redirect:/a/index";
    }
    @RequestMapping("/save")
    public String save(String title, String content, String tag, String category, @RequestParam(value = "sid",required = false) Integer sid) {
        ArticleSave articleSave = new ArticleSave();
        articleSave.setCid(categoryService.getId(category));
        articleSave.setContent(content);
        articleSave.setTag(tag);
        articleSave.setTitle(title);
        articleSave.setUid(userService.getUid(UserUtil.getCurrentUserName()));
        if(sid == null) {
            articleSaveService.addArticleSave(articleSave);
        }else {
            articleSaveService.updateArticleSave(articleSave);
        }
        return "redirect:/a/index";
    }
    @RequestMapping("/edit")
    public String edit(Model model,int sid) {
        ArticleSave articleSave = articleSaveService.getArticleSave(sid);
        model.addAttribute("articleSave",articleSave);
        return "editBlog";
    }
}
