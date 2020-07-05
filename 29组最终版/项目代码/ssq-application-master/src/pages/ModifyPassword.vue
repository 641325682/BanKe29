<template>
  <div class="body">
    <div>
      <x-header :left-options="{backText: ''}">修改密码</x-header>
    </div>
    <div class="content">
      <div>
        <x-input  type="password" placeholder="输入原密码" v-model="oldPassword">
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/password.png">
        </x-input>
        <x-input  type="password" placeholder="输入新的密码" v-model="newPassword">
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/password.png">
        </x-input>
      </div>
      <x-button type="primary" action-type="button" class="button" @click.native="handleSubmit">确认</x-button>
    </div>
    <div v-transfer-dom>
      <alert v-model="show1" :title="'请输入原密码'"> 原密码不能为空</alert>
    </div>
    <div v-transfer-dom>
      <alert v-model="show2" :title="'请输入新密码'">新密码不能为空</alert>
    </div>
    <div v-transfer-dom>
      <alert v-model="show3" :title="'原密码错误'">请输入正确的密码</alert>
    </div>
  </div>
</template>

<script>
  import { Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert } from 'vux'
  import axios from 'axios'
  import qs from 'qs'
  export default {
    name: 'ModifyPassword',
    directives: {
      TransferDom
    },
    data () {
      return {
        userName: '',
        oldPassword: '',
        newPassword: '',
        show1: false,
        show2: false,
        show3: false,
        resData: [],
        postData: []
      }
    },
    components: {
      Group,
      Cell,
      XHeader,
      XInput,
      Alert,
      XButton
    },
    methods: {
      handleSubmit: function () {
        if (this.oldPassword === '') {
          this.show1 = true
        } else if (this.newPassword === '') {
          this.show2 = true
        } else {
          this.userName = localStorage.getItem('username')
          axios.post('http://47.113.124.225:8083/User', qs.stringify({
            stno: this.userName,
            oldpassword: this.oldPassword,
            password: this.newPassword
          }), {
            headers: {
              token: 'true'
            }
          }).then(res => {
            console.log(res.data)
            if (res.data.code === 200) {
              this.$router.push('/PersonalCenter')
            } else if (res.data.code === 10001) {
              this.show3 = true
              this.oldPassword = ''
              this.newPassword = ''
            }
          })
        }
      }
    }
  }
</script>

<style lang="less" scoped>
  .button{
    margin-top: 20px;
    width: 80%;
  }
</style>
