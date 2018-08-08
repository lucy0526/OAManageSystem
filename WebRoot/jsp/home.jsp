<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>管理系统</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        Integer id = 2;
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

    <%--<script type="text/javascript">
        $(function(){
            clickAccordion();
        });
        function clickAccordion(){
            $(".accordion-a").click(function(){
                var title = $(this).text();
                var url = $(this).attr("rel");
                if($("#tabs").tabs("exists", title)){
                    $("#tabs").tabs('select', title);
                }else{
                    $("#tabs").tabs("add",{
                        title:title,
                        href:url,
                        closable:true
                    });
                }
            });
        }
    </script>--%>
</head>

<body>

<div
        id="layoutID"
        class="easyui-layout"
        data-options="fit:true"
        scroll="no"
        style="overflow-y:hidden;"
        >

    <!-- 北边 -->
    <div
            data-options="region:'north',
                          <%--href:'<%=basePath%>jsp/top.jsp',--%>
                          border:false

                            "
            style="height:111.9px;width: 1262px">

        <!-- 头部{ -->
        <table border="0" align="center" cellpadding="0" cellspacing="0"
               background="<%=basePath%>images/home/xingzheng.png"
               class="top">
            <tr>
                <td width="26" height="106">&nbsp;</td>
                <td width="416" height="110" align="left" valign="middle">
                </td>
                <td width="135">&nbsp;</td>
                <td width="418">
                    <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="86">
                        <%--<param name="movie" value="<%=basePath%>images/home/flash.swf"/>--%>
                        <param name="quality" value="high"/>
                        <param name="wmode" value="transparent"/>
                        <param name="swfversion" value="6.0.65.0"/>
                        <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                        <param name="expressinstall" value="Scripts/expressInstall.swf"/>
                        <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                        <!--[if !IE]>-->
                        <object type="application/x-shockwave-flash" data="<%=basePath%>images/home/flash.swf"
                                width="380" height="86">
                            <!--<![endif]-->
                            <param name="quality" value="high"/>
                            <param name="wmode" value="transparent"/>
                            <param name="swfversion" value="6.0.65.0"/>
                            <param name="expressinstall" value="Scripts/expressInstall.swf"/>
                            <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                            <div>
                                <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>

                                <p>
                                    <a href="http://www.adobe.com/go/getflashplayer">
                                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                                             alt="获取 Adobe Flash Player" width="112" height="33"/>
                                    </a>
                                </p>
                            </div>
                            <!--[if !IE]>-->
                        </object>
                        <!--<![endif]-->
                    </object>
                </td>
                <td width="300" align="right" valign="top">
                    <table width="350" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="17" height="9"></td>
                            <td width="66" height="9"></td>
                            <td width="120" height="5"></td>
                            <td width="17" height="9"></td>
                            <td width="36" height="9"></td>
                            <td width="17"></td>
                            <td width="46"></td>
                        </tr>
                        <tr>
                            <td align="center"></td>
                            <td align="left"></td>
                            <td align="left"><a><b></b><font color="#f8f8ff"
                                                             style="font-weight:bold;">欢迎您，${empName }</font></a>
                            </td>
                            <td align="center"><img src="<%=basePath%>images/home/help.png" width="12" height="17"/>
                            </td>
                            <td align="left"><a href="javascript:void(0)"><font color="#fff8dc">帮助</font></a></td>
                            <td width="17" align="center"><img src="<%=basePath%>images/home/exit.png" width="14"
                                                               height="14"/>
                            </td>
                            <td align="left" valign="middle"><a href="<%=basePath%>/LogoutServlet"
                                                                target="_top"><font
                                    color="#fff8dc">退出</font></a></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- }头部 -->


    </div>

    <!-- 中间 -->
    <div data-options="region:'center'">
        <div
                id="center"
                class="easyui-layout"
                data-options="fit:true"
                scroll="no"
                style="overflow-y:hidden;"

                >
            <!-- 西 -->
            <div
                    data-options="region:'west',
                                  <%--href:'<%=basePath%>jsp/left.jsp',--%>
                                  title:'导航菜单',
                                  <%--split:true--%>
                                  "
                    style="width:168px;overflow: hidden;"><%--让滑块消失overflow: hidden;--%>

                <div id="direction" class="easyui-accordion"
                     style="width:180px;height:800px;"<%--宽高必须要，不然显示会有问题--%>
                     data-options="
                                     <%--fit:true,--%>
                                     border:false
                                 ">
                    <div data-options="
                                            title:'选项管理'
                                 ">

                        <ul>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>NoticeServlet" style="cursor:pointer;">公告</a>
                                </div>
                            </li>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>EmpServlet?flag=queryById&id=${emp.empId }" style="cursor:pointer;">我的信息</a>
                                </div>
                            </li>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>jsp/attendant.jsp" style="cursor:pointer;">打卡</a>
                                </div>
                            </li>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>MessageServlet?flag=selectByEmpId&id=${emp.empId}" style="cursor:pointer;">消息</a></div>
                            </li>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>/jsp/emp_manage.jsp" style="cursor:pointer;">员工管理</a></div>
                            </li>
                            <li>
                                <div><a class="accordion-a" rel="<%=basePath%>jsp/work_manage.jsp" style="cursor:pointer;">工作考核</a></div>
                            </li>
                        </ul>
                    </div>

                </div>

            </div>

            <!-- 中 -->
            <div
                    data-options="region:'center',
                                  title:'选项详情',
                                  split:true
                    ">
                <div id="tabs" class="easyui-tabs"
                <%--style="width:300px;height:200px;"--%>
                     data-options="
                     fit:true,
                     border:false"
                        >
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
