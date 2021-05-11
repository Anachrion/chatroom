$(document).on('turbolinks:load', function() {
  $('button#send-button').on(
    'click',
    function(e) {
      submit_message_form();
      e.preventDefault();
    }
  );


  const submit_message_form = () => {
    $.ajax({
      type: "POST",
      url: $('#new_message').attr('action'),
      data: $('#new_message').serialize(),
      success: function () {
        $('#message_content').val("")
      }
    });
  }

});
