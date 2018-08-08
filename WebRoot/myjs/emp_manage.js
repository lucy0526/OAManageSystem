function clickEmp_add() {
    $('#emp_add-dialog').dialog('open');
}
function clickEmp_addclo() {
    $('#emp_add-dialog').dialog('close');
}
function clickEmp_ok() {
    var json = {
        type: "post",
        url: "../EmpServlet?flag=add",
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        error: function () {
            /* alert("添加失败");
             $('#emp_add-dialog').dialog('close');*/
        },
        success: function (msg) {
            /* alert("添加成功");
             $('#emp_add-dialog').dialog('close');
             $('#empList-table').datagrid('getPager').pagination('refresh');*/
//        	$("#emp_add-form").ajaxForm(json);
            /*    $('#emp_add-dialog').dialog('close');
             $('#empList-table').datagrid('reload');*/

        }
    };
    $("#emp_add-form").ajaxForm(json);
    $('#emp_add-dialog').dialog('close');
    $('#empList-table').datagrid('reload');


    /*$.ajax({
     cache: true,
     type: "POST",
     url:"../EmpServlet?flag=add",
     data:$('#emp_add-form').serialize(),// 序列化表单
     async: false,
     error: function(request) {
     alert("Connection error");
     },
     success: function(data) {
     //alert("添加成功");
     //$('#emp_add-dialog').dialog('close');
     $('#empList-table').datagrid('reload');
     }
     });*/
}

function clickEmp_massage() {
    var json = {
        type: "post",
        url: "Servlet?flag=add",
        dataType: "json",
        error: function () {
            alert("加载失败");
        },
        success: function (msg) {

            $('#emp_massage-dialog').dialog('refresh');
        }
    }
    $("#empForm").ajaxSubmit(json);
    $('#emp_massage-dialog').dialog('open');
}

function doSearch() {
    var id = $("#empId_seach").val();
    self.location = "../EmpServlet?flag=queryById&manage=yes&id=" + id;


    /*var id = $("#empId_seach").val();

    $("#empList-table").datagrid("reload",{
        "empId": id
    });*/
   /* $.ajax({
        type: "POST",
        //url: '../EmpServlet?flag=searchempsBy_id&id=' + selectedRow.empId + '&img=${emp.photo}',
        url: '../EmpServlet?flag=searchempsBy_id&id='+id,
        //data: {"empId": selectedRow.empId},
        //dataType:"json",
        success: function (data) {
            $('#empList-table').datagrid('reload');
            *//*if(data.msg == "success"){
             alert("删除成功");
             $('#empList-table').datagrid('reload');
             $('#empList-table').datagrid('clearSelections');
             }*//*
        },
        error: function () {
            alert("删除失败");
        }
    });*/
}

function clickEmp_dele() {
    $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
        if (r) {

            var selectedRow = $('#empList-table').datagrid('getSelected');

            $.ajax({
                type: "POST",
                url: '../EmpServlet?flag=del&id=' + selectedRow.empId + '&img=${emp.photo}',
                data: {"empId": selectedRow.empId},
                //dataType:"json",
                success: function (data) {
                    $('#empList-table').datagrid('reload');
                    /*if(data.msg == "success"){
                     alert("删除成功");
                     $('#empList-table').datagrid('reload');
                     $('#empList-table').datagrid('clearSelections');
                     }*/
                },
                error: function () {
                    alert("删除失败");
                }
            });
        }
    });

}

//datagrid显示
function show_datagrid() {

    $("#empList-table").datagrid({
        url: '../EmpServlet?flag=queryAll',
        columns: [[
            {field: 'empId', title: '员工编号', width: 100, align: 'center'},
            {field: 'empName', title: '姓名', width: 100, align: 'center'},
            {field: 'position', title: '职位', width: 100, align: 'center'},
            {field: ' ', title: '操作', width: 100, align: 'center', formatter: att_showOperate}
        ]],
        pagination: true
    });

    /*var pager = $('#empList-table').datagrid('getPager');    // get the pager of datagrid
    pager.pagination({
        onBeforeRefresh: function () {
            return true;
        }
    });*/
}
function att_showOperate() {
    //var selectedRow = $('#empList-table').datagrid('getSelected');
    return " <a href='javascript:emp_manage_detail()'>详情</a>&nbsp;&nbsp;<a onClick='clickEmp_dele()'>删除</a> ";
}
function emp_manage_detail() {
    var selectedRow = $('#empList-table').datagrid('getSelected');
    self.location = "../EmpServlet?flag=queryById&manage=yes&id=" + selectedRow.empId;
}
function mep_per_modify() {
    document.getElementById("mep_per_modify-form").submit();
    alert("修改成功！");
    $.messager.show({
        title: '提醒',
        msg: '修改成功！',
        showType: 'slide',
        showType: 'show',
        style: {
            right: '',
            top: document.body.scrollTop + document.documentElement.scrollTop + 100,
            bottom: ''
        }

    });
}
function roll_back(){
    window.history.back(-1);
}