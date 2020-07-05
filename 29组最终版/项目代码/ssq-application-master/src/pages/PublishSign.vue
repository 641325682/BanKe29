<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}" style="background-color:00cc66;">签到</x-header>
    </div>
    <div class="content">
      <div class="signinButton" v-on:click="showConfirm()" style="color: #3399ff;">
        发布签到
      </div>
      <div class="signinButton">
        <van-icon name="location-o" />{{dizhi}}
      </div>
      <div class="signinTitle">
        发布签到情况
      </div>
      <div class="signinInfo">
        <div class="record" v-for="(item , i) in list" :key="i">
          <div class="item1">
            <!--<div>{{item.signInTime.split('T')[0]}}  {{item.signInTime.split('T')[1].split('.')[0]}}</div>-->
            <div>{{item.signInTime.split(' ')[0]}}  {{item.signInTime.split(' ')[1]}}</div>
            <div class="item2">允许签到时间：{{item.duration}}</div>
          </div>
          <!-- <div class="item3">
            <x-button  class="button1"  @click.native="handleInfo(item.signId)">
              <a>查看详情</a>
            </x-button>
          </div> -->
        </div>
      </div>
    </div>
    <toast v-model="show3" text="发布成功"></toast>
    <div v-transfer-dom>
      <confirm v-model="show2"
               show-input
               ref="confirm5"
               :title="'请输入可签到时长(分钟)'"
               @on-confirm="handleSubmit">
      </confirm>
    </div>
  </div>
</template>

<script>
import { Confirm, Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert, Toast } from 'vux'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'PublishSign',
  data () {
    return {
      courseId: 1,
      timestamp: null,
      show1: false,
      show2: false,
      show3: false,
      message: 'Hello',
      userName: '',
      time: '',
      signid: '',
      resdata: '',
      dizhi:'',
      weekDay:
        ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
      list: [
      ],
      postData: []
    }
  },
  directives: {
    TransferDom
  },
  mounted () {
    this.userName = localStorage.getItem('username')
    this.courseId = localStorage.getItem('courseid')
    this.showData()
    this.utc2beijing()
    this.getData();
  },
  components: {
    Confirm,
    Group,
    Cell,
    XHeader,
    XInput,
    XButton,
    Alert,
    Toast
  },
  methods: {
    getData () {
      axios.get('http://www.xhw8888.com/index/app/bkxq?id=' + this.courseId, {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
        console.log(res.data);
        this.dizhi = res.data[0].dizhi
      })
    },
    utc2beijing: function (time) {
      var dateee = new Date(time).toJSON()
      var date = new Date(+new Date(dateee) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
      return date
    },
    showData: function () { // 直接显示教师本课程的历史发布签到
      
      axios.get('http://47.113.124.225:8083/Teacher/SignIn', {
        params: {
          courseid: this.courseId
        }
      }).then((res) => {
        for (var i = 0; i < res.data.data.length; i++) {
          res.data.data[i].signInTime = this.$options.methods.utc2beijing(res.data.data[i].signInTime)
        }
        this.list = res.data.data
        console.log(this.list)
        if (res.data.code === 200) {
          // this.$router.push('/TeacherSignrecord')
        } else if (res.data.code === 10001) {
        }
      }, (response) => {
        // 响应错误回调
      })
    },
    getdz () {
      var data = {
          key: "PQABZ-CUKEX-CRE4P-7DEQJ-QHVVH-X7FRX"  //这个key就是你申请的密钥
      }; 
      var url = "https://apis.map.qq.com/ws/location/v1/ip"; //这个就是地理位置信息的接口
      data.output = "jsonp";
      this.$jsonp(url, data)
        .then(res => {
          var lat = res.result.location.lat;
          var lng = res.result.location.lng;
          var datas = {
              key: "PQABZ-CUKEX-CRE4P-7DEQJ-QHVVH-X7FRX",  //这个key就是你申请的密钥
              location:lat+","+lng
          }; 
          var urls = "http://apis.map.qq.com/ws/geocoder/v1/"; //这个就是地理位置信息的接口
          datas.output = "jsonp";
          // datas.output = "jsonp";
          this.$jsonp(urls, datas)
            .then(res => {
              this.dizhi = res.result.address
            })
            .catch(error => {
                console.log(error);
            });

        })
        .catch(error => {
            console.log(error);
        });
    
    },
    showConfirm: function () { // 显示输入持续时间的弹窗
      this.show2 = true
    },
    handleSubmit: function (value) { // 发布签到
      console.log(parseFloat(value));
      axios.post('http://www.xhw8888.com/index/app/sfqd', qs.stringify({
            duration: parseFloat(value),
          }), {
            emulateJSON: true
          }, {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
          }).then(res => {
            if(res.data == 401) {
              this.$dialog.alert({
                title: '',
                message: '签到时长超出限制',
            })
            return false;
            }else{
      this.userName = localStorage.getItem('username')
      this.courseId = localStorage.getItem('courseid')
      axios.post('http://47.113.124.225:8083/Teacher/SignIn', qs.stringify({
        courseid: this.courseId,
        studentid: this.userName,
        duration: parseFloat(value)
      }), {
        headers: {
          token: 'true'
        }
      }).then(res => {
        this.resdata = res.data.data
        console.log(res.data.code)
        if (res.data.code === 200) {
          this.show3 = true
          // this.$router.push('/PublishSign')
          // location.reload() // 按确定后重新载入页面
          this.showData()
          this.utc2beijing()
          this.getData();
        } else if (res.data.code === 10001) {
          this.show1 = true
        }
      })
            }
          })


    },
    handleInfo: function (id) { // 点击查看某次签到的详情
      console.log('当前被点击的id=' + id)
      this.signid = parseInt(id)
      localStorage.setItem('signid', this.signid)
      axios.get('http://47.113.124.225:8083/Teacher/SignRecord', {
        params: {
          signid: parseInt(id)
        }
      }).then(res => {
        console.log(res.data.data)
        if (res.data.code === 200) {
          this.$router.push('/TeacherSignrecord')
        } else if (res.data.code === 10001) {
          this.show1 = true
        }
      })
    }
  }
}
</script>

