<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}" style="background-color: #3399ff;">加入班课</x-header>
    </div>
    <br>
    <van-row>
      <van-col span="20">
        <van-search v-model="serche_key" placeholder="请输入搜索关键词" />
      </van-col>
      <van-col span="4">
        <van-button type="primary" size="small" @click="serach">搜索</van-button>
      </van-col>
    </van-row>
    <div v-if="isShow">
      <van-cell-group v-for="(item, i) in data_list" :key="i" @click="sendBk(item.CourseId,item.show)">
        <van-cell v-if="item.show == 0" :title="item.CourseName" value="加入" :label="item.CourseId" />
        <van-cell v-if="item.show == 1" :title="item.CourseName" value="已加入" :label="item.CourseId" />
      </van-cell-group>
    </div>
    
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
      serche_key : '',
      data_list:[],
      isShow:false
    }
  },
  directives: {
    TransferDom
  },
  mounted () {
    var id = this.$route.query.id
    this.userId = localStorage.getItem('userId')
    this.username = localStorage.getItem('username')
    this.courseid = localStorage.getItem('courseid')
    if (id != undefined){
      this.serche_key = id
      this.serach()
    }
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
    serach () {
      axios.get('http://www.xhw8888.com/index/app/serach?key=' + this.serche_key + "&userid=" + this.userId, {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
        console.log(res)
        if(res.data != 'no'){
          this.isShow = true
          this.data_list = res.data
        }else{
           this.isShow = false
        }
        // 
      })
    },
    sendBk (id,show) {
      if(show == 1){
        return false;
      }
      this.$dialog.confirm({
        title: '提示',
        message: '确认加入吗？',
      })
      .then(() => {
        // on confirm
        axios.get('http://www.xhw8888.com/index/app/addbk?coursid=' + id + "&userid=" + this.userId, {
            emulateJSON: true
          }, {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
            }
          }).then(res => {
            if(res.data == 1){
              this.$dialog.alert({
                title: '',
                message: '加入成功',
              })
              this.serach();
            }
            // if(res.data != 'no'){
            //   this.isShow = true
            //   this.data_list = res.data
            // }else{
            //   this.isShow = false
            // }
          })
      })
      .catch(() => {
        // on cancel
        console.log(222222222)
      });
    }
  }
}
</script>

<style lang="less" scoped>
  .content{
    position: absolute;
    background-color: #c3cbd6;
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
</style>
