<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}">修改头像</x-header>
    </div>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton } from 'vux'
export default {
  name: 'ModifyImg',
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  }
}
</script>

<style lang="less" scoped>
</style>