<style lang="less" scoped>
  .content{
    position: absolute;
    background-color: #fafbf9;
    height: 93%;
    width: 100%;
  }
  .signinButton{
    position: relative;
    background-color: white;
    height: 80px;
    width: 100%;
    margin: 0;
    padding: 0;
    text-align:center;
    line-height: 80px;
    color: #1abc9c;
  }
  .button{
    background-color: white;
    height: 100%;
    width: 100%;
    font-size: 16px;
    color: #1abc9c;
  }
  button::after{
    border:none;// 去除边框
  }
  .button1{
    background-color: white;
    height: 100%;
    width: 100%;
    font-size: 15px;
    color: #66cdaa;
  }
  button1::after{
    border:none;// 去除边框
  }
  .signinTitle{
    position: relative;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 10px;
    padding: 0px;
    width: 100%;
    color: #333333;
  }
  .signinInfo{
    position: relative;
    background-color: white;
    border-top: 1px solid #ececec;
    margin-top: 0px;
    height: 400px;
    width: 100%;
  }
  .record{
    position: relative;
    margin: 0px;
    border-bottom: 1px solid #ececec;
    height: 60px;
    width: 100%;
    font-size: 14px;
  }
  .item1{
    display:inline-block;
    float: left;
    position: relative;
    margin-top: 8px;
    margin-left: 10px;
    padding: 0px;
    width: 60%;
    font-size: 14px;
    background-color: #ffffff;
  }
  .item2{
    display:inline-block;
    position: relative;
    margin-top: 5px;
  }
  .item3{
    display:inline-block;
    float: right;
    position: relative;
    margin-top: 13px;
    margin-right: 40px;
    color: #b2b2b2;
  }
</style>
