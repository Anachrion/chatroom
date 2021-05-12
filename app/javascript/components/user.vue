<template>
  <div class="media border p-2 d-flex align-items-center">
    <i class="fas fa-user-circle fa-2x" :style="{ color: statusColor } "></i>
    <div class="media-body ml-3">
      <div class="align-items-center justify-content-between mb-1">
        <h6 class="mb-0">
          {{user.username}}
        </h6>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      user: {
        type: Object
      }
    },
    computed: {
      statusColor() {
        switch (this.user.status) {
          case 'available':
            return '#8FCACA'
          case 'busy':
            return '#FF968A'
          case 'away':
            return '#FFC8A2'
          default:
            return '#757575'
        }
      }
    }
  }
</script>

<style scoped>
</style>
