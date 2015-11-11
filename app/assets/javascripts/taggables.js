function initDeleteTaggables() {
	$(".delete").on('click', function(e){
		e.preventDefault();
		e.stopImmediatePropagation(); // BLOGBLOGBLOG
		var delete_url = $(this).attr('href')
		if (confirm("Are you sure? This action is not reversible.")){
			$.ajax({url: delete_url, type: 'DELETE'}).done(function() {
				var redirect_url = delete_url.match(/\/.+\//g)[0].slice(0,-1);
	      window.location.replace(redirect_url); // BLOGBLOGBLOG
	    }.bind(this)).fail(function() { // BLOGBLOGBLOG
	      console.log("ERROR: failed to delete");
	    });
		};
	});
};


