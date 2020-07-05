<template>
  <div>
    签到成功！
  </div>
</template>

<script>
export default {
  name: 'SuccessSisgn',
  mounted () {
    this.goPage()
  },
  methods: {
    goPage () {
      this.$router.push('/SignIn')
    }
  }
}
</script>

<style lang="less" scoped>
</style>
