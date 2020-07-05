<template>
	<section>
		<!--工具条-->
		<el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
			<el-form :inline="true" :model="filters">
				<el-form-item>
					<el-input v-model="filters.name" placeholder="请输入姓名"></el-input>
				</el-form-item>
				<el-form-item>
					<el-button type="primary" v-on:click="findUser">查询</el-button>
				</el-form-item>
				<el-form-item>
					<el-button type="primary" @click="handleAdd">添加管理员</el-button>
				</el-form-item>

			</el-form>
		</el-col>

		<!--列表-->
		<el-table :data="users" highlight-current-row ref = "multipleTable" @selection-change="selsChange" style="width: 100%;">
			<el-table-column type="selection" >
			</el-table-column>

			<el-table-column prop="STNo" sortable label="用户名" >
			</el-table-column>
			<!-- <el-table-column prop="roleId" label="用户角色" >
			</el-table-column> -->
			<el-table-column prop="Name" label="姓名" >
			</el-table-column>
			<el-table-column prop="Tel" sortable label="手机号"  >
			</el-table-column>
			<el-table-column prop="sex" label="性别"  >
			</el-table-column>
			<el-table-column prop="xuexiao" label="学校"  >
			</el-table-column>
			<el-table-column prop="Academy" label="学院"  >
			</el-table-column>
			<el-table-column prop="Major" label="专业" >
			</el-table-column>
			<el-table-column label="操作" >
				<template slot-scope="scope">
					<el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
					<el-button type="danger" size="mini" @click="handleDel(scope.$index, scope.row)">删除</el-button>
				</template>
			</el-table-column>
		</el-table>

		<!--工具条-->
		<el-col :span="24" class="toolbar">
			<el-button type="danger" @click="batchRemove" :disabled="this.sels.length===0">批量删除</el-button>
			<el-pagination layout="prev, pager, next" @current-change="handleCurrentChange" :page-size="20" :total=100 style="float:right;">
			</el-pagination>
		</el-col>

		<!--编辑界面-->
		<el-dialog title="编辑" v-model="editFormVisible" :close-on-click-modal="false">
			<el-form :model="editForm" label-width="80px" :rules="editFormRules" ref="editForm">
				<el-form-item label="用户名" prop="stno" >
					<el-input v-model="editForm.stno" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="姓名" prop="name">
					<el-input v-model="editForm.name" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="密码" prop="password">
					<el-input type="password" v-model="editForm.password" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="手机号" prop="tel">
					<el-input v-model="editForm.tel" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="学院" prop="academy">
					<el-input v-model="editForm.academy" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="专业" prop="major">
					<el-input  v-model="editForm.major" auto-complete="off"></el-input>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button @click.native="editFormVisible = false">取消</el-button>
				<el-button type="primary" @click.native="editSubmit" :loading="editLoading">提交</el-button>
			</div>
		</el-dialog>

		<!--新增界面-->
		<el-dialog title="新增" v-model="addFormVisible" :close-on-click-modal="false">
			<el-form :model="addForm" label-width="80px" :rules="addFormRules" ref="addForm">
				<el-form-item label="用户名" prop="stno" >
					<el-input v-model="addForm.stno" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="密码" prop="password">
					<el-input type="password" v-model="addForm.password" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="姓名" prop="name">
					<el-input v-model="addForm.name" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="手机号" prop="tel">
					<el-input v-model="addForm.tel" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="学校" prop="xuexiao">
					<el-input v-model="addForm.xuexiao" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="学院" prop="academy">
					<el-input v-model="addForm.academy" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="专业" prop="major">
					<el-input  v-model="addForm.major" auto-complete="off"></el-input>
				</el-form-item>
				<el-form-item label="性别" prop="sex">
				<el-select v-model="addForm.sex"  placeholder="请选择性别">
					<el-option
						v-for="item in sexList"
						:key="item.id"
						:label="item.name"
						:value="item.id"
						>
				</el-option>
				</el-select>
				</el-form-item>
				<el-form-item label="学历" prop="xueli">
				<el-select v-model="addForm.xueli"  placeholder="请选择学历">
					<el-option
						v-for="item in xueliList"
						:key="item.id"
						:label="item.name"
						:value="item.id"
						>
				</el-option>
				</el-select>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button @click.native="addFormVisible = false">取消</el-button>
				<el-button type="primary" @click.native="addSubmit" :loading="addLoading">提交</el-button>
			</div>
		</el-dialog>


	</section>
</template>

