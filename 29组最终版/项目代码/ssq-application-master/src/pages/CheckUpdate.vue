<template>
  <div class="htmlBox">
    <div>
      <x-header :left-options="{backText: ''}">检查更新</x-header>
    </div>
    <div style="height: 140px">
      <img src="../assets/ssq.png" style="width: 140px;height: 140px;margin-left: 35%;margin-top: 10px">
    </div>
    <group>
      <cell title="版本更新" value="已是最新版"></cell>
      <cell title="功能介绍" is-link></cell>
      <cell title="反馈" is-link></cell>
    </group>

  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton, Selector } from 'vux'
export default {
  name: 'CheckUpdate',
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton,
    Selector
  },
  mounted () {
    document.querySelector('body').setAttribute('style', 'background-color:#fafbf9;height:100%;position: fixed;width:100%')
  }

}
</script>

<style lang="less" scoped>
  .htmlBox {
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0px;
    background-color: #fafbf9;
  }
</style>
