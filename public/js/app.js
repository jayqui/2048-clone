$(document).ready(function() {

  $('#posts').on('submit', function(event) {
    event.preventDefault();
    var request = $.ajax({
      method: 'post',
      url: '/swipe',
      data: {move: 'up'},
    });
    request.done(function(response) {
      $('#board-frame').replaceWith(response);
    });
  });
});