<script>
	import util from '../../common/js/util'
	//import NProgress from 'nprogress'
	import qs from 'qs'
	import { getUserListPage, removeUser, batchRemoveUser, editUser, addUser } from '../../api/api';

	export default {
		data() {
			return {
				sexList:[],
				xueliList:[],
				filters: {
					name: ''
				},
				users: [],
				test_data: [],
				total: 0,
				page: 1,
				listLoading: false,
				sels: [],//列表选中列

				editFormVisible: false,//编辑界面是否显示
				editLoading: false,
				editFormRules: {
					name: [
						{ required: true, message: '请输入姓名', trigger: 'blur' }
					]
				},
				//编辑界面数据
				editForm: {

					stno:'',
					name: '',
					password:'',
					etl:'',
					academy:'',
					major:''
				},

				addFormVisible: false,//新增界面是否显示
				addLoading: false,

				addFormRules: {
				/*
					name: [
						{ required: true, message: '请输入姓名', trigger: 'blur' }
					]
			    */
				},

				//新增界面数据
				addForm: {
                    stno:'',
                    password:'',
					name: '',
					tel: '',
                    academy:'',
					major:'',
					sex:'',
					xueli:'',
					xuexiao:'',

				}

			}
		},
		methods: {

			getSex () {
				this.$axios.get('http://www.xhw8888.com/index/app/getSexlist', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.sexList=res.data
                })
			},
			getXueli () {
				this.$axios.get('http://www.xhw8888.com/index/app/getXuelilist', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.xueliList=res.data
                })
			},
			//性别显示转换
			formatSex: function (row, column) {
				return row.sex == 1 ? '男' : row.sex == 0 ? '女' : '未知';
			},


			handleCurrentChange(val) {
				this.page = val;
				console.log(this.page);
				this.getUsers();
			},

			//table start

			cancel() {
			    this.getUsers();
			},


			/* 获取并显示用户列表*/
			getUsers() {


				var para = {
					indexpage: this.page,
					everypage: 5
					//name: this.filters.name
				};
				console.log(para.indexpage);
				console.log(para.everypage);



				this.listLoading = true;  //获取数据成功
				var second_this = this;
				this.$axios.get('http://www.xhw8888.com/index/app/eacherPage')
				.then(function (response) {
					//console.log(response.data);

					second_this.users = response.data;   //交给前端显示


				})
				.catch(function (error) {
					console.log(error);
				});



			},

			findUser() {
				var para = {
					name: this.filters.name
				};
				console.log(para.name);
				this.listLoading = true;  //获取数据成功
				var second_this = this;
				this.$axios.get('http://www.xhw8888.com/index/app/searchUserss?name='+para.name)
				.then(function (response) {
					second_this.users = response.data
				})
				.catch(function (error) {
					console.log(error);
				});

			},
			//删除实现
			handleDel: function (index, row) {
				this.$confirm('确认删除该记录吗?', '提示', {
					type: 'warning'
				}).then(() => {
					this.listLoading = true;
					var _this=this;
					//NProgress.start();
					let para = { stno: row.stno };
					console.log(para.stno);

					var formData =new FormData();
					formData.append('stno',para.stno);

					this.$axios.delete('http://47.113.124.225:8083/User', {params:{stno:para.stno}})
					    .then(function (response) {
							console.log(response.data);

							_this.$message({
								message: '删除成功！',
								type: 'success'
							});
							_this.getUsers();

						})
						.catch(function (error) {
							console.log(error);
					});


				}).catch(() => {

				});
			},



			//显示编辑界面
			handleEdit: function (index, row) {
				this.editFormVisible = true;
				this.editForm = Object.assign({}, row);
			},
			//显示新增界面
			handleAdd: function () {
				this.addFormVisible = true;
				this.addForm = {
					stno:'',
                    password:'',
					name: '',
					tel: '',
                    academy:'',
                    major:''
				};
				this.getSex()
				this.getXueli()
			},
			//编辑
			editSubmit: function () {
				this.$refs.editForm.validate((valid) => {
					if (valid) {
						this.$confirm('确认提交吗？', '提示', {}).then(() => {
							this.editLoading = true;
							//NProgress.start();

							var editParams = {
							    stno: this.editForm.stno,
								name: this.editForm.name,
								password: this.editForm.password,
								tel: this.editForm.tel,
								academy: this.editForm.academy,
								major: this.editForm.major,
								roleId: 3
							};

							var formData =new FormData();
							formData.append('stno',editParams.stno);
							formData.append('name',editParams.name);
							formData.append('password',editParams.password);
							formData.append('tel',editParams.tel);
							formData.append('academy',editParams.academy);
							formData.append('major',editParams.major);
							formData.append('roleid',editParams.roleId);
							var sec_this=this;


							sec_this.$axios.delete('http://47.113.124.225:8083/User', {params:{stno:editParams.stno}})
								.then(function (response) {
								    console.log(response.data);
									//sec_this.editLoading = false;
									//sec_this.editFormVisible = false;
									//sec_this.$refs['editForm'].resetFields();  //这是重置
								})
								.catch(function (error) {
							});


							sec_this.$axios.put('http://47.113.124.225:8083/User', formData)
								.then(function (response) {
								    console.log(response.data);
									if(response.data['msg'] ==="add success")
									{
										sec_this.editLoading = false;
										sec_this.$message({
											message: '编辑成功！',
											type: 'success'
										});
										sec_this.getUsers();
										sec_this.editFormVisible = false;
										sec_this.$refs['editForm'].resetFields();  //这是重置
									}
									else{
										sec_this.editLoading = false;
										sec_this.$message({
											message: '用户已存在！请重新输入',
											type: 'error'
										});
										sec_this.editFormVisible = false;
										sec_this.$refs['editForm'].resetFields();  //这是重置

									}



								})
								.catch(function (error) {
								console.log(error);
							});





						});
					}
				});
			},
			//新增
			addSubmit: function (ev) {
				if(this.addForm.stno == '' || this.addForm.password == '' || this.addForm.name == '' || this.addForm.tel== '' || this.addForm.academy== ''||this.addForm.major == ''|| this.addForm.xuexiao== ''||this.addForm.xueli== '' ||this.addForm.sex== ''){
                    this.$message({
                        message: '存在表单项为空，请填写完整',
                        type: 'warning'
                    });
                    return false
                }
				this.$refs.addForm.validate((valid) => {
					if (valid) {
						this.$confirm('确认提交吗？', '提示', {}).then(() => {
							this.addLoading = true;
							//NProgress.start();
							//console.log(123);

							var addParams = {
							    stno: this.addForm.stno,
								password: this.addForm.password,
								classId: this.addForm.classId,
								name: this.addForm.name,
								tel: this.addForm.tel,
								academy: this.addForm.academy,
								major: this.addForm.major,
								xuexiao:this.addForm.xuexiao,
								xueli:this.addForm.xueli,
								sex:this.addForm.sex,
								roleId: 3

							};
							var formData =new FormData();
							formData.append('stno',addParams.stno);
							formData.append('password',addParams.password);
							formData.append('name',addParams.name);
							formData.append('tel',addParams.tel);
							formData.append('classId',addParams.classId);
							formData.append('academy',addParams.academy);
							formData.append('major',addParams.major);
							formData.append('roleid',addParams.roleId);
							formData.append('xuexiao',addParams.xuexiao);
							formData.append('xueli',addParams.xueli);
							formData.append('sex',addParams.sex);
							//console.log(formData.get('name'));
							var sec_this=this;


							sec_this.$axios.post('http://www.xhw8888.com/index/app/saveUserz',qs.stringify(addParams))
								.then(function (response) {
									if(response.data === 401)
									{
										sec_this.addLoading = false;
										sec_this.$message({
											message: '用户已存在！请重新输入',
											type: 'error'
										});
										sec_this.addFormVisible = false;
										sec_this.$refs['addForm'].resetFields();  //这是重置
									}
									else{
										sec_this.addLoading = false;
										sec_this.$message({
											message: '添加成功！',
											type: 'success'
										});
										sec_this.getUsers();
										sec_this.addFormVisible = false;
										sec_this.$refs['addForm'].resetFields();  //这是重置
									}



								})
								.catch(function (error) {
								console.log(error);
							});

							//this.getUsers();


						});
					} else {
                            console.log('error submit!!');
							return false;
                     }

				});
			},

			selsChange: function (sels) {
				this.sels = sels;
				//console.log(this.sels);
				//console.log(this.$refs.multipleTable.selection);
				var arr=this.$refs.multipleTable.selection;
				/*
				console.log(arr[0]);

				for ( var i = 0; i <arr.length; i++){
			         console.log(arr[i]['stno']);
				}
				*/


			},


			//批量删除
			batchRemove: function () {

				var arr=this.$refs.multipleTable.selection;
				var _this=this;

				this.$confirm('确认删除选中记录吗？', '提示', {
					type: 'warning'
				}).then(() => {

					for ( var i = 0; i <arr.length; i++){
			            console.log(arr[i]['stno']);
						let para = { stno: arr[i]['stno'] };

						_this.$axios.delete('http://47.113.124.225:8083/User', {params:{stno:para.stno}})
					    .then(function (response) {
						})
						.catch(function (error) {
							console.log(error);
					});

				    }
					var sec_this = _this;
					sec_this.$message({
							message: '删除成功！',
							type: 'success'
					});

					sec_this.getUsers();

				}).catch(() => {

				});


			}

		},
		mounted() {
			this.getUsers();
		}
	}

</script>

<style scoped>

</style>
