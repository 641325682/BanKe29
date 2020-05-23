import Vue from 'vue'
import Router from 'vue-router'
import Layout from './views/layout/Layout';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/home',
            redirect:'/discovery/index',
            name: 'home',
            component: Layout,
            children: [
                {path: '/discovery/index', component: () => import('./views/discovery/DiscoveryIndex.vue')},
                {path: '/profile/index', component: () => import('./views/profile/ProfileIndex.vue')},
                {path: '/schedule/index', component: () => import('./views/schedule/ScheduleIndex.vue')}
            ]
        },
        {
            path: '/about',
            name: 'about',
            component: () => import('./views/About.vue')
        },
        {
            path: '/',
            name: 'login',
            component: () => import('./views/login/Login.vue'),
        },
        {
            path: '/camera',
            name: 'camera',
            component: () => import('./views/common/Camera'),
        }
    ]
})
