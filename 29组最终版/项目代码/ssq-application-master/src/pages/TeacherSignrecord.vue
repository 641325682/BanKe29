<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}">签到详情</x-header>
    </div>
    <div class="content">
      <div class="signinInfo">
        <div class="record" v-for="(item , i) in list" :key="i">
          <div class="item1">
            <div>{{item.studentId}}</div>
            <div class="item2">{{item.signTime.split(' ')[0]}}  {{item.signTime.split(' ')[1]}}</div>
          </div>
          <div class="item3">
              <a>已签到</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert } from 'vux'
import axios from 'axios'
// import qs from 'qs'
export default {
  name: 'TeacherSignrecord',
  data () {
    return {
      courseId: 1,
      show1: false,
      userName: '',
      time: '',
      signid: '',
      resdata: '',
      weekDay:
        ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
      list: [],
      postData: []
    }
  },
  directives: {
    TransferDom
  },
  mounted () {
    this.showData()
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
    utc2beijing: function (time) {
      var dateee = new Date(time).toJSON()
      var date = new Date(+new Date(dateee) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
      return date
    },
    showData: function () {
      this.userName = localStorage.getItem('username')
      this.signid = localStorage.getItem('signid')
      console.log(this.signid)
      axios.get('http://47.113.124.225:8083/Teacher/SignRecord', {
        params: {
          signid: this.signid
        }
      }).then((res) => {
        for (var i = 0; i < res.data.data.length; i++) {
          res.data.data[i].signTime = this.$options.methods.utc2beijing(res.data.data[i].signTime)
        }
        this.list = res.data.data
        console.log(this.list)
        if (res.data.code === 200) {
        } else if (res.data.code === 10001) {
        }
      }, (response) => {
        // 响应错误回调
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
    margin-top: 20px;
    margin-right: 40px;
    color: #b2b2b2;
  }
</style>
