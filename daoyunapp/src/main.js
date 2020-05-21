import Vue from 'vue'
import 'normalize.css/normalize.css'// A modern alternative to CSS resets
import App from './App.vue'
import router from './router'
import store from './store'
import Mint from 'mint-ui'
import 'mint-ui/lib/style.css'
import 'font-awesome/css/font-awesome.min.css'


Vue.use(Mint);
Vue.config.productionTip = false;

// document.addEventListener('deviceready',function () {
    new Vue({
        router,
        store,
        render: h => h(App)
    }).$mount('#app');
// },false);

