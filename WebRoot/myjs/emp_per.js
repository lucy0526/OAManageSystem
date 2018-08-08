function clickEmp_per_modify(){
    $.ajax({
        cache: true,
        type: "POST",
        url:"../EmpServlet?flag=add",
        data:$('#mep_per_modify-form').serialize(),// 序列化表单
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
            //加载数据
        }
    });
    $('#emp_per_modify-dialog').dialog('open');
}
function emp_per_modifyclo(){
    $('#emp_per_modify-dialog').dialog('close');
}
function emp_info_modify(id){
    self.location='EmpServlet?flag=queryById_modify&id='+id;
    //window.open("../EmpServlet?flag=queryById_modify&id="+id);
}