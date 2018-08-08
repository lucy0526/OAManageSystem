<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>消息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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

<body >

<%--发送消息对话框--%>
<div id="message_add-dialog" class="easyui-dialog" title=" " style="width:950px;height:300px;"
     data-options="resizable:true,modal:true,closed:true" >
    <form id="form" name="form"  enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs"><div><b></b><strong>消息管理</strong>&nbsp;&nbsp;</div></div>
                    <div class="tableH2">发送消息</div>
                    <table id="baseInfo" width="90%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
                       <tr>
                            <td class="tdBg" width="200px">标题：</td>
                            <td colspan="3"><input type = "text" class = "textnobox" id = "title" /></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">内容：</td>
                            <td colspan="3"><s:textarea id="message_editor" name="info.content" cssStyle="width:90%;height:160px;" /></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="400px" style="collapse: 4">收信人：</td>
                            <td>
                               <input type = "text" class = "textnobox" id  = "accepter" />
                            </td>
                        </tr>
                    </table>

                    <div class="tc mt20">
                        <input type="button"  onclick="javascript:addMessage()" class="btnB2"  value="发送">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button"  onclick="javascript:clickMassage_diaclose()" class="btnB2" value="取消" />
                    </div>
                </div></div></div>
    </form>
</div>


<div id="notice_layout" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'操作',split:false,iconCls:'icon-pencil'" style="width:200px;" align="center">
        <br/>
        <a id="sign" onclick="javascripe:clickMassage_add()" class="easyui-linkbutton" data-options="iconCls:'icon-email'">发送消息</a>
    </div>
    <div data-options="region:'center',title:'您有消息，请及时查看', fit:true,iconCls:'icon-application_side_list'" style="padding:5px;">

        <!-- 左{ -->
        <div class="content">

            <!-- 右{ -->
            <div class="right" style="width: 850px" align="center">
                <div class="left_grzx1">
                    <div class="left_grzxbt">
                        <h1>消息列表</h1>
                    </div>
                    <table width="98%" border="0" align="center" style="overflow: scroll;height: 100px" >
                        <tr>
                            <td height="23">
                                标题
                            </td>
                            <td width="150px">
                                状态
                            </td>
                            <td width="150px">
                                日期
                            </td>
                        </tr>
                        <c:forEach items="${list}" var="entity">
                            <tr>
                                <td height="23">
                                    <c:url var="messageUI" value="messageUI.jsp">
                                        <c:param name="message_id">
                                            ${entity.messId}
                                        </c:param>
                                    </c:url>
                                    <a  href="<%=basePath %>MessageServlet?flag=selectByNoticeId&id=${entity.messId }">
                                            ${entity.title}
                                    </a>
                                </td>
                                <td width="150px">
                             <c:choose>
                             <c:when test="${entity.read == false}">
                             	<p style = "color:red">未读</p>
                             </c:when>
                             <c:otherwise>
                             	<p >已读</p>
                             </c:otherwise>
                             </c:choose>
                                </td>
                                <td width="150px">
                                   ${entity.date }
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <!-- }右-->
            <div class="clear"></div>

        </div>


    </div>
</div>
</body>