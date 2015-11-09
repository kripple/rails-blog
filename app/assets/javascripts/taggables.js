function initDeleteTaggables() {
	$(".delete").on('click', function(e){
		e.preventDefault();
		e.stopImmediatePropagation(); // BLOGBLOGBLOG
		if (confirm("Are you sure? This action is not reversible.")){
			$.ajax({url: url, type: 'DELETE'}).done(function() {
				var url = $(this).attr('href').match(/\/.+\//g)[0].slice(0,-1);
	      window.location.replace(url); // BLOGBLOGBLOG
	    }.bind(this)).fail(function() { // BLOGBLOGBLOG
	      console.log("ERROR: failed to delete");
	    });
		};
	});
};


