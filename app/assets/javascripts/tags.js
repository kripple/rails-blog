function initDeleteTags() {
	$(".delete-tag").on('click', function(e){
		var tag = $(this);
		var id = getValue("tag-id-",tag.attr('class'))
		$.ajax({url: ('/tags/' + id), method: 'delete'}).done(function(data){
			if (data.length == 0){
				tag.remove();
			} else {
				alert(data);
			};
		}).fail(function(){
			console.log("Failed to delete tag.");
		});
	});

};


