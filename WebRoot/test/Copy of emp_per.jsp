<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>员工信息</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	</head>

	<body>

		<%--信息修改对话框--%>
		<%--<div id="emp_per_modify-dialog" class="easyui-dialog" title=" " style="width:950px;height:500px;"
     data-options="resizable:true,modal:true,closed:true">

    <form id="mep_per_modify-form" name="form" method="post" enctype="multipart/form-data">
        <div class="p_d_1">
            <div class="p_d_1_1">
                <div class="content_info">
                    <div class="c_crumbs">
                        <div><b></b><strong>职员管理</strong></div>
                    </div>
                    <div class="tableH2">编辑信息</div>
                    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td class="tdBg" width="200px">职位</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">头像</td>
                            <td>
                                <input type="file" name="photo"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">姓名</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">年龄：</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">性别：</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">电话</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">邮箱</td>
                            <td>
                                <input type="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">薪水</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td class="tdBg" width="200px">手机号</td>
                            <td><input type="text"></td>
                        </tr>
                    </table>
                    <div class="tc mt20">
                        <input type="button" class="btnB2" value="保存" onclick=""/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="javascript:emp_per_modifyclo()" class="btnB2" value="关闭"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>--%>


		<%--显示--%>
		<div id="notice_layout" class="easyui-layout" data-options="fit:true">
			<div
				data-options="region:'west',title:'操作',split:false,iconCls:'icon-pencil'"
				style="width: 200px; overflow: hidden" align="center">
				<br />
				<a id="sign" onclick="javascript:emp_info_modify()"
					class="easyui-linkbutton" data-options="iconCls:'icon-heart_add'">信息修改</a>
			</div>
			<div
				data-options="region:'center',title:'管理员信息', fit:true,iconCls:'icon-book_edit'"
				style="padding: 5px; overflow: hidden">

				<form action="EmpServlet?flag=queryByName" method="post">
					<div class="left">
						<!-- 个人资料{ -->
						<div class="left_grzx1">
							<div class="left_grzxbt">
								<h1>
									个人资料
								</h1>
							</div>
							<table width="98%" border="0" align="center">
								<tr>
									<td width="76" height="100" align="center" valign="middle">
										<div class="left-tx">
											<c:choose>
												<c:when test="${!empty null}">
													<img src="${emp.photo}" width="70" height="70" />
												</c:when>
												<c:otherwise>
													<img src="<%=basePath%>images/home/gs09.png" width="70"
														height="70" />
												</c:otherwise>
											</c:choose>
										</div>
									</td>
									<td width="5%">
										<img src="<%=basePath%>images/home/gs10.png" width="4"
											height="59" alt="" />
									</td>
									<td width="60%">
										<table width="95%" border="0" cellpadding="0" cellspacing="0">
											<td colspan="2" style="font-weight: bold; color: #3a7daa;">
												${emp.empName}
											</td>
											<td colspan="2">
												职位：${emp.position}
											</td>
										</table>
									</td>
									<tr />
							</table>
						</div>
						<!-- }个人资料 -->
					</div>
					<!-- }左 -->
					<!-- 右{ -->
					<div class="right" style="width: 600px">
						<div class="left_grzx1">
							<div class="left_grzxbt">
								<h1>
									信息列表
								</h1>
							</div>
							<table width="98%" border="0" align="center">
								<tr>
									<td height="23">
										年龄
									</td>
									<td width="150px">
										${emp.age }
									</td>
								</tr>
								<tr>
									<td height="23">
										性别
									</td>
									<td width="150px">
										${emp.gender }
									</td>
								</tr>
								<tr>
									<td height="23">
										电话
									</td>
									<td width="150px">
										${emp.phone }
									</td>
								</tr>
								<tr>
									<td height="23">
										邮箱
									</td>
									<td width="150px">
										${emp.email}
									</td>
								</tr>
								<%-- <tr>
                            <td height="23">
                                薪水
                            </td>
                            <td width="150px">
                                &lt;%&ndash; ${emp.getWage().getTotalWage() } &ndash;%&gt;
                            </td>
                        </tr>--%>
							</table>
						</div>
					</div>
					<!-- }右-->
					<div class="clear"></div>
				</form>

				<!-- 左{ -->
				<%--<div class="content">
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
                                    <td colspan="2" style=" font-weight:bold; color:#3a7daa;">admin${emp.name}</td>
                                    <td colspan="2">职位：${emp.value}</td>
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

        </div>--%>


				<!-- 尾部{ -->
				<div class="foot">
					版权所有©西南石油大学 2018
				</div>
				<!-- }尾部 -->

			</div>
		</div>

	</body>