import { internet } from 'faker';

// turbolinks:load workaround
// https://github.com/turbolinks/turbolinks/issues/534

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
