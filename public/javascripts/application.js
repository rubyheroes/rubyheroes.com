jQuery(function($){

  // ----- FitText ----- //

  $('.nominate-label').fitText(1.3, {maxFontSize: '34px'});

  // ----- Past Hero Toggle ----- //

  var site = $('.site');

  $('body').on('click', '.is-reminiscing .content', function(e) {
    site.toggleClass('is-reminiscing');
  }).on('keydown.modal', function(e) {
    if (e.which == 27) {
      site.removeClass('is-reminiscing');
    }
  });
  $('.heroes-toggle').on('click', function(e) {
    site.toggleClass('is-reminiscing');
    e.preventDefault();
    e.stopPropagation();
  });

  // ----- Nomination Form ----- //

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
          $('.nominate').addClass('is-nominating');
        } else {
          $('#results')
            .fadeOut()
            .empty();
          $('.nominate').removeClass('is-nominating');
        }
      }
      return false;
    });

    $("#vote form").submit( function(){
      var input_text = $("input#nominee").val();
      if (  regex1.test(input_text) || regex2.test(input_text) ) {
        return false;
      }
    });
});
