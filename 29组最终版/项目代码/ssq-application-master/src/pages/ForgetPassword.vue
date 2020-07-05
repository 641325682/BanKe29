<template>
  <div id="headerPadding">
    <view-box >
      <x-header :left-options="{backText: ''}">忘记密码</x-header>
    </view-box>
    <div class="RegisterMid">
      <x-input placeholder="输入手机号码" v-model="PhoneNumber" :max="11"  :min="11" >
        <img slot="label" style="padding-right:10px;display:block;" src="../assets/phone.png">
      </x-input>
      <x-input placeholder="请输入验证码" class="weui_vcode" style="padding-right:0" v-model="VerCode" ref="note" type="number" >
        <img slot="label" style="padding-right:10px;display:block;" src="../assets/message.png">
        <x-button slot="right" mini  @click.native="getVerifyCode()" :class="btnClassName" :disabled="btnBoolen" style="padding-right: 20px">{{btnValue}}</x-button>
      </x-input>
        <x-input placeholder="输入新的登陆密码" class="weui_vcode" style="padding-right:0" v-model="PassWord">
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/password.png">
        </x-input>
    </div>
    <x-button type="primary" action-type="button" style="margin-top: 30px;width: 288px;border-radius: 10px;" @click.native="handleSubmit" :disabled="disabled">确认</x-button>
    <div v-transfer-dom>
      <alert v-model="show1">{{ShowText}}</alert>
    </div>
  </div>
</template>

<script>
import { XHeader, CheckIcon, XButton, XSwitch, Alert, Toast, TransferDomDirective as TransferDom } from 'vux'
import ViewBox from '../../node_modules/vux/src/components/view-box/index.vue'
import XInput from '../../node_modules/vux/src/components/x-input/index.vue'
import Group from '../../node_modules/vux/src/components/group/index.vue'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'ForgetPassword',
  directives: {
    TransferDom
  },
  data () {
    return {
      ClassNumber: '',
      PhoneNumber: '',
      VerCode: '',
      PassWord: '',
      demo1: false,
      value: false,
      btnBoolen: false,
      btnClassName: 'btn',
      btnValue: '获取短信验证码',
      show1: false,
      ShowText: '',
      disabled: true
    }
  },
  components: {
    Group,
    XInput,
    ViewBox,
    XHeader,
    CheckIcon,
    XButton,
    XSwitch,
    Alert,
    Toast
  },
  methods: {
    getVerifyCode () {
      // 获取验证码
      if (this.validatePhone()) {
        // 发送网络请求
        axios.post('http://47.113.124.225:8083/Code2', qs.stringify({
          tel: this.PhoneNumber
        }), {
          emulateJSON: true
        }, {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
          }
        }).then(res => {
          console.log(res.data)
          if (res.data.code === 10004) {
            this.show1 = true
            this.ShowText = '不存在该用户'
          } else {
            this.validateBtn()
          }
        })
          .catch(function (error) {
            console.log(error)
          })
      }
    },
    validatePhone () {
      // 判断输入的手机号是否合法
      if (!this.PhoneNumber) {
        this.show1 = true
        this.ShowText = '手机号码不能为空'
        console.log(this.errors)
        return false
      } else if (!/^1[345678]\d{9}$/.test(this.PhoneNumber)) {
        this.show1 = true
        this.ShowText = '手机号码非法'
        console.log(this.errors)
        return false
      } else {
        this.errors = {}
        this.btnBoolen = false
        this.btnClassName = 'btns'
        return true
      }
    },
    validateBtn () {
      // 倒计时
      let time = 60
      let timer = setInterval(() => {
        if (time === 0) {
          clearInterval(timer)
          this.btnBoolen = false
          this.btnValue = '获取验证码'
        } else {
          this.btnValue = time + '秒后重试'
          this.btnBoolen = true
          time--
        }
      }, 1000)
    },
    handleSubmit: function () {
      if (this.PhoneNumber.length !== 11) {
        this.show1 = true
        this.ShowText = '请输入有效的手机号码，需是11位'
      } else if (this.VerCode.length !== 6) {
        this.show1 = true
        this.ShowText = '请输入6位验证码'
      } else if (this.PassWord.length <= 6) {
        this.show1 = true
        this.ShowText = '密码必须大于6位'
      } else {
        axios.post('http://47.113.124.225:8083/forgetpassword', qs.stringify({
          tel: this.PhoneNumber,
          code: this.VerCode,
          password: this.PassWord
        }), {
          emulateJSON: true
        }, {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
          }
        }).then(res => {
          console.log(res.data)
          if (res.data.code === 10001) {
            if (res.data.msg === '验证码错误') {
              this.show1 = true
              this.ShowText = '验证码错误'
            } else if (res.data.msg === '操作超时') {
              this.show1 = true
              this.ShowText = '验证码失效'
            }
          } else {
            this.show1 = true
            this.ShowText = '修改密码成功'
            this.$router.push('/')
          }
        }).catch(function (error) {
          console.log(error)
          //          this.show1 = true
          //          this.ShowText = '请输入正确的验证码'
        })
      }
    }
  },
  updated () {
    if (this.PhoneNumber !== '' && this.VerCode !== '' && this.PassWord !== '') {
      this.disabled = false
    }
  }
}

</script>
<style>
  #headerPadding{
    padding: 0px;
  }
  .RegisterMid{
    padding:40px 10px 10px 10px;
  }
  .pos{
    padding-right:20px;
  }
  .cell-x-icon {

    display: block;

    fill: #ffffff;

  }
</style>
