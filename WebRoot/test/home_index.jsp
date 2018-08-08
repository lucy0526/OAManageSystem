<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>管理系统</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/icon1.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        .easyui-accordion ul {
            list-style-type: none;
            padding: 0px;
            margin: 0px;
        }
        .easyui-accordion ul li {
            margin: 0px;
            line-height: 25px;
        }
        .easyui-accordion ul li div {
            border: 1px solid #99BBE8;
            background: #d0f3ff;
            cursor: default;
            padding-left:20px;
        }
    </style>
<%--
    <script type="text/javascript">
        function openApp(url) {
            window.top.location = url;
        }
        function delCookie() {
            top.document.cookie = "TopNode=;expires=Fri, 31 Dec 1999 23:59:59 GMT;";
        }
    </script>--%>
</head>

<body scroll="no">
<div id="notice_layout" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'east',title:'West',split:false" style="width:100px;" align="center"></div>
    <div data-options="region:'center',title:'center title', fit:true" style="padding:5px;background:#eee;">

    </div>
</div>
</body>
</html>
