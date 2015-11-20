function initLogin() {
	$("#copyright").on('click',function(e){
		e.preventDefault();
		var target = $(this)
		var url = target.attr('href')
		$.ajax(url).done(function(data){
			$("#footer").after(data);
			$(".password").focus();
		}).fail(function(){
			console.log("Failed to retrieve data");
		});
	});

};