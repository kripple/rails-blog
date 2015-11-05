function initLogin() {
	var elem = $("#copyright");
	elem.on('click',function(e){
		e.preventDefault();
		var target = $(this)
		var url = target.attr('href')
		$.ajax(url).done(function(data){
			elem.after(data);
			elem.remove();
		}).fail(function(){
			console.log("Failed to retrieve data");
		});
	});

};