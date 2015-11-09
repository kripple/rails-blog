$(document).ready(function() {
	initLogin();

	if ($(".delete-tag").length) {
    initDeleteTags();
  };

  if ($(".add-tag").length || $(".remove-tag").length) {
    initAddRemoveTags();
  };
	
	

});




