import Login from './views/Login.vue'
import NotFound from './views/404.vue'
import Home from './views/Home.vue'
import Main from './views/Main.vue'
import Page08 from './views/nav3/Page08.vue'
import Teacher from './views/nav1/Teacher.vue'
import Student from './views/nav1/Student.vue'
import user from './views/nav1/user.vue'
import Page4 from './views/nav2/Page4.vue'
import Page5 from './views/nav2/Page5.vue'
import Page6 from './views/nav2/Page6.vue'
import Page7 from './views/nav3/Page7.vue'
import Page8 from './views/nav3/Page8.vue'
import Page01 from './views/nav3/Page01.vue'
import Page02 from './views/nav3/Page02.vue'
import Page03 from './views/nav3/Page03.vue'
import Page04 from './views/nav3/Page04.vue'
import Page05 from './views/nav3/Page05.vue'
import Page06 from './views/nav3/Page06.vue'
import Page07 from './views/nav3/Page07.vue'
import echarts from './views/charts/echarts.vue'

let routes = [
    {
        path: '/login',
        component: Login,
        name: '',
        hidden: true
    },
    {
        path: '/404',
        component: NotFound,
        name: '',
        hidden: true
    },
    //{ path: '/main', component: Main },
    {
        path: '/',
        component: Home,
        name: '权限管理',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Fire', component: Page08, name: '权限管理' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '数据字典',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Dic', component: Page05, name: '数据列表' },
            { path: '/Type', component: Page06, name: '类型列表' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '菜单管理',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Menu', component: Page04, name: '菜单管理' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '组织结构',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Orgstruct', component: Page02, name: '组织结构' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '用户管理',
        iconCls: 'el-icon-message',//图标样式class
        children: [
            { path: '/main', component: Main, name: '主页' , hidden: true },
            { path: '/Teacher', component: Teacher, name: '教师管理'  },
            { path: '/Student', component: Student, name: '学生管理'  },
            { path: '/Admin', component: Page07, name: '管理员'  },
            // { path: '/user', component: user, name: '列表' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '参数设置',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Paramsetting', component: Page01, name: '参数设置' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: '角色管理',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/Profile', component: Page03, name: '角色管理' },
        ]
    },
    
    {
        path: '/',
        component: Home,
        name: '课程管理',
        iconCls: 'fa fa-address-card',
        children: [
            { path: '/ClassSearch', component: Page7, name: '课程查询' },
        ]
    },
    {
        path: '/',
        component: Home,
        name: 'Charts',
        iconCls: 'fa fa-bar-chart',
		hidden: true,
        children: [
            { path: '/echarts', component: echarts, name: 'echarts' }
        ]
    },
    {
        path: '*',
        hidden: true,
        redirect: { path: '/404' }
    }
];

export default routes;
