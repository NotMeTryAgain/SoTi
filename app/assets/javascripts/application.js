// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation();
  $('input#uvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).parent().attr('action');
    var uvTotal = $(this).parent().parent().find('.uvTotal');
    var dvTotal = $(this).parent().parent().find('.dvTotal');
    var unVoteButton = $(this).parent().parent().find('input#unvote');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      success: function(response) {
        uvTotal.text(response.uvTotal);
        dvTotal.text(response.dvTotal);
        unVoteButton.show()
      }
    });
  });

  $('input#dvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).parent().attr('action');
    var uvTotal = $(this).parent().parent().find('.uvTotal');
    var dvTotal = $(this).parent().parent().find('.dvTotal');
    var unVoteButton = $(this).parent().parent().find('input#unvote');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      success: function(response) {
        uvTotal.text(response.uvTotal);
        dvTotal.text(response.dvTotal);
        unVoteButton.show()
      }
    });
  });

  $('input#unvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).parent().attr('action');
    var uvTotal = $(this).parent().parent().find('.uvTotal');
    var dvTotal = $(this).parent().parent().find('.dvTotal');
    var unVoteButton = $(this).parent().parent().find('input#unvote');
    $.ajax({
      type: 'DELETE',
      url: url,
      dataType: 'json',
      success: function(response) {
        uvTotal.text(response.uvTotal);
        dvTotal.text(response.dvTotal);
        unVoteButton.hide()
      }
    });
  });
});
