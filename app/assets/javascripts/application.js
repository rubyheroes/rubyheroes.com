//= require jquery
//= require jquery_ujs
//= require modernizr-2.6.2.min
//= require jquery.fittext
//= require jquery.ba-bbq
//= require_self
//= require_tree .

var enterKey = 13;
var upArrow = 38;
var downArrow = 40;

var focusSuggestions = function(event) {
  console.log("focus")
  var suggestions = $("#yes_match li");

  // if we have any autocomplete matches
  if (suggestions.length > 0) {

    if (event.keyCode == upArrow) {
      suggestions.children(":first").trigger("focus");

      event.preventDefault();
    } else if (event.keyCode == downArrow) {
      suggestions.children(":last").trigger("focus");

      event.preventDefault();
    }
  }
};

var interceptSubmit = function(event){
  console.log("intercept")
  if (event.keyCode == enterKey) {
    submitSuggestion(event);
  } else if (event.keyCode == upArrow || event.keyCode == downArrow) {
    cycleThroughSuggestions(event);
  }
}

var cycleThroughSuggestions = function(event) {
  console.log("cycle")

  var suggestions = $("#yes_match li");
  var firstSuggestion = suggestions.children(":first")[0];
  var lastSuggestion = suggestions.children(":last")[0];

  var nextSuggestion = function(currentSuggestion) {
    return $(currentSuggestion).parent().next().find("a")[0];
  }

  var previousSuggestion = function(currentSuggestion) {
    return $(currentSuggestion).parent().prev().find("a")[0];
  }

  currentSuggestion = event.currentTarget;

  if (event.keyCode == upArrow) {
    if (currentSuggestion == firstSuggestion) {
      $(lastSuggestion).trigger("focus");
    } else {
      $(previousSuggestion(currentSuggestion)).trigger("focus")
    };

    event.preventDefault();
  } else if (event.keyCode == downArrow) {
    if (currentSuggestion == lastSuggestion) {
      $(firstSuggestion).trigger("focus");
    } else {
      $(nextSuggestion(currentSuggestion)).trigger("focus")
    };

    event.preventDefault();
  }
};

var submitSuggestion = function(event) {
  console.log("submit")
  var enterKey = 13;

  if (event.keyCode == enterKey) {
    event.currentTarget.trigger("click");

    event.preventDefault();
  }
}

jQuery(function($){

  // ----- Parse Heroes Hash ----- //
  if ($.deparam.fragment().heroes === ""){
    window.setTimeout(function(){
      $('.heroes-toggle').first().trigger('click')
    }, 1)
  };


  // ----- FitText ----- //

  $('.nominate-label').fitText(1.3, {maxFontSize: '34px'});

  // ----- Past Hero Toggle ----- //

  var site = $('.site');

  $('body').on('click', '.is-reminiscing .content, .heroes-close', function(e) {
    site.removeClass('is-reminiscing');
    e.preventDefault();
  }).on('keydown.modal', function(e) {
    if (e.which == 27) {
      site.removeClass('is-reminiscing');
    }
  });
  $('.heroes-toggle').on('click', function(e) {
    site.addClass('is-reminiscing');
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

    var year = $(e.currentTarget).find('a').text()
    var state = { 'year': year };
    var url = "/heroes/" + year;

    history.pushState(state, null, url);

    e.preventDefault();
  });

  // ----- Nomination Form ----- //

  var regex1 = /github\./;
  var regex2 = /http:/;

  $('#nominee')
    .focus()
    .keyup(function(event) {
      var form = $(this).closest('form');
      var input_text = $(event.target).val();
      var matches = $("#yes_match");

      // TODO disable http & github from submitting the form
      if ( regex1.test(input_text) ||  regex2.test(input_text) ) {
        if(! $("#error").length ) {
          // only attempt to add the error if it wasn't already present
          $("<div />").prop("id", "error").appendTo(matches).html("Only include the GitHub username").show();
        }

        // disable next button
        $('.nominate-submit').prop('disabled', true);

        // disable form submission
        form.on('submit', function(event){
          event.preventDefault();
        })
        $('#results').empty().hide();
      } else {
        // enable next button
        $('.nominate-submit').prop('disabled', false);

        // enable form submission
        form.off('submit');

        if (input_text.length > 2 ) {
          $(matches)
            .load('/nominees/?q=' + input_text)
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

    // intercept the keydown events (arrow up and down only) on the nominee
    // input field in order to redirect focus on either the first or the last
    // available autocomplete suggestion
    $("#nominee").on("keydown", focusSuggestions);

    // intercept the keydown events on the autocomplete suggestion result links
    // in order to cycle through them or submit them
    $("body").on("keydown", "#results a", interceptSubmit);

    $("#vote form").submit( function(){
      var input_text = $("input#nominee").val();
      if (  regex1.test(input_text) || regex2.test(input_text) ) {
        return false;
      }
    });

  // ----- Nomination Page ----- //
  $("#new_nomination textarea").on("keydown", function(event){
    if(event.keyCode == 13 && event.metaKey) {
      $(event.currentTarget).parents("form:first").submit();
    }
  })
});
