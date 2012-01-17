jQuery(function($){
  var regex1 = /github/;
  var regex2 = /http/;
  
  $('#nominee')
    .focus()
    .keyup(function(event) {
      var input_text = $(event.target).val();
      

      // TODO disable http & github from submitting the form
      if ( regex1.test(input_text) ||  regex2.test(input_text) ) {
        $('#error').html("Just enter the GitHub username.")
        $('#results').empty().fadeOut();
      } else {
        if (input_text.length > 2 ) {
          $('#yes_match')
            .load('/nominees/?q=' + input_text, function(event) {
              $('#yes_match').append($('<span>'));
            })
            .show()
        } else {
          $('#results')
            .fadeOut()
            .empty();
        }
      }
      return false;
    });

    $("#vote form").submit( function(){
      var input_text = $("input#nominee").val();
      if (  regex1.test(input_text) || regex2.test(input_text) ) {
        return false;
      }
    })
});