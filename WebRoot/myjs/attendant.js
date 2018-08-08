//datagrid显示
function show_attendantListd(){
    $("#attList").datagrid({
        url:'../AttendanceServlet?flag=queryallUserbytime',
        method:'get',
        columns:[[
            {field:'emp_id',title:'员工编号',width:100,align:'center'},
            {field:'name',title:'姓名',width:100,align:'center'},
            {field:'startdate',title:'签到时间',width:100,align:'center'},
            {field:'enddate',title:'签退时间',width:100,align:'center'}
        ]],
        pagination:true
    });
}
function attList_showOperate() {
    return " <a href='javascript:emp_manage_detail()'>详情</a>&nbsp;&nbsp;<a onClick='clickEmp_dele()'>删除</a> ";
}
function clickAttendant_sign(){
    $('#attendant_sign-dialog').dialog('open');
}
function clickAttendant_leave(){
    $('#attendant_leave-dialog').dialog('open');
}
function clickAttendant_edit(){
    $('#attendant_edit-dialog').dialog('open');
}
function clickAttendant_dele(){
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
        if (r){
        }
    });
}
function sign(){
    var id = $("#sign_id").val();
    $.ajax({
        url:"../AttendanceServlet?flag=sign&id="+id,
        //data:{"id":id},//向action传入参数
        type:"post",
        //dataType:"json",//返回数据类型
        success:function(data){
            /*var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
            tab.panel('refresh');*/
            $('#attList').datagrid('reload');
            $('#attendant_sign-dialog').dialog('close');
            $.messager.show({
                title:'提醒',
                msg:'签到成功！',
                showType:'slide',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });
        },
        error:function(){alert("请输入！");}
    });

}
function sign_out(){
    var id = $("#sign_out_id").val();
    $.ajax({
        url:"../AttendanceServlet?flag=leave&id="+id,
        //data:{"id":id},//向action传入参数
        type:"post",
        //dataType:"json",//返回数据类型
        success:function(data){
            /*var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
            tab.panel('refresh');*/
            $('#attList').datagrid('reload');
            $('#attendant_leave-dialog').dialog('close');
            $.messager.show({
                title:'提醒',
                msg:'签退成功！',
                showType:'slide',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });
        },
        error:function(){alert("请输入！");}
    });

}