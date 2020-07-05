<template>
	<section>
		<!--工具条-->
		<el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
			<el-form :inline="true" :model="filters">
				<el-form-item>
					<el-input v-model="filters.name" placeholder="请输入签到号"></el-input>
				</el-form-item>
				<el-form-item>
					<el-button type="primary" v-on:click="findUser">查询</el-button>
				</el-form-item>
			</el-form>
		</el-col>

		<!--列表-->
		<el-table :data="signdata" highlight-current-row  style="width: 100%;">
			<el-table-column type="selection" >
			</el-table-column>
			<el-table-column prop="studentId" label="学号" >
			</el-table-column>
			<el-table-column prop="signTime" label="签到时间" >
			</el-table-column>
			<el-table-column prop="signRecordId" label="签到序号">
			</el-table-column>

		</el-table>



	</section>
</template>

<script>
	import util from '../../common/js/util'
	//import NProgress from 'nprogress'
	import { getUserListPage, removeUser, batchRemoveUser, editUser, addUser } from '../../api/api';

	export default {
		data() {
			return {
				filters: {
					name: ''
				},
				signdata: [],


			}
		},
		methods: {

		/*
		currentSel(val) {
			var para = {
					name: this.filters.name,
					courseid: val,
				};
			console.log(para.name);
			console.log(para.courseid);
			var second_this=this;
			this.$axios.get('http://47.113.124.225:8083/Student/SignRecord',{params:{courseid:para.courseid, studentid:para.name}})
				.then(function (response) {
					console.log(response.data);

					second_this.signdata = response.data["data"];   //交给前端显示


				})
				.catch(function (error) {
					console.log(error);
				});

		},
		*/


			findUser() {
				var para = {
					name: this.filters.name
				};
				console.log(para.name);
				var second_this = this;
				this.$axios.get('http://47.113.124.225:8083/Teacher/SignRecord?',{params:{signid:para.name}})
				.then(function (response) {
					console.log(response.data);
					console.log(response.data["data"]);

					second_this.signdata = response.data["data"];   //交给前端显示

				})
				.catch(function (error) {
					console.log(error);
				});
			},
		},
		mounted() {
		}
	}

</script>

<style scoped>

</style>
