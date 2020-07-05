<template>
  <div id="headerPadding">
    <view-box >
      <x-header :left-options="{backText: ''}">完善个人资料</x-header>
    </view-box>
    <div class="RegisterMid">
      <!--<checklist title="您是老师还是学生？" :options="commonList" v-model="radioValue" :max="1" @on-change="change"></checklist>-->
      <!--<checker  v-model="demo2" default-item-class="demo2-item" selected-item-class="demo2-item-selected">-->
      <div style="padding-left: 13px">
        <label>你的身份是</label>
        <label class="label1"><input  type="radio" name="type" value="1"  v-model="param">学生</label>
        <label><input  type="radio" name="type" value="2" v-model="param">教师</label>
      </div>
      <br/>
      <x-input placeholder="" v-model="names"  title="名字:">
      </x-input>
      <x-input placeholder="" class="weui_vcode" style="padding-right:0" v-model="major"  title="专业:">
        <x-button slot="right" mini    ></x-button>
      </x-input>
      <x-input placeholder="" class="weui_vcode" style="padding-right:0" v-model="academy" title="学院:">
      </x-input>
      <x-input placeholder="" class="weui_vcode" style="padding-right:0" v-model="classid" title="班级:">
      </x-input>
    </div>
    <x-button type="primary" style="margin-top: 30px;width: 288px;border-radius: 10px;" action-type="button" @click.native="check()">确认</x-button>

  </div>
</template>

<script>
import { XHeader, CheckIcon, XButton, XSwitch, AlertModule, Alert, Checker, CheckerItem } from 'vux'
import ViewBox from '../../node_modules/vux/src/components/view-box/index.vue'
import XInput from '../../node_modules/vux/src/components/x-input/index.vue'
import Group from '../../node_modules/vux/src/components/group/index.vue'
import axios from 'axios'
import qs from 'qs'
export default {
  name: 'PerfectInfo',
  data () {
    return {
      names: '',
      major: '',
      academy: '',
      classid: '',
      param: 1
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
    AlertModule,
    Checker,
    CheckerItem
  },
  methods: {
    check: function () {
      if (this.names === '') {
        console.log('名字不能为空')
      } else if (this.major === '') {
        console.log('专业不能为空')
      } else if (this.academy === '') {
        console.log('学院不能为空')
      } else {
        const dataB = JSON.parse(localStorage.getItem('info'))
        axios.put('http://47.113.124.225:8083/user', qs.stringify({
          stno: dataB.stno,
          name: this.names,
          tel: dataB.tel,
          academy: this.academy,
          major: this.major,
          roleid: this.param,
          classid: this.classid
        }), {
          emulateJSON: true
        }, {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
          }
        }).then(res => {
          if (res.data.code === 200) {
            console.log(res.data.code)
            console.log('注册成功')
            this.$router.push('/')
          }
        }).catch(function (error) {
          console.log(error)
        })
      }
    },
    change (val, label) {
      console.log('change', val, label)
    },
    getRadioVal (event) {
      let radioVal = event.target.value
      console.log(radioVal)
    }
  }
}

</script>
<style>
  #headerPadding{
    padding: 0px;
  }
  .RegisterMid{
    padding:0 10px 10px 10px;
  }
  .cell-x-icon {

    display: block;

    fill: #ffffff;

  }
  .demo2-item {
    width: 40px;
    height: 40px;
    border: 1px solid #ccc;
    display: inline-block;
    border-radius: 50%;
    line-height: 40px;
    text-align: center;
  }
  .demo2-item-selected {
    border-color: green;
  }
  .label1{
    padding-right: 20px;
  }
</style>
