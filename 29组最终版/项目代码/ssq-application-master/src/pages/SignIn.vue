<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}" @on-click-back="togUrl" style="background-color: #3399ff;">签到</x-header>
    </div>
    <div class="content">
      <div class="signinButton" v-on:click="handleSubmit()">
        开始签到
      </div>
      <div class="signinButton" style="height: 53px;color: red;">
        <van-icon name="location-o" />{{dizhi}}
      </div>
      <div class="signinTitle">
        签到情况
      </div>
      <div class="signinInfo">
        <div class="record" v-for="(item , i) in list" :key="i">
          <div class="item1">
            <div>{{item.signTime.split(' ')[0]}} {{weekDay[new Date(item.signTime.split(' ')[0]).getDay()]}}</div>
            <div class="item2">{{item.signTime.split(' ')[1]}}</div>
          </div>
          <div class="item3">已签到
            <p>位置：{{item.dizhi}}</p>
          </div>
        </div>
      </div>
    </div>
    <toast v-model="show1" type="text"  width="20em" text="签到超时!"></toast>
    <toast v-model="show2" text="签到成功"></toast>
    <toast v-model="show4" type="text"  width="20em" text="当前不在签到时间！"></toast>
    <toast v-model="show3" type="text"  width="20em" text="请勿重复签到！"></toast>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert, Toast } from 'vux'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'SignIn',
  data () {
    return {
      courseid: '',
      show1: false,
      show2: false,
      show3: false,
      show4: false,
      userName: '',
      time: '',
      resdata: '',
      weekDay:
        ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
      list: [],
      postData: [],
      userId: '',
      lat:'',
      lng:'',
      dizhi:''

    }
  },
  directives: {
    TransferDom
  },
  mounted () {
    this.userId = localStorage.getItem('userId')
    this.showData()
    this.getdz()
  },
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton,
    Alert,
    Toast
  },
  methods: {
    getdz () {
      var data = {
          key: "PQABZ-CUKEX-CRE4P-7DEQJ-QHVVH-X7FRX"  //这个key就是你申请的密钥
      }; 
      var url = "https://apis.map.qq.com/ws/location/v1/ip"; //这个就是地理位置信息的接口
      data.output = "jsonp";
      this.$jsonp(url, data)
        .then(res => {
          this.lat = res.result.location.lat;
          this.lng = res.result.location.lng;
          var datas = {
              key: "PQABZ-CUKEX-CRE4P-7DEQJ-QHVVH-X7FRX",  //这个key就是你申请的密钥
              location:this.lat+","+this.lng
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
    togUrl () {
      console.log(2333333333333);
    },
    utc2beijing: function (time) {
      var dateee = new Date(time).toJSON()
      this.date = new Date(+new Date(dateee) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
      return this.date
    },
    showData: function () {
      this.userName = localStorage.getItem('username')
      this.courseid = localStorage.getItem('courseid')
      axios.get('http://47.113.124.225:8083/Student/SignRecord', {
        params: {
          courseid: this.courseid,
          studentid: this.userName
        }
      }).then((res) => {
        for (var i = 0; i < res.data.data.length; i++) {
          res.data.data[i].signTime = this.$options.methods.utc2beijing(res.data.data[i].signTime)
        }
        axios.post('http://www.xhw8888.com/index/app/qddw', qs.stringify({
            data: res.data.data,
          }), {
            emulateJSON: true
          }, {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
          }).then(res => {
            this.list = res.data
          })
        
        if (res.data.code === 200) {
        } else if (res.data.code === 10001) {
        }
      }, (response) => {
        // 响应错误回调
      })
    },
    handleSubmit: function () {
      this.userName = localStorage.getItem('username')
      this.courseid = localStorage.getItem('courseid')
      axios.put('http://47.113.124.225:8083/Student/SignRecord', qs.stringify({
        courseid: this.courseid,
        studentid: this.userName
      }), {
        headers: {
          token: 'true'
        }
      }).then(res => {
        this.resdata = res.data.data
        if (res.data.code === 200) {
          
          axios.post('http://www.xhw8888.com/index/app/adddw', qs.stringify({
            courseid: this.courseid,
            userId: this.userId,
            lng: this.lng,
            lat: this.lat
          }), {
            emulateJSON: true
          }, {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
          }).then(res => {
              this.show2 = true
              this.showData();
          })
          // this.$router.push('/SuccessSign')
        } else if (res.data.msg === '签到超时') {
          this.show1 = true // 签到超时
        } else if (res.data.msg === '请勿重复签到') {
          this.show3 = true // 请勿重复签到
        } else if (res.data.msg === '不存在此签到') {
          this.show4 = true // 当前不在签到时间
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
    width: 37%;
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
    margin-top: 20px;
    margin-right: 10px;
    color: #b2b2b2;
  }
</style>
