<template>
  <div>
    <van-row>
      <van-col span="20">
        <van-tabs active="b" @change="onChange" type="card" title-active-color="#00cc66"	>
          <van-tab title="我创建的" name="a" v-if="roleId == 2">
                <div class="content" v-if="!listShow">
                  <div class="group">
                    <div class="course_item"  v-for="(item, i) in list" :key="i" v-on:click="toCourse(item.CourseId)">
                      <span class="span1">
                        <img  class="course_img" src="../assets/course_img/ML.jpg">
                      </span>
                      <span class="span2" >
                        <p ref="CourseName" >课程：{{item.CourseName}}</p>
                        <p ref="CourseName" >考试时间：{{item.ExamTime}}</p>
                        <p ref="CourseName" >任课老师：{{item.TeacherName}}</p>
                      </span>
                    </div>
                  </div>
                </div>
                <p v-if="listShow" style="text-align: center;
                color: #3399ff;
                line-height: 35;">你还没有创建班课哦~</p>
          </van-tab>
          <van-tab title="我加入的" name="b">
            <div class="content" v-if="!listShow">
                  <div class="group">
                    <div class="course_item"  v-for="(item, i) in list" :key="i" v-on:click="toCoursemy(item.CourseId)">
                      <span class="span1">
                        <img  class="course_img" src="../assets/course_img/ML.jpg">
                      </span>
                      <span class="span2" >
                        <p ref="CourseName" >课程：{{item.CourseName}}</p>
                        <p ref="CourseName" >考试时间：{{item.ExamTime}}</p>
                        <p ref="CourseName" >任课老师：{{item.TeacherName}}</p>
                      </span>
                    </div>
                  </div>
                </div>
                <p v-if="listShow" style="text-align: center;
                color: #3399ff;
                line-height: 35;">你还没有加入班课哦~</p>
          </van-tab>
        </van-tabs>
      </van-col>
      <van-col span="4">
        <popover placement="bottom" style="left: 313px;" @on-show="onShow" @on-hide="onHide">
            <div slot="content" style="background: #fff;color: #35495e;" class="popover-demo-content">
              <div class="weui-cell vux-tap-active weui-cell_access" @click="togurl(1)">
                <div class="weui-cell__hd"></div>
                <div class="vux-cell-bd vux-cell-primary">
                  <p>
                <label class="vux-label">加入班课</label>
                </p>
                <span class="vux-label-desc">
                </span>
                </div>
                <div class="weui-cell__ft">
                </div>
              </div>
              <div v-if="roleId == 2" class="weui-cell vux-tap-active weui-cell_access" @click="togurl(2)">
                <div class="weui-cell__hd"></div>
                <div class="vux-cell-bd vux-cell-primary">
                  <p>
                <label class="vux-label">创建班课</label>
                </p>
                <span class="vux-label-desc">
                </span>
                </div>
                <div class="weui-cell__ft">
                </div>
              </div>
              <div class="weui-cell vux-tap-active weui-cell_access" @click="togurl(3)">
                <div class="weui-cell__hd"></div>
                <div class="vux-cell-bd vux-cell-primary">
                  <p>
                <label class="vux-label">扫一扫</label>
                </p>
                <span class="vux-label-desc">
                </span>
                </div>
                <div class="weui-cell__ft">
                </div>
              </div>
            </div>
            <!-- <button class="btn btn-default">sdaas</button> -->
            <van-icon name="plus" size="40px" color="#00cc66"/>
          </popover>
      </van-col>
    </van-row>
    <br/>
    <br/>
    <tabbar>
    <tabbar-item @on-item-click="senTog(1)">
      <img slot="icon" src="../assets/course_icon.png">
      <span slot="label">班课</span>
    </tabbar-item>
    <tabbar-item show-dot @on-item-click="senTog(2)">
      <img slot="icon" src="../assets/person_icon.png">
      <span slot="label">我的</span>
    </tabbar-item>
  </tabbar>
  </div>
