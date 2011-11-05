//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.getJSON('/tags', function(data) {
  $('.autocomplete_tags').autocomplete( data, {
    autoFill: true,
    multiple: true,
    multipleSeparator: ', '
  });
} );
