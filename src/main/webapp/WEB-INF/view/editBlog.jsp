<%--
  Created by IntelliJ IDEA.
  User: 73667
  Date: 2017/11/6
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 73667
  Date: 2017/10/30
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
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
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/editor.md-master/examples/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/editor.md-master/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
</head>
<body id="blog">
<div class="am-collapse am-topbar-collapse" id="blog-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
        <li class="am-active"><a href="lw-index.html">首页</a></li>
        <li><a href="#">技术杂谈</a></li>
        <li><a href="#">生活笔记</a></li>
        <li><a href="#">发表博客</a></li>
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
<%--<button id="btn1">测试</button>--%>
<form action="${pageContext.request.getContextPath()}/a/blogWrite/submit?sid=${articleSave.sid}">
    <div class="">
        标题</br>
        <%--<select class="" name="titleCategory">--%>
        <%--<option value="">请选择</option>--%>
        <%--<option value="">原创</option>--%>
        <%--<option value="">翻译</option>--%>
        <%--<option value="">转载</option>--%>
        <%--</select>--%>
        <input type="text" class="am-input-lg" style="width:500px" name="title" id="title" value="${articleSave.title}" required>
        <input type="hidden" value="${articleSave.sid}" name="sid">
    </div>
    <div id="layout">
        <header>
            <%--<h1>Simple example</h1>--%>
            文章内容
        </header>
        <div id="my-editormd">



        <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;">
    ${articleSave.content}
</textarea>
            <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>


        </div>
    </div>
    <div class="">
        文章标签</br>
        <input type="text" class="am-input-lg" style="width:500px" name="tag" id="tag" value="${articleSave.tag}" required>
    </div>
    <div class="">
        分类</br>
        <input type="text" class="am-input-lg" style="width:500px" name="category" id="category" value="${fns:getCategoryById(articleSave.cid)}" required>
    </div>
    <div class="">

    </div>
    <div class="">
        <input type="submit" class="am-btn am-btn-primary" name="button" value="发表">

    </div>
</form>
<form action="${pageContext.request.getContextPath()}/a/blogWrite/save?sid=${articleSave.sid}" id="save">
    <input type="hidden" name="title" id="titleSave">
    <textarea style="display:none" name="content" id="contentSave"></textarea>
    <input type="hidden" name="sid" id="sid">
    <input type="hidden" name="tag" id="tagSave">
    <input type="hidden" name="category" id="categorySave">
    <button class="am-btn am-btn-primary" id="saveBtn">保存</button>
</form>
<script src="${pageContext.request.getContextPath()}/static/editor.md-master/examples/js/jquery.min.js"></script>
<script src="${pageContext.request.getContextPath()}/static/editor.md-master/editormd.min.js"></script>
<script src="${pageContext.request.getContextPath()}/static/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.getContextPath()}/static/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="${pageContext.request.getContextPath()}/static/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("my-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "${pageContext.request.getContextPath()}/static/editor.md-master/lib/",
            imageUpload    : true,
            imageFormats   : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${pageContext.request.getContextPath()}/a/article/upload",
            saveHTMLToTextarea : true,
        });

        $("#saveBtn").on('click',function(){
            $("#titleSave").val($("#title").val());
            $("#contentSave").val($("#my-editormd-html-code").val());
            $("#tagSave").val($("#tag").val());
            $("#categorySave").val($("#category").val());
            $("#sid").val(${articleSave.sid})
            $("#save").submit();
        });
        /*
         // or
         testEditor = editormd({
         id      : "test-editormd",
         width   : "90%",
         height  : 640,
         path    : "../lib/"
         });
         */
    });
</script>
<%--<script type="text/javascript">--%>
<%----%>
<%--</script>--%>

</body>
</html>


