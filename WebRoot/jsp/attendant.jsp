<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>打卡</title>
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

<%--打卡签到对话框--%>
<div id="attendant_sign-dialog" class="easyui-dialog" title=" " style="width:700px;height:250px;overflow: hidden;"
     data-options="resizable:true,modal:true,closed:true" align="center">
    <form id="attendant_sign-form" name="form" action="${basePath }nsfw/info_add.action" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info" style="width: 600px">
                    <div class="c_crumbs"><div><b></b><strong>打卡管理</strong>&nbsp;&nbsp;</div></div>
                    <div class="tableH2">职员签到</div>
                    <table id="baseInfo" width="400px" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
                        <tr>
                            <td class="tdBg" width="100px" align="center" >职员编号</td>
                            <td width="100px" align="center" ><input id="sign_id" type="text"></td>
                        </tr>
                        <s:hidden name="info.state" value="1"></s:hidden>
                        <s:hidden name="strTitle"/>
                    </table>

                    <div class="tc mt20">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="sign()" class="btnB2" value="签到" />
                    </div>
                </div></div></div>
    </form>
</div>


<%--打卡签退对话框--%>
<div id="attendant_leave-dialog" class="easyui-dialog" title=" " style="width:700px;height:250px;overflow: hidden;"
     data-options="resizable:true,modal:true,closed:true" align="center">
    <form id="attendant_leave-form" name="form" action="${basePath }nsfw/info_add.action" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info" style="width: 600px">
                    <div class="c_crumbs"><div><b></b><strong>打卡管理</strong>&nbsp;&nbsp;</div></div>
                    <div class="tableH2">职员签退</div>
                    <table width="400px" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
                        <tr>
                            <td class="tdBg" width="100px" align="center">职员编号</td>
                            <td width="100px" align="center"><input id="sign_out_id" type="text"></td>
                        </tr>
                        <s:hidden name="info.state" value="1"></s:hidden>
                        <s:hidden name="strTitle"/>
                    </table>

                    <div class="tc mt20">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" class="btnB2"  onclick="sign_out()" value="签退" />
                    </div>
                </div></div></div>
    </form>
</div>

<%--打卡编辑对话框--%>

<%--打卡签到对话框--%>
<div id="attendant_edit-dialog" class="easyui-dialog" title=" " style="width:700px;height:250px;overflow: hidden;"
     data-options="resizable:true,modal:true,closed:true" align="center">
    <form id="attendant_adit-form" name="form" action="${basePath }nsfw/info_add.action" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info" style="width: 600px">
                    <div class="c_crumbs"><div><b></b><strong>打卡管理</strong>&nbsp;&nbsp;</div></div>
                    <div class="tableH2">打卡详情编辑</div>
                    <table width="400px" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
                        <tr>
                            <td class="tdBg" width="100px" align="center">签到时间</td>
                            <td width="100px" align="center"><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="100px" align="center">签退时间</td>
                            <td width="100px" align="center"><input type="text"></td>
                        </tr>
                    </table>

                    <div class="tc mt20">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" class="btnB2" value="确认" />
                    </div>
                </div></div></div>
    </form>
</div>

<%--显示--%>
<div id="attendant_layout" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',iconCls:'icon-calendar_view_day',title:'日历',split:false" style="width:200px;" align="center">
        <br/>
        <div id="calendar" class="easyui-calendar" style="width:180px;height:180px;" align="center"></div>
    </div>
    <div data-options="region:'center',title:'一日之计在于晨',fit:true,iconCls:'icon-award_star_silver_1'" style="padding:5px;">


        <form name="att-form" method="post" enctype="multipart/form-data">

            <div class="p_d_1">
                <div class="p_d_1_1">
                    <div class="content_info">
                        <div class="c_crumbs"><div><b></b><strong>签到表</strong></div> </div>
                        <div class="search_art">
                            <%--<li>
                                员工编号：<input type="text" name="user.name" cssClass="s_text" id="userName"  cssStyle="width:100px;"/>
                            </li>
                            <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>--%>
                            <li style="float:right;">
                                <a id="sign" onclick="javascripe:clickAttendant_sign()" class="easyui-linkbutton" data-options="iconCls:'icon-door_in'">签到</a>
                                <a id="leave" onclick="javascripe:clickAttendant_leave()" class="easyui-linkbutton" data-options="iconCls:'icon-door_out'">签退</a>
                            </li>
                        </div>
                       <div class="t_list">
                            <table class="easyui-datagrid" id="attList" data-options="url:'../AttendanceServlet?flag=queryallUserbytime',method:'get',pagination:true">
                            	<thead>
                            		<tr>
                            			<th data-options="field:'emp_id',width:80,align:'center'">员工编号</th>
                            			<th data-options="field:'name',width:100,align:'center'">姓名</th>
                            			<th data-options="field:'startdate',width:150,align:'center'">签到时间</th>
                            			<th data-options="field:'enddate',width:150,align:'center'">签退时间</th>
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