<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录</title>
		<link href="<%=basePath%>css/login.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet" type="text/css"
			  href="<%=basePath%>themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			  href="<%=basePath%>themes/icon.css">
		<link rel="stylesheet" type="text/css"
			  href="<%=basePath%>themes/icon1.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
		<script type="text/javascript"
				src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>

		<script type="text/javascript">
			$.extend($.fn.validatebox.defaults.rules, {
				check : {
					validtor : function(value){
						if("${error}" == null){
							return true;
						}
					},
					message : "${error}"
				}
			});
		</script>
		<script type="text/javascript">
        function logins(){
			document.forms[0].action="<%=basePath%>/LoginServlet";
            document.forms[0].submit();
        }

        function setClean(){
            document.getElementById("account").value = "";
            document.getElementById("pwd").value = "";
        }
        //全部刷新，防止在子模块显示
        if(window != window.parent){
            window.parent.location.reload(true);
        }
    </script>
	</head>

	<body scroll="no">

		<form id="ff" method="post">
			<div id="lo_tf">
				<div class="outside">

					<div class="head">
						<table width="1000" height="60" border="0" align="center"
							cellpadding="0" cellspacing="0">
							<tr>
								<td width="840" align="left">
									<img src="<%=basePath%>images/login/form_03.png" width="332"
										height="47" />
								</td>
								<td align="center">
									&nbsp;&nbsp;
									<a href="#"></a>
								</td>
							</tr>
						</table>
					</div>

					<div class="main2">
						<div class="content">
							<div class="youbian">
								<table width="251" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="12">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td height="45" align="left"></td>
									</tr>
									<tr>
										<td height="13">
											&nbsp;
											<span><div height=20 valign="middle"
													style="padding-left: 18px">
													<font color="red" id="errMsg">
														${error}
													</font>
												</div>
											</span>
										</td>
									</tr>
									<tr>
										<td height="40">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td height="32" align="left">
														<span style="color: #767676; font-size: 14px;">帐号:</span>
													</td>
												</tr>
											</table>

											<table width="100%" height="39" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td background="<%=basePath%>images/login/shuru_03.png"
														width="">
														<table width="100%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td align="left">
																	<input id="empName" class="easyui-validatebox" type="text"
																		name="empName" />

																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td height="10">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td height="32" align="left">
														<span style="color: #767676; font-size: 14px;">密码:</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="40">
											<table width="100%" height="39" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td background="<%=basePath%>images/login/shuru_03.png"
														width="">
														<table width="100%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td align="left">
																	<input id="password" name="password" type="password"
																		class="easyui-validatebox" />
																	<script type="text/javascript">
																		$("#account").validatebox({
																		 required : true,
																		 validType : ['lenth[1, 30]']
																		 });
																		 $("#pwd").validatebox({
																		 required : true,
																		 validType : ['lenth[1, 30]', 'check']
																		 });
																	</script>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td height="10">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td height="40">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td align="right">
														<a href="#" onclick="javascript:logins();"><img
																src="<%=basePath%>images/login/form_15.png" width="95"
																height="37" />
														</a>
													</td>
													<td width="18">
														&nbsp;
													</td>
													<td align="left">
														<img src="<%=basePath%>images/login/form_17.png" width="95"
															height="37" onclick="setClean()" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
					<div class="foot">
						版权所有&nbsp;|&nbsp;西南石油大学&nbsp;&nbsp;2018年
					</div>
				</div>
			</div>
		</form>


	</body>
</html>