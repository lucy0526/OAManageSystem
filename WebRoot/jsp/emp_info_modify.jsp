<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>员工信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>themes/icon1.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/home.css">
    <link href="<%=basePath%>css/skin1.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/text.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>


    <script type="text/javascript" charset="utf-8" src="<%=basePath%>js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript" src="<%=basePath%>myjs/home.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/notice.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/emp_per.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/attendant.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/message.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/emp_manage.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/work_manage.js"></script>

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
            padding-left: 20px;
        }
    </style>
</head>

<body>

<%--信息修改对话框--%>

    <form id="mep_per_modify-form" name="form" method="post" enctype="multipart/form-data" action="EmpServlet?flag=edit&id=${emp.empId }">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info" align="center">
                    <div class="c_crumbs">
                        <div><b></b><strong>职员管理</strong></div>
                    </div>
                    <div class="tableH2">编辑信息</div>
                    <input type="hidden" name="empId" value="${emp.empId }"> 
                    <tr>
                            <font style="color: #5251d4;width: 30px" >头像：</font>
                        <td><img src="<%=basePath%>images/emp_photo/${emp.photo }" width="50px" height="50px"></td>
                        <td>
                                <input type="file" name="photo" />
                            </td>
                    </tr>
                    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td class="tdBg" width="200px">职位</td>
                            <td><input type="text" value="${emp.position }" name="position"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">姓名</td>
                            <td><input id="empName" name="empName" type="text" value="${emp.empName}"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">密码</td>
                            <td><input id="password" name="password" type="text" value="${emp.password}"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">年龄：</td>
                            <td><input name="age" type="text" value="${emp.age}"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px" >性别：</td>
                            <td><input name="gender" type="text" value="${emp.gender}"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">电话</td>
                            <td><input name="phone" type="text" value="${emp.phone}"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">邮箱</td>
                            <td>
                                <input name="email" type="text" value="${emp.email}">
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">手机号</td>
                            <td><input name="phone" type="text" value="${emp.phone}"></td>
                        </tr>
                    </table>
                    <div class="tc mt20">
                        <input type="button" class="btnB2" onclick="mep_per_modify()" value="保存"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="javascript:roll_back()" class="btnB2" value="返回"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>