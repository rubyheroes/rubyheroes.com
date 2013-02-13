jQuery(function($){

  // ----- FitText ----- //

  $('.nominate-label').fitText(1.3, {maxFontSize: '34px'});

  // ----- Past Hero Toggle ----- //

  var site = $('.site');

  $('body').on('click', '.is-reminiscing .content, .heroes-close', function(e) {
    site.removeClass('is-reminiscing');
  }).on('keydown.modal', function(e) {
    if (e.which == 27) {
      site.removeClass('is-reminiscing');
    }
  });
  $('.heroes-toggle').on('click', function(e) {
    site.toggleClass('is-reminiscing');
    $('html, body').delay(750).animate({ scrollTop: 0 }, "slow");
    e.preventDefault();
    e.stopPropagation();
  });

  // ----- Past Hero Nav ----- //

  var heroes_nav = $('.heroes-nav li');

  heroes_nav.on('click', function(e) {
    var new_collection = $(this);
    var index = heroes_nav.index(new_collection);
    new_collection.addClass('is-selected').siblings().removeClass('is-selected');
    $('.heroes-collection').removeClass('is-selected').eq(index).addClass('is-selected');
    e.preventDefault();
  });

  // ----- Nomination Form ----- //

  var regex1 = /github.com/;
  var regex2 = /http:/;
  
  $('#nominee')
    .focus()
    .keyup(function(event) {
      var input_text = $(event.target).val();
      
      // TODO disable http & github from submitting the form
      if ( regex1.test(input_text) ||  regex2.test(input_text) ) {
        $('#error').html("Only include the GitHub username");
        $('#results').empty().hide();
      } else {
        if (input_text.length > 2 ) {
          $('#yes_match')
            .load('/nominees/?q=' + input_text, function(event) {
              $('#yes_match').append($('<span>'));
            })
            .show()
          $('.nominate').addClass('is-nominating');
        } else {
          $('#results').empty().hide();
          $('#error').empty().hide();
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
