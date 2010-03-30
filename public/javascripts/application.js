//JQuery Dom ready callback
jQuery(function($){
  
  $('#site_url')
    .focus()
    .keyup(function(event) {
      var input_text = $(event.target).val();
      if (input_text.length > 2) {
        $('#yes_match').css({display:"block"}).load('/sites/search?site_url=' + input_text, function(event) {$('#yes_match').append($('<span>'));});
      } else {
        $('#yes_match').css({display:"none"}).empty();
      }
      $('#nomination_submit').html('Nominate <strong>' + input_text + '</strong>')
      return false;
    })
  ;
});