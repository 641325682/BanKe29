<template>
    <div class="app">
        <el-container>
            <el-aside class="app-side app-side-left">
                      <!-- :class="isCollapse ? 'app-side-collapsed' : 'app-side-expanded'"> -->
                <!-- <checkin-sidebar></checkin-sidebar> -->
            </el-aside>

            <el-container>
                <el-header class="app-header">
                   <checkin-navbar></checkin-navbar>
                </el-header>

                <el-main class="app-body">
                    <transition name="fade" mode="out-in">
                        <router-view/>
                    </transition>
                </el-main>
                <el-footer class="app-footer">Copyright © 2020 Build By 第29小组</el-footer>
            </el-container>
        </el-container>	
    </div>
</template>

<script>
		// import CheckinSidebar from './sidebar/CheckinSidebar';
    import CheckinNavbar from '@/components/sidebar/CheckinNavbar'
		export default {
					name: 'home',
					components: {
							// CheckinSidebar, 
							CheckinNavbar
					},
				}
</script>

		<style>
			.el-header {
				background-color: #B3C0D1;
				color: #333;
				line-height: 60px;
			}
			
			.el-aside {
				color: #333;
			}
	</style>