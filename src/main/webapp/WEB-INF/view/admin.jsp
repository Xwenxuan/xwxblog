<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 73667
  Date: 2017/11/5
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%--<title>BLOG index with sidebar & slider  | Amaze UI Examples</title>--%>
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
    <title>我的博客</title>
</head>
<body>
    <table class="am-table am-table-bordered am-table-radius">
        <thead>
            <th>序号</th>
            <th>操作</th>
            <th>作者</th>
            <th>时间</th>
            <th>标题</th>
            <th>分类</th>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="item" varStatus="index">
                <tr>
                    <td>${index.index+1}</td>
                    <td><a href="${pageContext.request.getContextPath()}/a/blogWrite/edit?sid=${item.sid}" class="am-btn am-btn-primary">编辑</a></td>
                    <td>${fns:getUserName(item.uid)}</td>
                    <td>${item.updateDate}</td>
                    <td>${item.title}</td>
                    <td>${fns:getCategoryById(item.cid)}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
