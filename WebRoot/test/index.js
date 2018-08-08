$(function(){
	clickAccordion();
});
function clickAccordion(){
	$(".accordion-a").click(function(){
		var title = $(this).text();
		var url = $(this).attr("rel");
		$("#tabs").tabs("add",{
			title:title,
			href:url,
			closable:true
		});
	});
}















