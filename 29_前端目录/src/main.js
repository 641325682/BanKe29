import Vue from 'vue'
import App from './App.vue'
import './plugins/element.js'
import ElementUI from 'element-ui';
import router from './router/index.js'
import store from './store/index.js'
import 'element-ui/lib/theme-chalk/index.css';
import '@/styles/index.less'
import './permission';
import 'normalize.css';
import Icon from 'vue2-svg-icon/Icon';
Vue.component('icon', Icon);  
Vue.config.productionTip = false

Vue.use(ElementUI);

new Vue({
  render: h => h(App),
  store,
  router,
}).$mount('#app')
