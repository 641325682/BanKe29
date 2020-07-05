<template>
  <div id="headerPadding">
    <view-box >
      <x-header :left-options="{backText: ''}" style="background-color:#00cc66">注册</x-header>
    </view-box>
    <van-radio-group v-model="radio" direction="horizontal" style="margin-left: 47%;">
      <van-radio name="2">老师</van-radio>
      <van-radio name="1">学生</van-radio>
    </van-radio-group>
    <div class="RegisterMid">
        <x-input placeholder="输入工号/学号" v-model="ClassNumber" :max="9" :min="9"  @on-click-clear-icon="resets(event)">
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/account.png">
        </x-input>
        <x-input placeholder="输入手机号码" v-model="PhoneNumber" :max="11"  :min="11" >
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/phone.png">
        </x-input>
        <x-input placeholder="请输入验证码" class="weui_vcode" style="padding-right:0" v-model="VerCode" ref="note" type="number" >
          <img slot="label" style="padding-right:10px;display:block;" src="../assets/message.png">
          <x-button slot="right" mini  @click.native="getVerifyCode()" :class="btnClassName" :disabled="btnBoolen" style="padding-right: 20px">{{btnValue}}</x-button>
        </x-input>
        <x-input placeholder="设置登陆密码" v-if="visible" v-model="PassWord" type="password" :show-clear="false">
          <img slot="label" style="padding-right:10px;" src="../assets/password.png">
          <x-switch slot="right" title="" v-model="value1" @click.native="changePass('show')"></x-switch>
        </x-input>
    </div>
    <div style="padding-left: 50px">
      <check-icon :value.sync="demo1">已阅读并同意《<a>用户服务协议</a>》</check-icon>
    </div>
    <x-button type="primary" style="margin-top: 30px;width: 288px;border-radius: 10px;background-color:#00cc66" action-type="button"  @click.native="register()"  :disabled="disabled">确认</x-button>
    <div v-transfer-dom>
        <alert v-model="show1">{{ShowText}}</alert>
    </div>
  </div>
</template>

<script>
import {XHeader, CheckIcon, XButton, XSwitch, Alert, Toast, TransferDomDirective as TransferDom} from 'vux'
import ViewBox from '../../node_modules/vux/src/components/view-box/index.vue'
import XInput from '../../node_modules/vux/src/components/x-input/index.vue'
import Group from '../../node_modules/vux/src/components/group/index.vue'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'Register',
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
      // 图片验证码
      imgSrc: 'http://vueshop.glbuys.com/api/vcode/chkcode?token=1ec949a15fb709370f&nowtime=1312423435',
      // 用来发判断发送验证码
      isrefreshpic: false,
      // 定时器初始值
      auth_time: 0,
      // disabled的初始值
      btnBoolen: false,
      btnClassName: 'btn',
      btnValue: '获取短信验证码',
      value1: false,
      pwdType: 'password',
      visible: true,
      show1: false,
      ShowText: '',
      disabled: true,
      radio:'',
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
        if (this.ClassNumber == ''){
          this.show1 = true
          this.ShowText = '用户名不能为空'
          return false
        }
        // 发送网络请求
        axios.post('http://www.xhw8888.com/index/app/getCode', qs.stringify({
          tel: this.PhoneNumber,
          name: this.ClassNumber
        }), {
          emulateJSON: true
        }, {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
          }
        }).then(res => {
          localStorage.setItem('code',res.data)
          this.validateBtn()
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
    register: function () {
      var code = localStorage.getItem('code')
      code = code.replace('\'','')
      if (this.ClassNumber.length !== 9) {
        this.show1 = true
        this.ShowText = '请输入有效的学号，需是9位'
      } else if (this.PhoneNumber.length !== 11) {
        this.show1 = true
        this.ShowText = '请输入有效的手机号码，需是11位'
      } else if (this.VerCode.length !== 6) {
        this.show1 = true
        this.ShowText = '请输入6位验证码'
      } else if (this.PassWord.length <= 6) {
        this.show1 = true
        this.ShowText = '密码必须超过6位'
      } else if (code != this.VerCode){
        console.log(code);
        this.show1 = true
        this.ShowText = '验证码不正确'
      }else {
        axios.post('http://47.113.124.225:8083/register', qs.stringify({
          stno: this.ClassNumber,
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
          if (res.data.code === 200) {
            axios.get('http://www.xhw8888.com/index/app/addroid?id=' + this.radio + "&stno=" + this.ClassNumber + "&tel="+this.PhoneNumber, {
              emulateJSON: true
            }, {
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
              }
            }).then(res => {
            this.$router.push('/Home')
            const orderData = {'stno': this.ClassNumber, 'tel': this.PhoneNumber, 'code': this.VerCode, 'password': this.PassWord}
            localStorage.setItem('info', JSON.stringify(orderData))
            })
            
          } else if (res.data.code === 10001) {
            if (res.data.msg === '该学号已注册') {
              this.show1 = true
              this.ShowText = '学号已被注册'
            } else if (res.data.msg === '验证码错误') {
              this.show1 = true
              this.ShowText = '验证码错误'
            } else if (res.data.msg === '操作超时') {
              this.show1 = true
              this.ShowText = '验证码失效'
            }
          }
        }).catch(function (error) {
          console.log(error)
          //          this.show1 = true
          //          this.ShowText = '请输入正确的验证码'
        })
      }
    },
    changeType () {
      if (this.value1 === true) {
        this.pwdType = 'text'
        console.log(this.pwdType)
        console.log(this.value1)
      } else {
        this.pwdType = 'password'
        console.log(this.pwdType)
        console.log(this.value1)
      }
    },
    changePass (value) {
      this.visible = !(value === 'show')
    } //  判断渲染，true:暗文显示，false:明文显示
  },
  updated () {
    if (this.ClassNumber !== '' && this.PhoneNumber !== '' && this.VerCode !== '' && this.PassWord !== '' && this.demo1 === true) {
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
  .btn{
  }
  .btns{
  }
</style>
