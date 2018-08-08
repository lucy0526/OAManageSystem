<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = "../";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>layout</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css"
          href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="../themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="../themes/icon1.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript"
            src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="../js/easyui-lang-zh_CN.js"></script>
</head>

<body>
搜索
${basePath}aa
<%=basePath%>
<div id="tt" class="easyui-tabs" style="width:500px;height:250px;">
    <div title="Tab1" style="padding:20px;display:none;">
        tab1
    </div>
    <div title="Tab2" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">
        tab2
    </div>
    <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">
        tab3
    </div>
</div>

</body>
</html>
