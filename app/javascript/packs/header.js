import { internet } from 'faker';

// turbolinks:load workaround
// https://github.com/turbolinks/turbolinks/issues/534

$('#user_status').on(
  'change',
  function() {
    changeStatus(this.value);
  }
);
const changeStatus = (status) => {
  let payload = JSON.stringify({ status: status})
  const csrfToken = document.querySelector("[name='csrf-token']").content;
  fetch('/users/'+gon.current_user.id, {
    method: "PUT",
    headers: {
      "X-CSRF-Token": csrfToken,
      'Accept': 'application/json',
      'Content-type': 'application/json'
    },
    body: payload
  }).then(response => {
    if (!response.ok) { throw response; }
  }).catch(error => {
    console.error("error", error);
  });
}
