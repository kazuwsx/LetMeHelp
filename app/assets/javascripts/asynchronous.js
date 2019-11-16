$(document).on('click', 'input[type=submit]', function() {
  if ($('input[type=text]').val() == '') {
    return false;
  }
})
$(document).on("ajax:success", "form", function(e) {
  $('.comment_form').val('');
  if($('.chat_wrapper .w-100').length >= 6) {
    $('.chat_wrapper div:first').remove();
  }
  $('.chat_wrapper').append(
    '<div class="p-2 w-100">' +
      '<div class="text-right">' +
        '<div class="border border-info rounded p-2 d-inline-block">' +
          '<div class="h4 font-weight-normal">' +
            e.detail[0].comment +
          '</div>' +
        '</div>' +
        '<img class="mt-3" id="js-img" width="70"  height="70">' +
      '</div>' +
    '</div>'
  );
  $('#js-img').attr('src', e.detail[0].image );
});
$(document).on("ajax:ajax:error", "form", function(e) {
  console.log('error');
});
