// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import './assets/css/index.css'
import Axios from 'axios'
import store from './store'
import Vuex from 'vuex'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import iView from 'iview'
import 'iview/dist/styles/iview.css'
import Vant from 'vant';
import 'vant/lib/index.css';
import vueJsonp from 'vue-jsonp'
import { FontAwesomeIcon, FontAwesomeLayers, FontAwesomeLayersText } from '@fortawesome/vue-fontawesome'
Vue.config.productionTip = false
Vue.prototype.$axios = Axios
library.add(fas, far, fab)
Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('font-awesome-layers', FontAwesomeLayers)
Vue.component('font-awesome-layers-text', FontAwesomeLayersText)
/* eslint-disable no-new */
Vue.use(iView)
Vue.use(Vuex)
Vue.use(Vant)
Vue.use(vueJsonp)
vueJsonp.install
console.log(vueJsonp.install)
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
Vue.prototype.HOST = '/api'
router.beforeEach((to, from, next) => {
  console.log(to)
  // 获取用户登录成功后储存的登录标志
  let getFlag = localStorage.getItem('Flag')
  let isStudent = localStorage.getItem('isStudent')

  // 如果登录标志存在且为isLogin，即用户已登录
  if (getFlag === 'isLogin') {
    // 设置vuex登录状态为已登录
    store.state.isLogin = true
    next()
    // 如果已登录，还想进入登录注册界面，则定向回首页
    if (!to.meta.isLogin) {
      iView.Message.error('请先退出登录')
      if (isStudent === '1') {
        next({
          path: '/home'
        })
      } else {
        next({
          path: '/TeacherHome'
        })
      }
    }
    // 如果登录标志不存在，即未登录
  } else {
    // 用户想进入需要登录的页面，则定向回登录界面
    if (to.meta.isLogin) {
      next({
        path: '/'
      })
      // iViewUi友好提示
      iView.Message.error('请先登录')
      // 用户进入无需登录的界面，则跳转继续
    } else {
      next()
    }
  }
})

router.afterEach(route => {
  window.scroll(0, 0)
})
