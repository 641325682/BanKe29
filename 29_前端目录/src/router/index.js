import Vue from 'vue'
import Router from 'vue-router'
import Container from '@/views/Container.vue'

Vue.use(Router);
const defaultRoute = [{
	path: '/login',
	name: 'login',
	component: () => import('@/views/login/Login.vue'),
	hidden: true,
	meta: {
		title: '到云',
		authFilter: false
	}
}]

export const routes = [{
		path: '/',
		component: Container,
		redirect: 'home',
		hidden: false,
		children: [{
			path: '/home',
			component: () => import('@/views/home/HomeIndex.vue'),
			name: 'home',
			hidden: false,
			meta: {
				title: '首页',
				icon: 'all',
				noCache: true,
				authFilter: false
			}
		}]
	},
	{
		path: '/systemManage',
		component: Container,
		hidden: false,
		meta: {
			title: '系统管理',
			icon: 'viewlist',
			noCache: true
		},
		name: 'systemManage',
		children: [{
			path: '/dataDictionary/index',
			name: 'dataDictionary',
			hidden: false,
			meta: {
				title: '数据字典',
				noCache: true,
				icon: 'similar-product'
			},
			component: () => import('@/views/dataDictionary/DictionaryContainer.vue')
		}]
	},
	{
		path: '/errPage',
		component: Container,
		hidden: false,
		meta: {
			title: '异常页',
			icon: 'rfq',
			noCache: true
		},
		children: [{
			path: '/errPage/404',
			component: () => import('@/views/errPage/Page404.vue'),
			name: 'errPage404',
			hidden: false,
			meta: {
				title: '找不到页面',
				noCache: true
			}
		}, {
			path: '/errPage/403',
			name: 'errPage403',
			hidden: false,
			meta: {
				title: '无权访问',
				noCache: true
			},
			component: () => import('@/views/errPage/Page403.vue')
		}, {
			path: '/errPage/500',
			name: 'errPage500',
			hidden: false,
			meta: {
				title: '服务器出错',
				noCache: true
			},
			component: () => import('@/views/errPage/Page500.vue')
		}]
	},
	{
		path: '/about',
		component: Container,
		hidden: false,
		children: [{
			path: '/about/index',
			name: 'about',
			meta: {
				title: '关于',
				icon: 'smile'
			},
			hidden: false,
			component: () => import('@/views/About.vue')
		}]
	},
	{
		path: '*',
		name: 'Page404',
		hidden: true,
		meta: {
			title: '找不到页面',
			authFilter: false
		},
		component: () => import('@/views/errPage/Page404')
	}
];

// let userRouter = getUserRoter();
//
// function getUserRoter () {
//     menuAPI.getRoleMenus().then(res => {
//         console.log('getUserMenu')
//         console.log(res);
//     })
// }

export default new Router({
	mode: 'history',
	routes: defaultRoute
})
