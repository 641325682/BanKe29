<template>
  <div class="body">
    <!-- <view-box >
      <x-header>登陆</x-header>
    </view-box> -->
    <div class="content">
      <div class="imgarea">
        <img src="../assets/icon.jpg" style="width: 150px;height: 150px">
      </div>
      <br>
      <br>
      <Row>
        <i-col span="24" style="text-align: center;">
          <i-input icon="ios-person" placeholder="请输入用户名" v-model="userName" style="width: 80%;"></i-input>
        </i-col>
      </Row>
      <br>
      <br>
      <Row>
        <i-col span="24" style="text-align: center;">
          <i-input type="password"  icon="ios-eye" placeholder="请输入密码" v-model="passWord" style="width: 80%;"></i-input>
        </i-col>
      </Row>
      <br>
      <br>
      <Row>
        <i-col span="24" style="text-align: center;">
          <i-button type="primary"  style="width: 50%;width: 80%;background-color:#00cc66" @click.native="handleSubmit">登陆</i-button>
        </i-col>
      </Row>
      <br>
      <br>
      <Row>
        <i-col span="24" style="text-align: center;">
          <div class="rest">
          <span >
            <router-link to="/Register"><a class="text">注册</a></router-link>
          </span>
          <span style="margin-left:20px;">
            <!-- <router-link to="/ForgetPassword"><a class="text">忘记密码</a></router-link> -->
          </span>
        </div>
        </i-col>
      </Row>
    </div>
    <div v-transfer-dom>
      <alert v-model="show1" :title="'请输入用户名'"> 用户名不能为空</alert>
    </div>
    <div v-transfer-dom>
      <alert v-model="show2" :title="'请输入密码'">密码不能为空</alert>
    </div>
    <div v-transfer-dom>
      <alert v-model="show3" :title="'用户名不存在'"> 请输入正确的用户名</alert>
    </div>
    <div v-transfer-dom>
      <alert v-model="show4" :title="'密码错误'">请输入正确的密码</alert>
    </div>
  </div>
</template>

<script type = "text/javascript">
  import { Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert } from 'vux'
  import axios from 'axios'
  import qs from 'qs'
  export default {
    name: 'Login',
    directives: {
      TransferDom
    },
    data () {
      return {
        userName: '',
        passWord: '',
        show1: false,
        show2: false,
        show3: false,
        show4: false,
        resData: [],
        postData: []
      }
    },
    components: {
      Group,
      Cell,
      XHeader,
      XInput,
      XButton,
      Alert
    },
    methods: {
      handleSubmit: function () {
        if (this.userName === '') {
          this.show1 = true
        } else if (this.passWord === '') {
          this.show2 = true
        } else {
          axios.post('http://47.113.124.225:8083/login', qs.stringify({
            stno: this.userName,
            password: this.passWord
          }), {
            headers: {
              token: 'true'
            }
          }).then(res => {
            if (res.data.code === 200) {
              localStorage.setItem('username', this.userName)
              localStorage.setItem('userId', res.data.data.userId)
              axios.get('http://47.113.124.225:8083/Self?stno=' + this.userName, {
                emulateJSON: true
              }, {
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                }
              }).then(res => {
                if (res.data.code === 200) {
                  console.log(res);
                  localStorage.setItem('roleId', res.data.data.roleId)
                } else {
                  localStorage.setItem('roleId', 1)
                }
              })
              // 设置Vuex登录标志为true，默认userLogin为false
              //            this.$store.dispatch('userLogin', true)
              // Vuex在用户刷新的时候userLogin会回到默认值false，所以我们需要用到HTML5储存
              // 我们设置一个名为Flag，值为isLogin的字段，作用是如果Flag有值且为isLogin的时候，证明用户已经登录了。
              localStorage.setItem('Flag', 'isLogin')
              if (res.data.data.flag === 1) {
                this.$router.push('/TeacherHome')
                localStorage.setItem('isStudent', '0')
              } else {
                this.$router.push('/Home')
                localStorage.setItem('isStudent', '1')
              }
            } else if (res.data.code === 10001) {
              this.passWord = ''
              this.show4 = true
            } else if (res.data.code === 10004) {
              this.userName = ''
              this.show3 = true
            }
          })
        }
      }
    },
    created  () {
      // var data = {
      //     key: "PQABZ-CUKEX-CRE4P-7DEQJ-QHVVH-X7FRX"  //这个key就是你申请的密钥
      // }; 
      // var url = "https://apis.map.qq.com/ws/location/v1/ip"; //这个就是地理位置信息的接口
      // data.output = "jsonp";
      // this.$jsonp(url, data)
      //   .then(res => {
      //     console.log(res) 
      //   })
      //   .catch(error => {
      //       console.log(error);
      //   });
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
        this.$router.push('/')
      }
    }
  }
</script>

<style lang="less" scoped>
  .body{
    width: 100%;
    height: 100%;
    position: absolute;
    background-color: #657180;
  }

  .imgarea{
    margin-top: 80px;
    width: 150px;
    height: 150px;
    margin-left: 30%;
    background-color: #1abc9c;
  }
  .table{
    margin-top: 80px;
  }
  .button{
    margin-top: 20px;
    width: 80%;
  }
  .rest{
    margin-top: 10px;
    // margin-left: 60%;
  }
  .text{
    color: #00cc66
  }
  a{
    text-decoration:none;
    font-size: 16px;
  }
</style>
