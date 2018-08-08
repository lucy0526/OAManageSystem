<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>工作考核</title>
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

<%--缺勤人员添加--%>
<div id="work_miss_add-dialog" class="easyui-dialog" title=" " style="width:950px;height:500px;overflow: hidden"
     data-options="resizable:true,modal:true,closed:true">
    <form id="work_miss-form" name="form" method="post" >
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs">
                        <div><b></b><strong>工作管理</strong>&nbsp;&nbsp;</div>
                    </div>
                    <div class="tableH2">缺勤人员添加</div>
                    <table id="baseInfo" width="90%" align="center" class="list" border="0" cellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td class="tdBg" width="200px">职员编号</td>
                            <td><input id="miss_add_id" class="textnobox" type="text" name="id" list="#infoTypeMap"/></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">缺勤时长</td>
                            <td colspan="3"><input id="miss_add_time" class="textnobox" name="time" cssStyle="width:90%"/></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">日期</td>
                            <td colspan="3"><input id="miss_add_date" class="easyui-datebox" name="date"
                                                   data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
                            </td>
                        </tr>
                        <s:hidden name="info.state" value="1"></s:hidden>
                        <s:hidden name="strTitle"/>
                    </table>

                    <div class="tc mt20">
                        <input type="button" class="btnB2" onclick="add_miss_ok()" value="保存"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="javascript:add_miss_clo()" class="btnB2" value="取消"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<%--加班人员添加--%>
<div id="work_att_add-dialog" class="easyui-dialog" title=" " style="width:950px;height:500px;overflow: hidden"
     data-options="resizable:true,modal:true,closed:true">
    <form id="work_att_add-form" name="form" method="post" >
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs">
                        <div><b></b><strong>工作管理</strong>&nbsp;&nbsp;</div>
                    </div>
                    <div class="tableH2">加班人员添加</div>
                    <table width="90%" align="center" class="list" border="0" cellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td class="tdBg" width="200px">职员编号</td>
                            <td><input id="over_add_id" class="textnobox" type="text" name="id" list="#infoTypeMap"/></td>
                            <%--<td class="tdBg" width="200px">姓名</td>
                            <td><input class="textnobox" type="text" name="name"/></td>--%>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">加班时长</td>
                            <td colspan="3"><input id="over_add_time" class="textnobox" name="time" cssStyle="width:90%"/></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">日期</td>
                            <td colspan="3"><input id="over_add_date" class="easyui-datebox" name="date"
                                                   data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
                            </td>
                        </tr>
                        <s:hidden name="info.state" value="1"></s:hidden>
                        <s:hidden name="strTitle"/>
                    </table>

                    <div class="tc mt20">
                        <input type="button" class="btnB2" onclick="add_over_ok()" value="保存"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="javascript:add_over_clo()" class="btnB2" value="取消"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<%--显示--%>
<div id="cc" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'east',iconCls:'icon-thumb_down',title:'迟到/缺勤职员',split:false,collapsible:false" style="width:590px;padding:20px;background:#eee;">
        <form name="form1" action="<%=basePath%>Wservlet?flag=misstimebyid" method="post"  style="width: 500px">
            <div class="p_d_1">
                <div class="p_d_1_1">
                    <div class="content_info" style="width: 450px">
                        <div class="c_crumbs"><div><b></b><strong>职员列表</strong></div> </div>
                        <div class="search_art">
                            <%--<li>
                                员工编号：<input type="text" name="username" cssClass="s_text" id="empId"  cssStyle="width:100px;"/>
                            </li>
                            <li><input type="submit" class="s_button" value="搜 索" onclick="doSearch()"/></li>--%>
                            <li style="float:right;">
                                <a id="miss_emp_add" onclick="javascripe:clickWork_miss_add()" class="easyui-linkbutton" data-options="iconCls:'icon-user_accept16'">增加</a>
                               <%-- <a id="miss_emp_del" onclick="javascripe:work_miss_delAll()" class="easyui-linkbutton" data-options="iconCls:'icon-user_reject16'">删除</a>--%>
                            </li>
                        </div>
                        <div class="t_list">
                            <table class="easyui-datagrid" id="missList"
                                   data-options="url:'../Wservlet?flag=queryalluserbytime_miss',method:'get',pagination:true">
                                <thead>
                                <tr>
                                    <th data-options="field:'misstimeId',width:60,align:'center'">员工编号</th>
                                    <th data-options="field:'name',width:70,align:'center'">姓名</th>
                                    <th data-options="field:'time',width:100,align:'center'">缺勤时长</th>
                                    <th data-options="field:'date',width:110,align:'center'">日期</th>
                                    <%--<th data-options="field:'operate',width:60,align:'center',formatter:work_manage_showOperate,pageSize:4,
                                            pageList:[4,10]">操作</th>--%>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>

    <div data-options="region:'center',title:'加班职员',iconCls:'icon-thumb_up'" style="padding:20px;background:#eee;">
        <form name="form1" action="<%=basePath%>Wservlet?flag=overtimebyid" method="post" style="width: 500px">
            <div class="p_d_1">
                <div class="p_d_1_1">
                    <div class="content_info" style="width: 450px">
                        <div class="c_crumbs"><div><b></b><strong>职员列表</strong></div> </div>
                        <div class="search_art">
                            <%--<li>
                                员工编号：<input type="text" name="username" cssClass="s_text" id="username"  cssStyle="width:100px;"/>
                            </li>
                            <li><input type="submit" class="s_button" value="搜 索" onclick="doSearch()"/></li>--%>
                            <li style="float:right;">
                                <a id="emp_add" onclick="javascripe:clickWork_att_add()" class="easyui-linkbutton" data-options="iconCls:'icon-user_accept16'">增加</a>
                                <%--<a id="emp_del" onclick="javascripe:work_att_delAll()" class="easyui-linkbutton" data-options="iconCls:'icon-user_reject16'">删除</a>--%>
                            </li>
                        </div>
                        <div class="t_list">
                            <table class="easyui-datagrid" id="overList"
                                   data-options="url:'../Wservlet?flag=queryalluserbytime_over',method:'get',pagination:true">
                                <thead>
                                <tr>
                                    <th data-options="field:'overtimeId',width:60,align:'center'">员工编号</th>
                                    <th data-options="field:'name',width:70,align:'center'">姓名</th>
                                    <th data-options="field:'time',width:110,align:'center'">加班时长</th>
                                    <th data-options="field:'date',width:100,align:'center'">日期</th>
                                    <%--<th
                                            data-options="field:'operate',width:60,align:'center',formatter:work_manage_showOperate,pageSize:4,
                                            pageList:[4,10]
                                            ">
                                        操作</th>--%>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>

</body>