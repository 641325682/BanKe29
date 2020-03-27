import Vue from 'vue'
import vueRouter from 'vue-router'
import Container from '@/components/Container.vue'
Vue.use(vueRouter)

const routes = [{
		path: '/',
		component: () => import('@/components/login/Login.vue'),
		children: [{
			name: 'login',
			path: '/login',


		}]
	},
	{
		path: '/home',
		component: Container,
		children: [{
			path: '/home',
			component: () => import('@/components/home/Home.vue')
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
			component: () => import('@/components/errPage/Page404.vue'),
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
			component: () => import('@/components/errPage/Page403.vue')
		}, {
			path: '/errPage/500',
			name: 'errPage500',
			hidden: false,
			meta: {
				title: '服务器出错',
				noCache: true
			},
			component: () => import('@/components/errPage/Page500.vue')
		}]
	}
]

const router = new vueRouter({
	routes,
	mode: 'history'
})

export default router
