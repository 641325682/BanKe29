<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}" style="background-color:00cc66;">{{coursdata.CourseName}}</x-header>
    </div>
    <div v-if="!tabShow">
      <Row>
      <i-col span="24" style="text-align: center;background: #f5f7f9;">
        <grid :show-lr-borders="false" :show-vertical-dividers="false">
        <grid-item link="/PublishSign" label="签到">
            <img slot="icon" src="../assets/qd.png">
        </grid-item>
        <grid-item  label="心意卡片">
                <img slot="icon" src="../assets/liwu.png">
            </grid-item>
            <grid-item  label="小组方案">
                <img slot="icon" src="../assets/xiaozu.png">
            </grid-item>
            <grid-item link="/erwm" label="查看二维码">
                <img slot="icon" src="../assets/yujing.png">
            </grid-item>
        </grid>
      </i-col>
    </Row>
    <!-- <div v-if="userlistshow">
        <van-cell-group v-for="(item, i) in userData" :key="i">
            <van-cell :title="item.STNo" />
        </van-cell-group>
    </div> -->
    <div class="content" >
      <div class="group" v-for="(item, i) in userData" :key="i">
        <div class="course_item">
          <span class="span1">
            <img  class="course_img" src="../assets/course_img/touxiang.jpg">
          </span>
          <span class="span2" >
            <p ref="CourseName" >名称：{{item.STNo}}</p>
            <p ref="CourseName" >距离：{{item.juli}}</p>
            <p ref="CourseName" >经验值：{{item.exp}}</p>
          </span>
        </div>
      </div>
    </div>
    <div  v-if="!userlistshow">
        <Row>
        <i-col span="24" style="text-align: center;">
           <p>复制班号</p>
           <p>邀请学生加入班号</p>
           <group>
            <x-button plain type="primary" style="border-radius:99px;margin-top: 188px;">复制班号</x-button>
            </group>
        </i-col>
        </Row>
    </div>
    </div>
    <div v-if="tabShow">
        <div class="content">
            <div class="group">
            <div class="course_item">
                <span class="span1">
                <img  class="course_img" src="../assets/course_img/ML.jpg">
                </span>
                <span class="span2" >
                <p ref="CourseName" >课程：{{coursdata.CourseName}}</p>
                <p ref="CourseName" >考试时间：{{coursdata.ExamTime}}</p>
                <p ref="CourseName" >任课老师：{{coursdata.TeacherName}}</p>
                </span>
            </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <van-button type="primary" style="margin-top: 188px;background-color:00cc66" size="large" @click="logoutbk">结束班课</van-button>
    </div>
    <tabbar>
      <tabbar-item show-dot>
        <img slot="icon" src="../assets/ziyuan.png">
        <span slot="label">资源</span>
      </tabbar-item>
      <tabbar-item show-dot @on-item-click="senTog(1)">
        <img slot="icon" src="../assets/person_icon.png">
        <span slot="label">成员</span>
      </tabbar-item>
      <tabbar-item show-dot>
        <img slot="icon" src="../assets/huodong.png">
        <span slot="label">活动</span>
      </tabbar-item>
      <tabbar-item show-dot>
        <img slot="icon" src="../assets/xiaoxi.png">
        <span slot="label">消息</span>
      </tabbar-item>
      <tabbar-item @on-item-click="senTog(2)">
        <img slot="icon" src="../assets/course_icon.png">
        <span slot="label">详情</span>
      </tabbar-item>
    </tabbar>
  </div>
</template>

<script>
import { Tab, TabItem, Tabbar, TabbarItem, GridItem, Grid, Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert, Toast } from 'vux'
// eslint-disable-next-line no-unused-vars
import axios from 'axios'
// eslint-disable-next-line no-unused-vars
import qs from 'qs'
export default {
  name: 'SignIn',
  data () {
    return {
        value1: '2015-11-12',
        coursname: '',
        class_b: '',
        userid: '',
        username: '',
        viewShow:true,
        code: '',
        courseid:'',
        coursdata:[],
        userlistshow:false,
        tabShow : false,
        userData: []
    }
  },
  directives: {
    TransferDom
  },
  mounted () {
    this.userId = localStorage.getItem('userId')
    this.username = localStorage.getItem('username')
    this.courseid = localStorage.getItem('courseid')
    console.log(this.courseid)
    this.getData()
    this.getmember()
  },
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton,
    Alert,
    Toast,
    Grid,
    GridItem,
    Tab,
    TabItem,
    Tabbar,
    TabbarItem,
  },
  methods: {
    getData () {
      axios.get('http://www.xhw8888.com/index/app/bkxq?id=' + this.courseid, {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
        console.log(res)
        this.coursdata = res.data[0]
        // if (res.data.code === 200) {
        //   console.log(res);
        //   localStorage.setItem('roleId', res.data.data.roleId)
        // } else {
        //   localStorage.setItem('roleId', 1)
        // }
      })
    },
    getmember () {
        axios.get('http://www.xhw8888.com/index/app/member?courseid=' + this.courseid, {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
          if(res.data != 'no'){
              this.userlistshow = true
              this.userData = res.data
          }else{
              this.userData = []
              this.userlistshow = false
          }
        
      })
    },
    senTog (ele) {
      console.log(111111111);
        if (ele == 1){
            this.tabShow = false
        }else if(ele == 2){
            this.tabShow = true
        }
    },
    logoutbk () {
        axios.get('http://www.xhw8888.com/index/app/deletebk?courseid=' + this.courseid, {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
        this.$dialog.alert({
            title: '',
            message: '结束成功',
        })
        this.$router.push('/Home')
      })
    }
  }
}
</script>

<style lang="less" scoped>
  .content{
    position: absolute;
    background-color: #c3cbd6;
    height: 82%;
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
    width: 80%;
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
  .course_img{
    position: relative;
    margin-left: 20px;
    margin-top: 15px;
    width: 70px;
    height: 70px;
  }
  .span1{
    display:inline-block;
    position: absolute;
    margin-top: 0px;
    height: 100px;
  }
  .span2{
    display:block;
    position: absolute;
    margin-left: 100px;
    margin-top: 18px;
    height: 100px;
    color: #8a8a8a;
    font-size: 15px;
  }
  .course_item{
    background-color: #ffffff;
    height: 100px;
    width: 100%;
    border-bottom: solid 0.5px #d3d3d3;
  }
</style>
