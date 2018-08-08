<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/test/index.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<font size="3px" color="#191970" style="background-color: #62adfe; background-size: 180px; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><p/>
<font size="3px" color="#191970" style="background-color: #62adfe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工信息/打卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><p/>
<font size="3px" color="#191970" style="background-color: #62adfe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工资&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><p/>

<div    id="direction" class="easyui-accordion"
        data-options="
                     fit:true,
                     selected:1
        "
        >

<div title="公告" id="notice"
     style="overflow:auto;padding:10px;"
         data-options="iconCls:'icon-flag_purple',
                        &lt;%&ndash;collapsible:false&ndash;%&gt;
         " >
    </div>
    <div title="基本信息/打卡"
         data-options="iconCls:'icon-user_business_boss',
                        &lt;%&ndash;collapsible:false&ndash;%&gt;
                        "
         style="overflow:auto;padding:10px;">
    </div>

    <div title="工资"
         style="overflow:auto;padding:10px;"
         data-options="iconCls:'icon-flag_purple',
                        &lt;%&ndash;collapsible:false&ndash;%&gt;
                        "
         style="padding:10px;">
    </div>
    
    
    <script type="text/javascript">

    </script>
</div>
