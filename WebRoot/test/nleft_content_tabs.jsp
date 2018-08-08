<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/test/index.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<div    id="direction" class="easyui-tabs" style="width:300px;height:200px;"
        data-options="
                     fit:true,
                     tabPosition:'left',
                     width:20
        "
        >

    <div title="公告"
         data-options="iconCls:'icon-flag_purple',
                        href:'<%=basePath%>jsp/notice.jsp'
         "
         style="padding:10px;">
        content2
    </div>

    <div title="基本信息/打卡"
         data-options="iconCls:'icon-user_business_boss'"
         style="overflow:auto;padding:10px;">
    </div>

    <div title="工资" data-options="iconCls:'icon-flag_purple'" style="padding:10px;">
        content2
    </div>

</div>
