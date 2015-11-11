$(document).ready(function() {
	initLogin();

	if ($(".delete-tag").length) {
    initDeleteTags();
  };

  if ($(".add-tag").length || $(".remove-tag").length) {
    initAddRemoveTags();
  };
	
	if ($(".delete").length) {
    initDeleteTaggables();
  };

  if ($(".text-field-input").length || $(".text-area-input").length) {
    addFocus();
  };

  if ($("pre").length) {
    SyntaxHighlighter.all();
  };

});




