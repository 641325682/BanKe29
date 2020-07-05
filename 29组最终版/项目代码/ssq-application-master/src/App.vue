<template>
  <div>
    <router-view/>
    <!--<button @click = "login">login</button>-->
    <!--<router-link to="/Login">Index</router-link>-->
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton } from 'vux'
export default {
  name: 'App',
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  },
  methods: {
    login () {
      // this.$router.push({path: '/Login'})
      let getFlag = localStorage.getItem('Flag')
      let isStudent = localStorage.getItem('isStudent')
      if (getFlag === 'isLogin') {
        if (isStudent === '1') {
          this.$router.push('/Home')
        } else {
          this.$router.push('/TeacherHome')
        }
      } else {
        this.$router.push('/Login')
      }
    }
  }

}
</script>

<style>
  *{margin:0; padding:0;}
</style>
