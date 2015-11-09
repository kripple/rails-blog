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

function initAddRemoveTags() {
	
	// for all tags in current-tags div, remove corresponding tag in available-tags div
	$('.current-tags').children().each(function(index, object){
		var id = getValue("tag-id-", object.className);
		$('.available-tags').children('.tag-id-' + id).remove();
	});

	$('.available-tags').on('click', '.add-tag', function(e){
		// move tag from available-tags to current-tags
		var tag = $(this);
		tag.addClass('remove-tag');
		tag.removeClass('add-tag');
		$('.current-tags').append(tag);
	});

	$('.current-tags').on('click', '.remove-tag', function(e){
		// move tag from current-tags to available-tags 
		var tag = $(this);
		tag.addClass('add-tag');
		tag.removeClass('remove-tag');
		$('.available-tags').append(tag);
	});

	$(".submit-button").on('click', function(e){
		var tags = [];
		$('.current-tags').children().each(function(index, object){
			var id = getValue("tag-id-", object.className);
			tags.push(id);
		});
		$('#tag_id').val(tags)	
	});

};


