$(function(){
  function buildHTML(data){
    var img, side, right_img, left_img;
    if(data.image == null){
      img = "";
    } else {
      img = '<img class="mt-3" id="js-img" width="70"  height="70" src=' + data.image + '>';
    }
    side = data.current_user_id == data.user_id ? "right" : "left";
    if(side == 'right') {
      right_img = "";
      left_img = img;
    } else if(side == 'left') {
      right_img = img;
      left_img = "";
    }
    let html =
    '<div class="p-2 w-100 message" data-id=' + data.id + '>' +
      '<div class="text-'+ side + '">' +
        right_img +
        '<div class="border border-info rounded p-2 d-inline-block">' +
          '<div class="h4 font-weight-normal">' +
            data.comment +
          '</div>' +
        '</div>' +
        left_img +
      '</div>' +
    '</div>'
    $('.messages').append(html);
  }

  function update(){
    if($('.message')[0]){
      var message_id = $('.message:last').data('id');
    } else {
      var message_id = 0;
    }
    $.ajax({
      url: location.href,
      type: 'GET',
      data: {
        message: { id: message_id }
      },
      dataType: 'json'
    })
    .done(function(data){
      $.each(data, function(i, data){
        buildHTML(data);
        $("html, body").animate({ scrollTop: $(document).height() }, 1000);
      });
    });
  }

  function submit_location(){
    $.ajax({
      url: '/submit_location',
      type: "GET",
      data: location.href.substr(28),
      dataType: 'json',
      processData: false,
      contentType: false
    })
  }

  function submit_new_comment(_this, e){
    e.preventDefault(); 
    if ($('.comment_form').val() == ''){
      return false;
    }
    let formData = new FormData(_this);
    let url = $(_this).attr('action')
    $('.comment_form').val('');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      buildHTML(data);
      $("html, body").animate({ scrollTop: $(document).height() }, 1000);
    })

  }
  
  $(function(){
    setInterval(update, 10000);
  })
  
  $('#submit-location-information').on('click',function(){
    submit_location();
  });

  $('.comment_submitter').on('submit', function(e){
    submit_new_comment(this, e);
    return false;
  })  
})
