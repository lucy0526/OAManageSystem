<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>员工信息</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
		%>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>themes/icon.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>themes/icon1.css">
		<link href="<%=basePath%>css/skin1.css" rel="stylesheet"
			type="text/css" />
		<link href="<%=basePath%>css/text.css" rel="stylesheet"
			type="text/css" />

		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>


		<script type="text/javascript" charset="utf-8"
			src="<%=basePath%>js/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8"
			src="<%=basePath%>js/ueditor/ueditor.all.min.js"> </script>
		<script type="text/javascript" charset="utf-8"
			src="<%=basePath%>js/ueditor/lang/zh-cn/zh-cn.js"></script>

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
		<%--<div id="notice_layout" class="easyui-layout" data-options="fit:true">
			<!--<div
				data-options="region:'west',title:'操作',split:false,iconCls:'icon-pencil'"
				style="width: 200px; overflow: hidden" align="center">
				<br />
				<a id="sign" class="easyui-linkbutton" data-options="iconCls:'icon-heart_add'" href="../EmpServlet?flag=queryById_modify&id="+${emp.empId}">信息修改</a>
			</div>
		}

			-->
			<div
				data-options="region:'center',title:'管理员信息', fit:true,iconCls:'icon-book_edit'"
				style="padding: 5px; overflow: hidden">

				<form action="EmpServlet?flag=queryByName" method="post">
					<div class="left">
						<!-- 个人资料{ -->
						<div class="left_grzx1">
							<div class="left_grzxbt">
								<h1>
									资料
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
							<table width="40%" border="0" align="center">
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
							</table>
						</div>
					</div>
					<!-- }右-->
					<div class="clear"></div>
				</form>
				<a id="sign" href="<%=basePath%>EmpServlet?flag=queryById_modify&id=${emp.empId}">信息修改</a>
				&lt;%&ndash;<!-- 尾部{ -->
				<div class="foot">
					版权所有©西南石油大学 2018
				</div>
				<!-- }尾部 -->&ndash;%&gt;
			</div>
		</div>--%>

		<div id="cc" class="easyui-layout" style="width:600px;height:400px;overflow: hidden"
			 data-options="fit:true">
			<div data-options="region:'west',title:'资料',split:false,iconCls:'icon-pencil',collapsible:false"
				 style="width: 400px; overflow: hidden" align="center">
				<div class="left_grzx1">
					<div class="left_grzxbt">
						<h1>
							资料
						</h1>
					</div>
					<table width="98%" border="0" align="center">
						<tr>
							<td width="76" height="100" align="center" valign="middle">
								<div class="left-tx">
								 	<img src="<%=basePath%>images/emp_photo/${emp.photo }" width="70" height="70" />
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
			</div>
			<div data-options="region:'center',title:'详情'" style="padding:5px;background:#eee;">
				<div class="right" style="width: 600px">
					<div class="left_grzx1">
						<div class="left_grzxbt">
							<h1>
								信息列表
							</h1>
						</div>
						<table width="40%" border="0" align="center">
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
						</table>
					</div>
				</div>
				<%--<a id="sign" href="<%=basePath%>EmpServlet?flag=queryById_modify&id=${emp.empId}">信息修改</a>--%>
				<a id="btn" onclick="javascript:queryById_modify('${emp.empId}')" class="easyui-linkbutton" data-options="iconCls:'icon-search'">信息修改</a>
				<a id="btn" onclick="javascript:roll_back()" class="easyui-linkbutton" data-options="iconCls:'icon-page_back'">返回</a>
			</div>
		</div>
	<script type="text/javascript">
		function queryById_modify(id){
			self.location='<%=basePath%>EmpServlet?flag=queryById_modify&id='+id;
		}
	</script>


	</body>