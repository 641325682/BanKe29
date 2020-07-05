import Vue from 'vue'
import Router from 'vue-router'
import Register from '@/pages/register'
import ForgetPassword from '@/pages/ForgetPassword'
import Login from '@/pages/Login'
import Home from '@/pages/Home'
import AboutUs from '@/pages/AboutUs'
import Course from '@/pages/Course'
import ModifyPassword from '@/pages/ModifyPassword'
import PersonalCenter from '@/pages/PersonalCenter'
import PersonalInfo from '@/pages/PersonalInfo'
import PublishSign from '@/pages/PublishSign'
import SignIn from '@/pages/SignIn'
import ModifyImg from '@/pages/ModifyImg'
import CheckUpdate from '@/pages/CheckUpdate'
import PerfectInfo from '@/pages/PerfectInfo'
import TeacherHome from '@/pages/TeacherHome'
import TeacherSignrecord from '@/pages/TeacherSignrecord'
import SignResult from '@/pages/SignResult'
import SuccessSign from '@/pages/SuccessSign'
import Createcourse from '@/pages/Createcourse'
import bkxq from '@/pages/bkxq'
import addbk from '@/pages/addbk'
import xxbkxq from '@/pages/xxbkxq'
import sys from '@/pages/sys'
import erwm from '@/pages/erwm'
Vue.use(Router)
export default new Router({
  mode: 'hash',
  routes: [
    {
      path: '/erwm', /* 注册 */
      name: 'erwm',
      meta: {
        isLogin: true
      },
      component: erwm
    },
    {
      path: '/sys', /* 注册 */
      name: 'sys',
      meta: {
        isLogin: true
      },
      component: sys
    },

    {
      path: '/xxbkxq', /* 注册 */
      name: 'xxbkxq',
      meta: {
        isLogin: true
      },
      component: xxbkxq
    },
    {
      path: '/addbk', /* 注册 */
      name: 'addbk',
      meta: {
        isLogin: true
      },
      component: addbk
    },
    {
      path: '/Register', /* 注册 */
      name: 'Register',
      meta: {
        isLogin: false
      },
      component: Register
    },
    {
      path: '/Forgetpassword', /* 忘记密码 */
      name: 'Forgetpassword',
      meta: {
        isLogin: false
      },
      component: ForgetPassword
    },
    {
      path: '/', /* 登陆 */
      name: 'Login',
      meta: {
        isLogin: false
      },
      component: Login
    },
    {
      path: '/Home', /* 学生主页 */
      name: 'Home',
      meta: {
        isLogin: true
      },
      component: Home
    },
    {
      path: '/AboutUs', /* 关于我们 */
      name: 'AboutUs',
      meta: {
        isLogin: true
      },
      component: AboutUs
    },
    {
      path: '/PersonalCenter', /* 个人中心 */
      name: 'PersonalCenter',
      meta: {
        isLogin: true
      },
      component: PersonalCenter
    },
    {
      path: '/ModifyPassword', /* 修改密码 */
      name: 'ModifyPassword',
      meta: {
        isLogin: true
      },
      component: ModifyPassword
    },
    {
      path: '/PersonalInfo', /* 个人信息 */
      name: 'PersonalInfo',
      meta: {
        isLogin: true
      },
      component: PersonalInfo
    },
    {
      path: '/PublishSign', /* 教师发布签到 */
      name: 'PublishSign',
      meta: {
        isLogin: true
      },
      component: PublishSign
    },
    {
      path: '/SignIn', /* 学生签到 */
      name: 'SignIn',
      meta: {
        isLogin: true
      },
      component: SignIn
    },
    {
      path: '/SignResult', /* 签到结果 */
      name: 'SignResult',
      meta: {
        isLogin: true
      },
      component: SignResult
    },
    {
      path: '/ModifyImg', /* 修改头像 */
      name: 'ModifyImg',
      meta: {
        isLogin: true
      },
      component: ModifyImg
    },
    {
      path: '/CheckUpdate', /* 检查更新 */
      name: 'CheckUpdate',
      meta: {
        isLogin: true
      },
      component: CheckUpdate
    },
    {
      path: '/PerfectInfo', /* 完善个人信息 */
      name: 'PerfectInfo',
      meta: {
        isLogin: false
      },
      component: PerfectInfo
    },
    {
      path: '/Course', /* 课程详情 */
      name: 'Course',
      meta: {
        isLogin: true
      },
      component: Course
    },
    {
      path: '/TeacherHome', /* 老师主页 */
      name: 'TeacherHome',
      meta: {
        isLogin: true
      },
      component: TeacherHome
    },
    {
      path: '/TeacherSignrecord', /* 老师签到 */
      name: 'TeacherSignrecord',
      meta: {
        isLogin: true
      },
      component: TeacherSignrecord
    },
    {
      path: '/PublishSign', /* 老师签到 */
      name: 'PublishSign',
      meta: {
        isLogin: true
      },
      component: PublishSign
    },
    {
      path: '/SuccessSign', /* 老师签到 */
      name: 'SuccessSign',
      meta: {
        isLogin: true
      },
      component: SuccessSign
    },
    {
      path: '/Createcourse', /* 老师签到 */
      name: 'Createcourse',
      meta: {
        isLogin: true
      },
      component: Createcourse
    },
    {
      path: '/bkxq', /* 老师签到 */
      name: 'bkxq',
      meta: {
        isLogin: true
      },
      component: bkxq
    }
  ]
})
