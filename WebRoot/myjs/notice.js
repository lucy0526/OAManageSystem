function clickNotice_add(){
    window.UEDITOR_HOME_URL = "${basePath}js/ueditor/";
    var ue = UE.getEditor('editor');//jsp页面中填入富文本编辑器 的标签 id
    $('#notice_add-dialog').dialog('open');

}
function clickNotice_diaclose(){
    $('#notice_add-dialog').dialog('close');
}
function sb()
{
	$('#notice_add-dialog').dialog('close');
	$.messager.show({
		title:'提醒',
		msg:'公告添加成功！',
		showType:'slide',
		style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
	});

	var notice_type = $("#notice_type").val();
	var notice_source=$("#notice_source").val();
	var title=$("#title").val();
	var content=/*ue.getContent();*/$("#content").val();
	var notice=
	{
			"notice_type":notice_type,
			"notice_source":notice_source,
			"title":title,
			"content":content
			};
    var url="NoticeServlet?flag=add";
	$.ajax({
		type:'post',
		url:url,
		contentType:"application/json",
		data:JSON.stringify(notice),
		success: function (data) {
             //alert("ss");
			var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
			tab.panel('refresh');
			$('#notice_add-dialog').dialog('close');
			$.messager.show({
				title:'提醒',
				msg:'公告添加成功！',
				showType:'slide',
				style:{
					right:'',
					top:document.body.scrollTop+document.documentElement.scrollTop,
					bottom:''
				}
			});

		},
        error: function (data) {
			var user=data.user;
			$("#messageDiv").html(JSON.stringify(user));
			//alert("ss");
			var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
			tab.panel('refresh');
			$('#notice_add-dialog').dialog('close');
			$.messager.show({
				title:'提醒',
				msg:'公告添加成功！',
				showType:'slide',
				style:{
					right:'',
					top:document.body.scrollTop+document.documentElement.scrollTop,
					bottom:''
				}
			});
        }
	});
	var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
	tab.panel('refresh');
	//alert("k");
}