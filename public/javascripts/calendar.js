$('document').ready(function(){

	$("#month_calendar li").click(function(){
		date = $(this).find('span').attr('class');
		current = window.location.pathname
		window.location.href = current + "/" + date
	});
	
});