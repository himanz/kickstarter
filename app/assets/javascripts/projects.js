// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  $('#category-select').submit(function(event) {
    even.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/projects?search=' + searchValue);
  });
});

$(document).ready(function() {

// Endless Scrolling  
    jQuery(function() {
      if ($('.pagination').length) {
        $(window).scroll(function() {
          var url = $('.pagination span.next').children().attr('href');
          if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
            $('.pagination').text("Fetching more products...");
            return $.getScript(url);
          }
        });
    }
  }); 

  $(function() {
     $(".new_comment")
        .on('ajax:beforeSend', function() { // set this code to happen just before the ajax request is made
          $("input[type='submit']") // make changes to the submit button
            .val('Saving...') // change the text on the button
            .attr('disabled', 'disabled'); // disable the button
        })
        .on('ajax:complete', function() {
          $("input[type='submit']")
            .val('Create comment')
            .removeAttr('disabled');
        });
  });
});

