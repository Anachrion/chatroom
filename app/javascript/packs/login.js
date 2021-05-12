import { internet } from 'faker';

$(document).on('turbolinks:load ready', function() {
  $('button#rnd-btn').on(
    'click',
    function(e) {
      randomizeUsername();
    }
  );


  const randomizeUsername = () => {
    let randomUsername = internet.userName();
    $('#user_username').val(randomUsername);
  }

});
