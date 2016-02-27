module ApplicationHelper
  # Making this boolean false will disable the voting interface on the home page.
  def voting_enabled?
    false
  end

  # Making this boolean true will link to the previous year's heroes.
  def heroes_chosen?
    false
  end

  def gauges_tracker
    code = <<~JAVASCRIPT
      var _gauges = _gauges || [];
      (function() {
        var t   = document.createElement('script');
        t.type  = 'text/javascript';
        t.async = true;
        t.id    = 'gauges-tracker';
        t.setAttribute('data-site-id', '56c251624b2ffa6dbf008e41');
        t.setAttribute('data-track-path', 'https://track.gaug.es/track.gif');
        t.src = 'https://d36ee2fcip1434.cloudfront.net/track.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(t, s);
      })();
    JAVASCRIPT

    "<script type='text/javascript'>#{code}</script>".html_safe
  end
end
