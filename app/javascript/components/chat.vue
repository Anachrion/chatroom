<template>
  <div id="chat-component" class="chat">
    <div class="container py-5 px-4">
      <header class="text-center">
        <h2 class="display-5">
          Chatroom {{chatroom.name}}
        </h2>
      </header>
      <div class="row rounded-lg overflow-hidden shadow">
        <div class="col-2 px-0 border rounded-lg">
          <template v-for="user in users">
            <User
              :user="user"
              :key="user.id"
            >
          </User>
          </template>
        </div>
        <div class="col-10 px-0">
          <div class="px-4 py-5 chat-box bg-white" ref="chatContainer">
            <template v-for="message in messages">
              <Message
                :message="message"
                :currentUserMessage="isCurrentUserMessage(message)"
                :key="message.id"
              >
              </Message>
            </template>
          </div>
          <div class="input-group">
            <textarea v-model="messageContent" id="message_content" class="content form-control rounded-0 border-0 py-4 bg-light"></textarea>
            <div class="input-group-append">
              <button @click="sendMessage()" id="send-button" class="btn btn-success btn-lg">
                <i class="fa fa-paper-plane"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Message from "components/message";
  import User from "components/user";

  import consumer from "channels/consumer"

  console.log(gon)
  export default {
    data () {
      return {
        chatroom: gon.chatroom,
        messages: gon.chatroom.messages,
        users: gon.users,
        messageContent: ''
      }
    },
    components: {
      Message,
      User
    },
    mounted() {
      consumer.subscriptions.create(
        {
          channel: 'ChatroomChannel',
          chatroom_instance_id: this.chatroom.id
        },
        {
          received: data => {
            console.log(data);
            this.addNewMessage(data.message);
          }
        }
      );
      consumer.subscriptions.create('UserChannel',
        {
          received: data => {
            console.log(data);
            this.users.push(data.user);
          }
        }
      );
      this.scrollToEnd();
    },
    updated() {
      this.$nextTick(function () {
        this.scrollToEnd();
      })
    },
    methods: {
      scrollToEnd() {
        let container = this.$refs.chatContainer;
        container.scrollTop = container.scrollHeight
      },
      isCurrentUserMessage(message) {
        return message.user_id == gon.current_user.id;
      },
      addNewMessage(message) {
        this.messages.push(message);
      },
      sendMessage() {
        let payload = JSON.stringify({ content: this.messageContent, chatroom_instance_id: this.chatroom.id })
        const csrfToken = document.querySelector("[name='csrf-token']").content;
        fetch(gon.form_url, {
          method: "POST",
          headers: {
            'X-CSRF-Token': csrfToken,
            'Content-Type': 'application/json',
            'Content-type': 'application/json'
          },
          body: payload
        }).then(response => {
          if (!response.ok) { throw response; }
          this.messageContent = '';
        }).catch(error => {
          console.error("error", error);
        });
      }
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
