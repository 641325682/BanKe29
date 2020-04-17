<template>
  <div id="app">
		<router-link to="/home">首页</router-link>
		<router-link to="/errPage/404">404</router-link>
		<router-link to="/errPage/403">403</router-link>
		<router-link to="/errPage/500">500</router-link>
    <router-view></router-view>
  </div>
</template>

<script>
    export default {
        name: 'App'
    }
</script>

<style lang="less">
#app {
}
</style>
