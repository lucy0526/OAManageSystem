<%@ page language="java" pageEncoding="UTF-8" %>
<!-- 头部{ -->
<table border="0" align="center" cellpadding="0" cellspacing="0" background="<%=basePath%>images/home/xingzheng.png"
       class="top">
    <tr>
        <td width="26" height="106">&nbsp;</td>
        <td width="416" height="110" align="left" valign="middle">
        </td>
        <td width="135">&nbsp;</td>
        <td width="418">
            <%--<object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="86">
                &lt;%&ndash;<param name="movie" value="<%=basePath%>images/home/flash.swf"/>&ndash;%&gt;
                <param name="quality" value="high"/>
                <param name="wmode" value="transparent"/>
                <param name="swfversion" value="6.0.65.0"/>
                <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                <param name="expressinstall" value="Scripts/expressInstall.swf"/>
                <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                <!--[if !IE]>-->
                &lt;%&ndash;<object type="application/x-shockwave-flash" data="<%=basePath%>images/home/flash.swf"
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
                </object>&ndash;%&gt;
                <!--<![endif]-->
            </object>--%>
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
                    <td align="left"><a><b></b><font color="#00008b">欢迎您，${sessionScope.SYS_USER.name }</font></a></td>
                    <td align="center"><img src="<%=basePath%>images/home/help.png" width="12" height="17"/></td>
                    <td align="left"><a href="javascript:void(0)"><font color="#fff8dc">帮助</font></a></td>
                    <td width="17" align="center"><img src="<%=basePath%>images/home/exit.png" width="14" height="14"/>
                    </td>
                    <td align="left" valign="middle"><a href="<%=basePath%>sys/login_logout.action" target="_top"><font
                            color="#fff8dc">退出</font></a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- }头部 -->