</template>

<script>
import { Popover, Flexbox, FlexboxItem, Tab, TabItem, Tabbar, TabbarItem, Group, Cell, XHeader, XInput, XButton } from 'vux'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'home',
  data () {
    return {
      list: [],
      userName: '',
      imgPath: '',
      roleId:2,
      userId:'',
      listShow:false,
      active:'b'
    }
  },
  components: {
    Popover,
    Flexbox,
    FlexboxItem,
    Tab,
    TabItem,
    Tabbar,
    TabbarItem,
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  },
  mounted () {
    this.roleId = localStorage.getItem('roleId')
    this.userId = localStorage.getItem('userId')
    // if (this.roleId == 2){
    //   this.active = 'a'
    // }else{
    //   this.active = 'b'
    // }
    this.active = 'b'
    //location.reload()
    this.showData()
    this.roleId = localStorage.getItem('roleId')
    // this.showDataList()
  },
  methods: {
    toCourse (id) {
      localStorage.setItem('courseid', id)
      this.$router.push('/bkxq')
    },
    toCoursemy (id) {
      localStorage.setItem('courseid', id)
      this.$router.push('/xxbkxq')
    },
    toPersonalCenter () {
      this.$router.push('/PersonalCenter')
    },
    showData () {
      this.userName = localStorage.getItem('username')
      axios.post('http://www.xhw8888.com/index/app/Course', qs.stringify({
        userid: this.userId,
        active: this.active
      }), {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
        if(res.data == 'no'){
          this.list = []
          this.listShow = true
        }else{
          this.listShow = false
          this.list = res.data
        }
        
      })
        .catch(function (error) {
          console.log(error)
        })
    },
    onShow () {
      console.log('on show')
    },
    onHide () {
      console.log('on hide')
    },
    togurl (ele) {
      if (ele == 1) {
        this.$router.push('/addbk')
      }
      if (ele == 2) {
        this.$router.push('/Createcourse')
      }
      if (ele == 3) {
        this.$router.push('/sys')
      }
    },
    senTog (ele) {
      // eslint-disable-next-line eqeqeq
      if (ele == 1) {
        this.$router.push('/Home')
      } else {
        this.$router.push('/PersonalCenter')
      }
    },
    onChange (ele) {
      this.active = ele
      this.showData()
    }
  }
}
</script>

<style lang="less" scoped>
  @import '~vux/src/styles/1px.less';
@import '~vux/src/styles/center.less';
  .content{
    position: absolute;
    background-color: #fafbf9;
    height: 93%;
    width: 100%;
  }
  .bottom{
    position: absolute;
    width: 100%;
    height: 5%;
    background-color: #ffffff;
    bottom: 10px;
    border-top: solid 0.5px #d3d3d3;
  }
  .icon_course{
    position: relative;
    margin-left: 80px;
    top: 5px;
  }
  .icon_person{
    position: relative;
    margin-left: 180px;
    top: 5px;
  }
  .course_item{
    background-color: #ffffff;
    height: 100px;
    width: 100%;
    border-bottom: solid 0.5px #d3d3d3;
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
  a{
    text-decoration:none;
    font-size: 16px;
    color: #8a8a8a;
  }
  .course_img{
    position: relative;
    margin-left: 20px;
    margin-top: 15px;
    width: 70px;
    height: 70px;
  }
  .course_name{
    position: relative;
    top: 15px;
  }
.box {
  padding: 15px;
}
.active-6-1 {
  color: rgb(252, 55, 140) !important;
  border-color: rgb(252, 55, 140) !important;
}
.active-6-2 {
  color: #04be02 !important;
  border-color: #04be02 !important;
}
.active-6-3 {
  color: rgb(55, 174, 252) !important;
  border-color: rgb(55, 174, 252) !important;
}
.tab-swiper {
  background-color: #fff;
  height: 100px;
}
</style>
