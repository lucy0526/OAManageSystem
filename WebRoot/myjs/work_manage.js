
function work_manage_showOperate(){
    return "<a href='work_miss_del()'>删除</a> ";
}

function clickWork_miss_add(){
    $('#work_miss_add-dialog').dialog('open');
}

//关闭 添加对话框
function add_miss_clo(){
    $('#work_miss_add-dialog').dialog('close');
}
function add_over_clo(){
    $('#work_att_add-dialog').dialog('close');
}


function work_miss_del(){
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
        if (r){
        }
    });
}
function work_miss_delAll(){
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
        if (r){
        }
    });
}
function clickWork_att_add(){
    $('#work_att_add-dialog').dialog('open');
}
function work_att_addclo(){
    $('#work_att_add-dialog').dialog('close');
}
function work_att_del(){
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
        if (r){
        }
    });
}
function work_att_delAll(){
    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
        if (r){
        }
    });
}
function add_miss_ok(){
    var miss_add_id = $("#miss_add_id").val();
    var miss_add_time=$("#miss_add_time").val();
    var date = $('#miss_add_date').datebox('getValue');
    var notice=
    {
        "id":miss_add_id,
        "time":miss_add_time,
        "date":date
    };
    var url="../Wservlet?flag=addleavetime";
    $.ajax({
        type:'post',
        url:url,
        contentType:"application/json",
        data:JSON.stringify(notice),
        success: function(data) {
            $('#work_miss_add-dialog').dialog('close');
            $('#missList').datagrid('reload');
            $.messager.show({
                title:'提醒',
                msg:'添加成功！',
                showType:'slide',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });
        },
        error: function (data) {
            $('#work_miss_add-dialog').dialog('close');
            $('#missList').datagrid('reload');
            $.messager.show({
                title:'提醒',
                msg:'添加成功！',
                showType:'slide',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
        });
    }
    });
    /*var json = {
        type : "post",
        url : "../Wservlet?flag=addleavetime",
        dataType : "json",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        error : function(){
            alert("添加失败");
        },
        success : function(msg){
            alert("添加成功");
        }
    };
    $("#work-miss-form").ajaxForm(json);
    $('#work_miss_add-dialog').dialog('close');
    $('#missList').datagrid('reload');*/
}

function add_over_ok(){
    var over_add_id = $("#over_add_id").val();
    var over_add_time=$("#over_add_time").val();
    var date = $('#over_add_date').datebox('getValue');
    var notice=
    {
        "id":over_add_id,
        "time":over_add_time,
        "date":date
    };


    var url="../Wservlet?flag=addovertime";
    $.ajax({
        type:'post',
        url:url,
        contentType:"application/json",
        data:JSON.stringify(notice),
        success: function (data) {
            $('#work_att_add-dialog').dialog('close');
            $('#overList').datagrid('reload');
            $.messager.show({
                title:'提醒',
                msg:'添加成功！',
                showType:'slide',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });

        },
        error: function (data) {
            $('#work_att_add-dialog').dialog('close');
            $('#overList').datagrid('reload');
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
    })
    /*$.ajax({
        type: 'post',
        url: '../Wservlet?flag=addovertime',
        data: $("work_att_add-form").serialize(),
        success: function(data) {
            $('#work_att_add-dialog').dialog('close');
            $('#overList').datagrid('reload');
        }
    });*/
    /*var json = {
        type : "post",
        url : "../Wservlet?flag=addovertime",
        dataType : "json",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        error : function(){
            alert("添加失败");
        },
        success : function(msg){
            alert("添加成功");
        }
    };
    $("#work-over-form").ajaxForm(json);
    $('#work_att_add-dialog').dialog('close');
    $('#overList').datagrid('reload');*/
}