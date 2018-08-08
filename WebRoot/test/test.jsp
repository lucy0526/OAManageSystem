<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/8/1
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%
    String path = request.getContextPath();
//    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String basePath = "../";
%>
<html>
<head>
    <title></title>
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
    <script type="text/javascript">
        $(function () {
            clickAccordion();
        });
        function clickAccordion() {
            $(".accordion-a").click(function () {
                alert("k");
            });
        }
    </script>
</head>
<body>
<ul>
    <li>
        <div><a class="accordion-a" rel="../jsp/notice.jsp" style="cursor:pointer;">公告</a></div>
    </li>
    <li>
        <div><a class="accordion-a" rel="Role/index.jsp" style="cursor:pointer;">员工信息/打卡</a></div>
    </li>
    <li>
        <div><a class="accordion-a" rel="Menu/index.jsp" style="cursor:pointer;">工资管理</a></div>
    </li>
    <li>
        <div><a class="accordion-a" rel="Node/index.jsp" style="cursor:pointer;">咨询管理</a></div>
    </li>
</ul>
</body>
</html>
