//JQuery Dom ready callback
jQuery(function($){
  
  $('#site_url')
    .focus()
    .keyup(function(event) {
      var input_text = $(event.target).val();
      if (input_text.length > 2) {
        $('#yes_match').load('/sites/search?site_url=' + input_text);
      } else {
        $('#yes_match').empty();
      }
      $('#nomination_submit').html('Nominate <strong>' + input_text + '</strong>')
      return false;
    })
  ;
  var heroes = $("#heroes");
  var oheight = $("#y2008").appendTo(heroes);
  var ohnine = $("#y2009").appendTo(heroes);
  
  oheight.load("/heroes/year?year=2008");
  ohnine.load("/heroes/year?year=2009");
});