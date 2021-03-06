<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 73667
  Date: 2017/10/30
  Time: 18:30
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
    <title>article with sidebar  | Amaze UI Examples</title>
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
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/examples/js/jquery.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/marked.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/prettify.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/raphael.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/underscore.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/sequence-diagram.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/flowchart.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/lib/jquery.flowchart.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/editor.md-master/editormd.min.js"></script>
    <script type="text/javascript">
        var testEditor;
        $(function () {
            testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
                htmlDecode: "style,script,iframe",
                emoji: true,
                taskList: true,
                tex: true, // 默认不解析
                flowChart: true, // 默认不解析
                sequenceDiagram: true, // 默认不解析
                codeFold: true,
            });});
    </script>
</head>

<body id="blog-article-sidebar">
<!-- header start -->
<!-- header end -->
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
<!-- nav end -->
<hr>
<!-- content srart -->
<div class="am-g am-g-fixed blog-fixed blog-content">
    <div class="am-u-md-8 am-u-sm-12">
        <article class="am-article blog-article-p">
            <div class="am-article-hd">
                <h1 class="am-article-title blog-text-center">${article.title}</h1>
                <p class="am-article-meta blog-text-center">
                    <span><a href="#" class="blog-color">article &nbsp;</a></span>-
                    <%--<span><a href="#">@amazeUI &nbsp;</a></span>---%>
                    <span><fmt:formatDate value="${article.createDate}" pattern="yyyy/MM/dd"/> </span>
                </p>
            </div>
            <div id="doc-content" class="am-article-hd">
                <textarea style="display:none;">${article.content}</textarea>
            </div>

        </article>

        <div class="am-g blog-article-widget blog-article-margin">
            <div class="am-u-lg-4 am-u-md-5 am-u-sm-7 am-u-sm-centered blog-text-center">
                <span class="am-icon-tags"> &nbsp;
                <%--</span><a href="#">标签</a> ,--%>
                <c:forEach items="${tags}" var="item">
                    <a href="#">${item}&nbsp;</a>
                </c:forEach>
                 <%--, <a href="#">啦啦</a>--%>
                <hr>
                <a href=""><span class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a>
                <a href=""><span class="am-icon-wechat am-icon-fw blog-icon"></span></a>
                <a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
            </div>
        </div>

        <hr>
        <div class="am-g blog-author blog-article-margin">
            <div class="am-u-sm-3 am-u-md-3 am-u-lg-2">
                <img src="assets/i/f15.jpg" alt="" class="blog-author-img am-circle">
            </div>
            <div class="am-u-sm-9 am-u-md-9 am-u-lg-10">
                <h3><span>作者 &nbsp;: &nbsp;</span><span class="blog-color">xiaowenxuan</span></h3>
                <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>--%>
            </div>
        </div>
        <hr>
        <%--<ul class="am-pagination blog-article-margin">--%>
            <%--<li class="am-pagination-prev"><a href="#" class="">&laquo; 一切的回顾</a></li>--%>
            <%--<li class="am-pagination-next"><a href="">不远的未来 &raquo;</a></li>--%>
        <%--</ul>--%>

        <hr>

        <form class="am-form am-g">
            <h3 class="blog-comment">评论</h3>
            <fieldset>
                <div class="am-form-group am-u-sm-4 blog-clear-left">
                    <input type="text" class="" placeholder="名字">
                </div>
                <div class="am-form-group am-u-sm-4">
                    <input type="email" class="" placeholder="邮箱">
                </div>

                <div class="am-form-group am-u-sm-4 blog-clear-right">
                    <input type="password" class="" placeholder="网站">
                </div>

                <div class="am-form-group">
                    <textarea class="" rows="5" placeholder="一字千金"></textarea>
                </div>

                <p><button type="submit" class="am-btn am-btn-default">发表评论</button></p>
            </fieldset>
        </form>

        <hr>
    </div>

    <div class="am-u-md-4 am-u-sm-12 blog-sidebar">
        <div class="blog-sidebar-widget blog-bor">
            <h2 class="blog-text-center blog-title"><span>About ME</span></h2>
            <img src="https://tse4-mm.cn.bing.net/th?id=OIP.qHEEa9hIlZUENTXdxG_J1gEKDq&p=0&pid=1.1" alt="about me" class="blog-entry-img" >
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
<script src="${pageContext.request.getContextPath()}/static/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="${pageContext.request.getContextPath()}/static/assets/js/amazeui.min.js"></script>
<!-- <script src="assets/js/app.js"></script> -->
</body>
</html>
