
$(function () {
  $(document).ready(function(){  
  	$(window).bindWithDelay('scroll', function(){
      if ( $('#infinite-scrolling').size() > 0 ) {
  	    $(window).on('scroll', function () { 
          //more_entries_url = $('.pagination .next_page a').attr('href');
          $next = $(".pagination a[rel='next']");
          url = $($next).attr('href');
            if ( url && $(window).scrollTop() > $(document).height() - $(window).height() - 80 ) {
              $('.pagination').html('<p>Loading...</p>');
              $.getScript(url);
          
            }
        });
      }
    }, 100);
  });
}());
