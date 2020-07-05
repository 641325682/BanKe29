<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}">个人信息</x-header>
    </div>
    <div>
      <div class="list">
        <group>
          <cell :title="'姓名'" ><input type="text" v-model="name" ></cell>
          <cell :title="'学号'" ><input type="text" v-model="stno" disabled></cell>
          <cell :title="'性别'" ><input type="text" v-model="sex" disabled></cell>
          <cell :title="'学校'" ><input type="text" v-model="xuexiao"></cell>
          <cell :title="'学院'" ><input type="text" v-model="academy"></cell>
          <cell :title="'专业'" ><input type="text" v-model="majors"></cell>
          <cell :title="'手机'" ><input type="text" v-model="tel"></cell>
        </group>
        <x-button type="primary" style="margin-top: 30px;width: 288px;border-radius: 10px;" action-type="button" @click.native="check()">确认</x-button>
      </div>
    </div>
  </div>
</template>

<script>
import { Group, Cell, XHeader, XInput, XButton } from 'vux'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'PersonalInfo',
  components: {
    Group,
    Cell,
    XHeader,
    XInput,
    XButton
  },
  data () {
    return {
      userName: '',
      name: '',
      majors: '',
      academy: '',
      tel: '',
      stno: '',
      xuexiao:'',
      sex:'',
      list: []
    }
  },
  mounted () {
    this.showData()
  },
  // 存放方法
  methods: {
    showData: function () {
      this.userName = localStorage.getItem('username')
      console.log(this.userName)
      axios.get('http://www.xhw8888.com/index/app/SelfUserInfo?stno='+this.userName).then((response) => {
        // 响应正确回
        this.name = response.data.Name
        this.majors = response.data.Major
        this.academy = response.data.Academy
        this.stno = response.data.STNo
        this.tel = response.data.Tel
        this.sex = response.data.sex
        this.xuexiao = response.data.xuexiao
      }, (response) => {
        // 响应错误回调
      })
    },
    check () {
      var sex;
      var uid = localStorage.getItem('username')
      axios.post('http://www.xhw8888.com/index/app/Bcuserinfo', qs.stringify({
            name: this.name,
            majors: this.majors,
            academy: this.academy,
            stno: this.stno,
            tel: this.tel,
            xuexiao : this.xuexiao,
            uid : uid
          }), {
        emulateJSON: true
      }, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      }).then(res => {
            this.$dialog.alert({
                title: '',
                message: '编辑成功',
            })
            this.showData()
          })
    }
  }
}
</script>

<style lang="less" scoped>
  .flex-demo{
    font-weight: 500;
    font-size: 15px;
  }
</style>
