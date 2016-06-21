function move(direction) {
  $.ajax({
          method: 'post',
          url: '/swipe',
          data: {move: direction},
        })
  .done((response) => {
    $('#board-frame').replaceWith(response);
  });
}

$(document).ready(() => {
  $(document).keydown((e) => {
    switch(e.which) {
      case 37: e.preventDefault(); move('left');  break;
      case 38: e.preventDefault(); move('up');    break;
      case 39: e.preventDefault(); move('right'); break;
      case 40: e.preventDefault(); move('down');  break;
      default: return;
    }
  });
});
