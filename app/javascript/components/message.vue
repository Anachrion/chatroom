<template>
  <div class="media w-50 mb-2" :class="{ 'ml-auto': currentUserMessage }">
    <div class="media-body" :class="{ 'ml-3': !currentUserMessage }">
      <p class="coherent-font small text-muted my-2" >
        {{message.user.username}}
      </p>
      <div class="rounded py-2 px-3 my-2" :class="[currentUserMessage ? 'bg-primary' : 'bg-light']">
        <p class="text-small mb-0" :class="[currentUserMessage ? 'text-white' : 'text-dark']" style="white-space: pre-line">{{message.content}}</p>
      </div>
      <p class="small text-muted mb-0">
        {{message.formated_created_at}}
      </p>
    </div>
  </div>
</div>

</template>

<script>
  export default {
    props: {
      message: {
        type: Object
      },
      currentUserMessage: {
        type: Boolean,
        default: false
      }
    }
  }
</script>

<style scoped>
</style>
