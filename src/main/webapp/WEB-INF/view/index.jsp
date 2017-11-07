<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 73667
  Date: 2017/10/30
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>BLOG index with sidebar & slider  | Amaze UI Examples</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.getContextPath()}/static/assets/i/favicon.png">
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="${pageContext.request.getContextPath()}/static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.getContextPath()}/static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileImage" content="${pageContext.request.getContextPath()}/static/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/assets/css/app.css">
</head>

<body id="blog">

<!-- <header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
    <div class="am-u-sm-8 am-u-sm-centered">
        <img width="200" src="http://s.amazeui.org/media/i/brand/amazeui-b.png" alt="Amaze UI Logo"/>
        <h2 class="am-hide-sm-only">丁雨涵的个人博客</h2>
    </div>
</header> -->
<hr>
<!-- nav start -->
<nav class="am-g am-g-fixed blog-fixed blog-nav">
    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only blog-button" data-am-collapse="{target: '#blog-collapse'}" ><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="blog-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li class="am-active"><a href="lw-index.jsp">首页</a></li>
            <li><a href="#">技术杂谈</a></li>
            <li><a href="#">生活笔记</a></li>
            <li><a href="${pageContext.request.getContextPath()}/a/index/blogWrite">发表博客</a></li>
            <li><a href="${pageContext.request.getContextPath()}/a/index/myBlog">我的博客</a></li>
            <li><a href="#">关于</a></li>
            <li><a href="#">联系我</a></li>
        </ul>
        <form class="am-topbar-form am-topbar-right am-form-inline" role="search">
            <div class="am-form-group">
                <input type="submit" class="am-form-field am-btn-default" value="搜索">
                <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
            </div>
        </form>
    </div>
</nav>
<hr>
<!-- nav end -->
<!-- banner start -->
<div class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-article-margin">
    <div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{&quot;animation&quot;:&quot;slide&quot;,&quot;slideshow&quot;:false}' >
        <ul class="am-slides">
            <c:forEach items="${page.firstThree}" var="item" varStatus="index">
            <li>
                <a href="${pageContext.request.getContextPath()}/a/article/readArticle?aid=${item.aid}"><img src="${item.image}" style="height:506px"></a>
                <div class="am-slider-desc">${item.title}</div>
            </li>
            </c:forEach>

        </ul>
    </div>
</div>
<!-- banner end -->

