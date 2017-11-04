package com.xwx.myblog.web;

import com.xwx.myblog.entity.Article;
import com.xwx.myblog.entity.Page;
import com.xwx.myblog.entity.User;
import com.xwx.myblog.service.ArticleService;
import com.xwx.myblog.service.UserService;
import com.xwx.myblog.utils.UserUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 73667 on 2017/10/31.
 */
@Controller
@RequestMapping("/a")
public class UserController {
    @Autowired
    private UserService service;
    @Autowired
    private ArticleService  articleService;
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView get(){
        return new ModelAndView("login");
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request,String username, String password, Model model) {
        String ip = UserUtil.getUserIp(request);
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        try {
            subject.login(token);
            User user = service.getUser(username);
            user.setLoginIp(ip);
            service.updateUser(user);
            model.addAttribute("user",user);
            return "redirect:/a/index";
        }catch (UnknownAccountException e) {
            return "login";
        } catch (IncorrectCredentialsException e) {
            return "login";
        }
    }
    @RequestMapping("/index/blogWrite")
    public String blogWrite(Model model) {
        return "blogWrite";
    }
    @RequestMapping("/index")
    public String toIndex(@RequestParam(value = "pageNo",required = false) Integer pageNo,Model model) {
        Page<Article> page = articleService.findPage();
        page.setList(articleService.findList());
        page.setPageNo(pageNo == null? 1:pageNo);
        model.addAttribute("page",page);
        return "index";
    }
}
