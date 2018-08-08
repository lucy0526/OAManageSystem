function clickMassage_add()
{
	window.UEDITOR_HOME_URL = "${basePath}js/ueditor/";
	var ue = UE.getEditor('message_editor');
	$('#message_add-dialog').dialog('open');
}
function clickMassage_diaclose()
{
	$('#message_add-dialog').dialog('close');
}

function addMessage()
{
	$('#message_add-dialog').dialog('close');
	$.messager.show({
		title:'提醒',
		msg:'消息添加成功！',
		showType:'slide',
		style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
	});
	var ue = UE.getEditor('message_editor');
	var title = $("#title").val();
	var creater=$("#creater").val();
	var content = ue.getContent();/*$("#content").val();*/
	var accepter = $("#accepter").val();
	
	var message=
	{
			"title":title,
			"creater":creater,
			"content":content,
			"accepter":accepter
			};
	

    var url="MessageServlet?flag=add";
	$.ajax({
		type:'post',
		url:url,
		contentType:"application/json",
		data:JSON.stringify(message),
		success: function (data) {
			var user=data.user;
			 $("#messageDiv").html(JSON.stringify(user));

			var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
			tab.panel('refresh');
			$('#message_add-dialog').dialog('close');
			$.messager.show({
				title:'提醒',
				msg:'消息添加成功！',
				showType:'slide',
				style:{
					right:'',
					top:document.body.scrollTop+document.documentElement.scrollTop,
					bottom:''
				}
			});
        },
        error: function (data) {
			var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
			tab.panel('refresh');
			$('#message_add-dialog').dialog('close');
			$.messager.show({
				title:'提醒',
				msg:'消息添加成功！',
				showType:'slide',
				style:{
					right:'',
					top:document.body.scrollTop+document.documentElement.scrollTop,
					bottom:''
				}
			});
        }
	})

	var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
	tab.panel('refresh');
}
