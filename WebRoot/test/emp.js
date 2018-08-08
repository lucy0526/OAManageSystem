function showImage(value, rows, index){
	return "<img width='100px' height='100px' src='../' + rows.emp>"
}
function showOperate(value, rows, index){
	return "<a href='javascript:del("+rows.emp_id+")'>删除</a>"
}
function del(emp_id){
	$.get("Servlet", {
		"flag" : 'del',
		"emp_id" : "emp_id"
	}, function(data){
		if(data == 1){
			alert("刪除成功");
			$("#empTable").datagrid('reload');
		}else{
			alert('刪除失敗');
		}
	});
}
function delAll(){
	var rows = $("#tableEmp").datagrid("getChecked");
	if(rows.length>0){
		for(var index in rows){
			del(rows[index].emp_id);
		}
	}else{
		alert("请选择数据！");
	}
}

function showAdd(){
	$("#add_emp").dialog("open");
}
function addEmp(){
	var json = {
		type : "post",
		url : "Servlet?flag=add",
		dataType : "json",
		error : function(){
			$("#add_user_error").show();
		},
		success : function(msg){
			$("#emp_add").dialog('close');
			$("#empTable").datagrid('reload');
		}
	};
	$("#empForm").ajaxSubmit(json);
}