<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed">
    <div class="am-u-md-8 am-u-sm-12">

        <c:forEach items="${page.data}" var="item" varStatus="index">
        <article class="am-g blog-entry-article">
            <div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">
                <img src="${item.image}" alt="" class="am-u-sm-12" style="height:192px">
            </div>
            <div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">
                <span><a href="${pageContext.request.getContextPath()}/a/article/readArticle?aid=${item.aid}" class="blog-color">article&nbsp;</a></span>
                <span>xiaowenxuan</span>
                <span><fmt:formatDate value="${item.createDate}" pattern="yyyy/MM/dd"/> </span>
                <h1><a href="${pageContext.request.getContextPath()}/a/article/readArticle?aid=${item.aid}">${item.title}</a></h1>
                <p>${item.note}
                </p>
                <p><a href="" class="blog-continue">continue</a></p>
            </div>
        </article>
        </c:forEach>


        <ul class="am-pagination">
            <li class="am-pagination-prev"><a href="${pageContext.request.getContextPath()}/a/index?pageNo=${page.pageNo==1?1:page.pageNo-1}">&laquo; Prev</a></li>
            <c:forEach var="i" begin="1" end="${page.pageNum}">
                <li class=""><a href="${pageContext.request.getContextPath()}/a/index?pageNo=${i}"><c:out value="${i}"/></a></li>
            </c:forEach>
            <li class="am-pagination-next"><a href="${pageContext.request.getContextPath()}/a/index?pageNo=${page.pageNo==page.pageNum?page.pageNum:page.pageNo+1}">Next &raquo;</a></li>
        </ul>
    </div>

    <div class="am-u-md-4 am-u-sm-12 blog-sidebar">
        <div class="blog-sidebar-widget blog-bor">
            <h2 class="blog-text-center blog-title"><span>About ME</span></h2>
            <img src="https://tse4-mm.cn.bing.net/th?id=OIP.qHEEa9hIlZUENTXdxG_J1gEKDq&p=0&pid=1.1" alt="about me" class="blog-entry-img" style="width:416px">
            <p>AbrahamXWX</p>
            <p>
                肖文轩写博客
            </p><p>即将毕业的大学生一枚，准备开始写博客记录学习和生活</p>
        </div>
        <div class="blog-sidebar-widget blog-bor">
            <h2 class="blog-text-center blog-title"><span>Contact ME</span></h2>
            <p>
                <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a>
                <a href=""><span class="am-icon-github am-icon-fw blog-icon"></span></a>
                <a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
                <a href=""><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
                <a href=""><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
            </p>
        </div>
        <div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
            <h2 class="blog-title"><span>TAG cloud</span></h2>
            <div class="am-u-sm-12 blog-clear-padding">
                <a href="" class="blog-tag">大四学生</a>
                <a href="" class="blog-tag">Java</a>
                <a href="" class="blog-tag">web</a>
                <a href="" class="blog-tag">python</a>
                <a href="" class="blog-tag">Android</a>
                <%--<a href="" class="blog-tag">开源前端框架</a>--%>
            </div>
        </div>
        <div class="blog-sidebar-widget blog-bor">
            <h2 class="blog-title"><span>这个地方</span></h2>
            <ul class="am-list">
                <li><a href="#">想到再写。。</a></li>
                <li><a href="#">想到再写。。。</a></li>
                <li><a href="#">想到再写。。</a></li>
                <li><a href="#">想到再写。。</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- content end -->



<footer class="blog-footer">
    <div class="am-g am-g-fixed blog-fixed am-u-sm-centered blog-footer-padding">
        <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
            <h3>博客简介</h3>
            <p class="am-text-sm">主要用来记录自己的学习经历<br> 顺便不断完善此网站功能
                <%--<br> 支持响应式，多种布局，包括主页、文章页、媒体页、分类页等<br>嗯嗯嗯，不知道说啥了。外面的世界真精彩<br><br>--%>
                <%--Amaze UI 使用 MIT 许可证发布，用户可以自由使用、复制、修改、合并、出版发行、散布、再授权及贩售 Amaze UI 及其副本。</p>--%>
        </div>
        <div class="am-u-sm-12 am-u-md-4- am-u-lg-4">
            <h3>社交账号</h3>
            <p>
                <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-github am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-weibo am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-reddit am-icon-fw blog-icon blog-icon"></span></a>
                <a href=""><span class="am-icon-weixin am-icon-fw blog-icon blog-icon"></span></a>
            </p>
            <%--<h3>Credits</h3>--%>
            <%--<p>我们追求卓越，然时间、经验、能力有限。Amaze UI 有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。感谢你们！</p>--%>
        </div>
        <%--<div class="am-u-sm-12 am-u-md-4- am-u-lg-4">--%>
            <%--<h1>我们站在巨人的肩膀上</h1>--%>
            <%--<h3>Heroes</h3>--%>
            <%--<p>--%>
            <%--<ul>--%>
                <%--<li>jQuery</li>--%>
                <%--<li>Zepto.js</li>--%>
                <%--<li>Seajs</li>--%>
                <%--<li>LESS</li>--%>
                <%--<li>...</li>--%>
            <%--</ul>--%>
            <%--</p>--%>
        <%--</div>--%>
    </div>
      </footer>





<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.getContextPath()}/static/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/static/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="${pageContext.request.getContextPath()}/static/assets/js/amazeui.min.js"></script>
</body>
</html>
