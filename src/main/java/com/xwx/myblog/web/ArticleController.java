package com.xwx.myblog.web;

import com.xwx.myblog.entity.Article;
import com.xwx.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by 73667 on 2017/11/1.
 */
@Controller
@RequestMapping("a/article")
public class ArticleController {
    @Autowired
    private ArticleService service;
    @RequestMapping("/readArticle")
    public String read(int aid,Model model){
        Article article = service.getArticle(aid);
        model.addAttribute("article",article);
        return "article";
    }
    @RequestMapping("/upload")
    @ResponseBody
    public Map<String,Object> upload(HttpServletRequest request,@RequestParam(value = "editormd-image-file", required = true) MultipartFile file) {
        Map<String,Object> map = new HashMap<String, Object>();

//        String fileName = UUID.randomUUID().toString()+suffix;
//        String path = request.getSession().getServletContext().getRealPath("/static/upload");
        String realPath = request.getRealPath("/")+"static/upload/";
        String fileName = UUID.randomUUID().toString()+file.getOriginalFilename();
        File targetFile = new File(realPath,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        map.put("url",request.getContextPath()+"/static/upload/"+fileName);
        map.put("success",1);
        map.put("message","upload success");
        return map;

    }
}
