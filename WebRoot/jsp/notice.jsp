<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>公告</title>
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

<body>

<div id="notice_add-dialog" class="easyui-dialog" title=" " style="width:950px;height:400px;"
     data-options="resizable:true,modal:true,closed:true">
    <form id="form" name="form" action="${basePath }nsfw/info_add.action" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs">
                        <div><b></b><strong>公告发布管理</strong>&nbsp;&nbsp;</div>
                    </div>
                    <div class="tableH2">新增公告</div>
                    <table id="baseInfo" width="90%" align="center" class="list" border="0" cellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td class="tdBg" width="200px">公告分类：</td>
                            <td><input class="textnobox" type="text" id="notice_type" name="notice_type"
                                       list="#infoTypeMap"/></td>
                            <td class="tdBg" width="200px">来源：</td>
                            <td><input class="textnobox" type="text" id="notice_source" name="notice_source"/></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">公告标题：</td>
                            <td colspan="3"><input class="textnobox" id="title" name="title" cssStyle="width:90%"/></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">公告内容：</td>
                            <td colspan="3" width="200" height="250">
                                <textarea id="content" name="content" style="height: 200px;width: 600px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">备注：</td>
                            <td colspan="3"><textarea class="textnobox" name="info.memo" cols="90" rows="3"></textarea>
                            </td>
                        </tr>
                        <s:hidden name="info.creator" value="%{#session.SYS_USER.name}"></s:hidden>
                        <s:hidden name="info.state" value="1"></s:hidden>
                        <s:hidden name="strTitle"/>
                    </table>

                    <div class="tc mt20">
                        <a href="#" id="xiongsender" onclick="sb()">保存</a>
                        <!--<input type="submit" class="btnB2" value="保存"/>
                        -->
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="javascript:clickNotice_diaclose()" class="btnB2" value="取消"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<div id="notice_layout" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'操作',split:false,iconCls:'icon-pencil'" style="width:200px;" align="center">
        <br/>
        <a id="sign" onclick="javascript:clickNotice_add()" class="easyui-linkbutton"
           data-options="iconCls:'icon-page_white_text'">添加公告</a>
    </div>
    <div data-options="region:'center',title:'今日公告', fit:true,iconCls:'icon-book_edit'"
         style="padding:5px;background:#eee;">
        <div align="center " style="text-align: center; width: 100%;height: 100%;overflow: hidden">
            <!-- 标题 -->
            <div style="text-align: center; width: 100%;">
                <h1>${notice.title}</h1>
            </div>
            <hr/>
            <!-- 时间、作者 -->
            <div style="text-align: center; width: 100%;color:#ccc;font-size:12px;">
                信息分类：${notice.noticeId}&nbsp;&nbsp;&nbsp;&nbsp;
                创建人：admin&nbsp;&nbsp;&nbsp;&nbsp;
                创建时间：${notice.date}
            </div>
            <div style="text-align: center; width: 100%;padding:8px;">
                ${notice.content}
            </div>
        </div>
    </div>
</div>

</body>