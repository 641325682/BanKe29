<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}">首页</x-header>
    </div>
    <div class="content">
      <div class="group">
        <div class="course_item"  v-for="(item, i) in list" :key="i" v-on:click.once="toCourse(item.courseId)">
          <span class="span1">
            <img class="course_img" src="../assets/course_img/ML.jpg">
          </span>
          <span class="span2" >
            <p ref="CourseName" >课程：{{item.courseName}}</p>
            <p ref="CourseName" >考试时间：{{item.examTime}}</p>
            <p ref="CourseName" >任课老师：{{item.teacherName}}</p>
          </span>
        </div>
      </div>
    </div>
    <div class="bottom">
      <span class="icon_course">
        <img src="../assets/course_icon.png">
      </span>
      <span class="icon_person">
        <router-link to="/PersonalCenter">
          <img src="../assets/person_icon.png">
        </router-link>
      </span>
    </div>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton } from 'vux'
import axios from 'axios'
// import qs from 'qs'
export default {
  name: 'home',
  data () {
    return {
      list: [],
      userName: ''
    }
  },
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  },
  mounted () {
    this.showData()
  },
  methods: {
    toCourse (id) {
      // this.CourseName = this.$refs.CourseName.innerText
      localStorage.setItem('courseid', id)
      console.log(id)
      this.$router.push('/PublishSign')
    },
    toPersonalCenter () {
      this.$router.push('/PersonalCenter')
    },
    goPub () {
      this.$router.push('/PublishSign')
    },
    showData () {
      //      const orderData = { 'stno': '180327001' }
      //      localStorage.setItem('courseinfo', JSON.stringify(orderData))
      //      const dataB = JSON.parse(localStorage.getItem('courseinfo'))
      this.userName = localStorage.getItem('username')
        console.log(this.userName)
      axios.get('http://47.113.124.225:8083/AllCourse', {
        params: {
          teacherid: this.userName
        }
      }).then(res => {
        this.list = res.data.data
        console.log(res)
      })
        .catch(function (error) {
          console.log(error)
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
  .list{
    position: relative;
    width: 100%;
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
</style>
