<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}">课程</x-header>
    </div>
    <div>
      <x-button @click.native="toSignIn">点我显示签到</x-button>
      <x-button @click.native="toCourseInfo">点我显示课程详情</x-button>
    </div>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton } from 'vux'
export default {
  name: 'Course',
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  },
  methods: {
    toSignIn () {
      this.$router.push('/SignIn')
    },
    toCourseInfo () {
      this.$router.push('/CourseInfo')
    }
  }
}
</script>

<style lang="less" scoped>
</style>
