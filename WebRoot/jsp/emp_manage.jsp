<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户管理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link href="<%=basePath%>css/skin1.css" rel="stylesheet" type="text/css" />
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

<%--添加职员--%>
<div id="emp_add-dialog" class="easyui-dialog" title=" " style="width:950px;height:500px;"
     data-options="resizable:true,modal:true,closed:true">
    <form id="emp_add-form" name="form" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs"><div><b></b><strong>职员管理</strong></div></div>
                    <div class="tableH2">新增职员</div>
                    <font style="color: #5251d4;width: 30px" >头像：</font>
                    <td><input type="file" name="photo"></td>
                    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
                        <tr>
                            <td class="tdBg" width="200px">职位</td>
                            <td><input type="text" name="position"> </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">姓名</td>
                            <td><input type="text" name="empName"> </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">密码：</td>
                            <td><input type="text" name="password"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">性别：</td>
                            <td><input type="text" name="gender"> </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">年龄</td>
                            <td>
                                <input type="text" name="age">
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">电子邮箱：</td>
                            <td><input type="text" name="email"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">手机号：</td>
                            <td><input type="text" name="phone"></td>
                        </tr>

                        <tr>
                            <td class="tdBg" width="200px">薪水</td>
                            <td><input type="text" name="wage"> </td>
                        </tr>
                    </table>
                    <div class="tc mt20">
                        <input type="submit"  onclick="javascript:clickEmp_ok()" class="btnB2" value="确定" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button"  onclick="javascript:clickEmp_addclo()" class="btnB2" value="返回" />
                    </div>
                </div></div></div>
    </form>
</div>
<%--职员详情--%>
<div id="emp_massage-dialog" class="easyui-dialog" title=" " style="width:950px;height:250px;overflow: hidden"
     data-options="resizable:true,modal:true,closed:true" >
    <div class="content">
        <div class="left">
            <!-- 个人资料{ -->
            <div class="left_grzx1">
                <div class="left_grzxbt">
                    <h1>个人资料</h1>
                </div>
                <table width="98%" border="0" align="center">
                    <tr>
                        <td width="76" height="100" align="center" valign="middle">
                            <div class="left-tx">
                                <c:choose>
                                    <c:when test="${!empty null}">
                                        <img src="#" width="70" height="70"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="<%=basePath%>images/home/gs09.png" width="70" height="70"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td width="5%"><img src="<%=basePath%>images/home/gs10.png" width="4" height="59" alt=""/>
                        </td>
                        <td width="60%">
                            <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                <td colspan="2" style=" font-weight:bold; color:#3a7daa;">${emp.empName}</td>
                                <td colspan="2">职位：${emp.position}</td>
                            </table>
                        </td>
                    <tr/>
                </table>
            </div>
            <!-- }个人资料 -->
        </div>
        <!-- }左 -->
        <!-- 右{ -->
        <div class="right" style="width: 600px">
            <div class="left_grzx1">
                <div class="left_grzxbt">
                    <h1>信息列表</h1>
                </div>
                <table width="98%" border="0" align="center">
                    <tr>
                        <td height="23">
                            年龄
                        </td>
                        <td width="150px">
                        </td>
                    </tr>
                    <tr>
                        <td height="23">
                            性别
                        </td>
                        <td width="150px">
                        </td>
                    </tr>
                    <tr>
                        <td height="23">
                            电话
                        </td>
                        <td width="150px">
                        </td>
                    </tr>
                    <tr>
                        <td height="23">
                            邮箱
                        </td>
                        <td width="150px">
                        </td>
                    </tr>
                    <tr>
                        <td height="23">
                            薪水
                        </td>
                        <td width="150px">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- }右-->
        <div class="clear"></div>

    </div>
</div>

<%--显示--%>
        <form name="emp_manage-form" method="post" enctype="multipart/form-data">
            <div class="p_d_1">
                <div class="p_d_1_1">
                    <div class="content_info">
                        <div class="c_crumbs"><div><b></b><strong>职员管理</strong></div> </div>
                        <div class="search_art">
                            <li>
                                员工编号：<input type="text" name="empId" cssClass="s_text" id="empId_seach"  cssStyle="width:100px;"/>
                            </li>
                            <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                            <li style="float:right;">
                                <a id="emp_add" onclick="javascripe:clickEmp_add()" class="easyui-linkbutton" data-options="iconCls:'icon-user_add'">增加</a>
                                <%--<a id="emp_del" onclick="javascripe:clickEmp_dele()" class="easyui-linkbutton" data-options="iconCls:'icon-user_delete'">删除</a>--%>
                            </li>
                        </div>

                        <div class="t_list">
                            <%--<table class="empList-table" id="empList-table">  </table>--%>
                            <table class="easyui-datagrid" id="empList-table"
                                   data-options="url:'../EmpServlet?flag=queryAll',pagination:true">
                                <thead>
                                <tr>
                                    <th data-options="field:'empId',width:100,align:'center'">员工编号</th>
                                    <th data-options="field:'empName',width:100,align:'center'">姓名</th>
                                    <th data-options="field:'position',width:100,align:'center'">职位</th>
                                    <th data-options="field:'op',width:100,align:'center',
                                     formatter:test_op">操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    <script type="text/javascript">
        function att_showOperate() {
            //var selectedRow = $('#empList-table').datagrid('getSelected');
            return " <a href='javascript:emp_manage_detail()'>详情</a>&nbsp;&nbsp;<a onClick='clickEmp_dele()'>删除</a> ";
        }
        function test_op(value,row,index){
            return " <a href='javascript:emp_manage_detail()'>详情</a>&nbsp;&nbsp;<a onClick='clickEmp_dele()'>删除</a> ";
        }
    </script>
</body>