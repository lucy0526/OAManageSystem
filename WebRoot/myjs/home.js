$(function () {
    clickAccordion();
});
function clickAccordion() {
    $(".accordion-a").click(function () {
        var title = $(this).text();
        var url = $(this).attr("rel");
        if ($("#tabs").tabs("exists", title)) {
            $("#tabs").tabs('select', title);
        } else {
            $("#tabs").tabs("add", {
                title: title,
                //href:url,
                content: '<iframe src="' + url + '" style="width:100%;height:100%"></iframe>',
                closable: true
            });
        }
        /*if (title == "员工管理") {
            show_datagrid();
        }*/

        var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
        tab.panel('refresh');
        /*if(title=="我的信息"){
         var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
         tab.panel('refresh');
         }
         */
        /*if(title=="打卡"){
         show_attendantListd();
         var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
         tab.panel('refresh');
         }*/
        /*
         if(title=="工作考核"){
         var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
         tab.panel('refresh');
         }
         if(title=="公告"){
         var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
         tab.panel('refresh');
         }
         if(title=="消息"){
         var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
         tab.panel('refresh');
         }*/
    });
}