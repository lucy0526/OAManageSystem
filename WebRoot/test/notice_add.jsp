<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title></title>
  <link href="<%=basePath%>css/skin1.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="notice_add-window" class="easyui-window" title="My Window" style="width:600px;height:400px"
     data-options="iconCls:'icon-save',modal:true">
  搜索
  <form id="form" name="form" action="${basePath }nsfw/info_add.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
      <div class="p_d_1_1">
        <div class="content_info">
          <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;新增信息</div></div>
          <div class="tableH2">新增信息</div>
          <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
            <tr>
              <td class="tdBg" width="200px">信息分类：</td>
              <td><s:select name="info.type" list="#infoTypeMap"/></td>
              <td class="tdBg" width="200px">来源：</td>
              <td><s:textfield name="info.source"/></td>
            </tr>
            <tr>
              <td class="tdBg" width="200px">信息标题：</td>
              <td colspan="3"><s:textfield name="info.title" cssStyle="width:90%"/></td>
            </tr>
            <tr>
              <td class="tdBg" width="200px">信息内容：</td>
              <td colspan="3"><s:textarea id="editor" name="info.content" cssStyle="width:90%;height:160px;" /></td>
            </tr>
            <tr>
              <td class="tdBg" width="200px">备注：</td>
              <td colspan="3"><s:textarea name="info.memo" cols="90" rows="3"/></td>
            </tr>
            <tr>
              <td class="tdBg" width="200px">创建人：</td>
              <td>
                <s:property value="#session.SYS_USER.name"/>
                <s:hidden name="info.creator" value="%{#session.SYS_USER.name}"></s:hidden>
              </td>
              <td class="tdBg" width="200px">创建时间：</td>
              <td>
                <s:date name="info.createTime" format="yyyy-MM-dd HH:mm"/>
                <s:hidden name="info.createTime"/>
              </td>
            </tr>
            <s:hidden name="info.state" value="1"></s:hidden>
            <s:hidden name="strTitle"/>
          </table>

          <div class="tc mt20">
            <input type="submit" class="btnB2" value="保存" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
          </div>
        </div></div></div>
  </form>
</div>
</body>
</html>
