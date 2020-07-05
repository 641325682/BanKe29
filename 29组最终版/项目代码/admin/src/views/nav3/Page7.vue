<template>
<el-row >
    <!-- <el-button type="primary" @click="addFormVisible=true">添加课程</el-button> -->
    <el-table
    :data="list"
    style="width: 100%">
    <el-table-column
        prop="CourseName"
        label="课程名称："
        width="180">
    </el-table-column>
    <el-table-column
        prop="TeacherName"
        label="任课教师：">
    </el-table-column>
    <el-table-column
        prop="TeacherId"
        label="教师工号：">
    </el-table-column>
    <el-table-column
        prop="ExamTime"
        label="考试时间：">
    </el-table-column>
    <el-table-column label="操作" >
        <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(list[scope.$index].courseId, scope.row)">编辑</el-button>
            <el-button type="danger" size="mini" @click="handleDel(list[scope.$index].courseId, scope.row)">删除</el-button>
        </template>
    </el-table-column>
    </el-table>

    <el-dialog title="新增" v-model="addFormVisible" :close-on-click-modal="false">
        <el-form :model="addForm" label-width="80px" ref="addForm">

            <el-form-item label="课程名称" prop="password">
                <el-input type="text" v-model="addForm.name" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item label="老师" prop="teacher">
                <el-select v-model="addForm.teacher"  placeholder="请选择教师">
                    <!--v-model="addForm.stuClass"-->
                    <el-option
                            v-for="item in teachers"
                            :key="item.stno"
                            :label="item.name"
                            :value="item.stno"
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
</el-row>



</template>

<style>
  .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }

  .box-card {
    width: 480px;
  }

  .time {
    font-size: 13px;
    color: #999;
  }

  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }

  .clearfix:after {
      clear: both
  }

</style>


<script>
    import util from '../../common/js/util'
    //import NProgress from 'nprogress'
    import { getUserListPage, removeUser, batchRemoveUser, editUser, addUser } from '../../api/api';

    export default {
        data: function(){
            return {
			    o:'',
				gridData:[],
				list:[],
				courseid:'',
				examTime:'',
				teacherId:'',
				teacherName:'',
				courseName:'',
				courseList:[],
                teacher:[],

                addForm: {
                    stno:'',
                    password:'',
                    name: '',
                    tel: '',
                    stuClass: '',
                    academy:'',
                    major:''

                },
                addFormVisible:false,
                addLoading: false,
				seen: false,
            }
        },
        mounted () {
            this.showData()
            // this.getStuClass(this)
            // this.getTeachers(this)
        },
        methods: {
            handleEdit: function (index, row) {
                this.getDictypess()
                var _this=this;
                this.$axios.get('http://www.xhw8888.com/index/app/editKc?id='+index)
                    .then(function (response) {
                        var data = response.data
                        _this.form.data = data.name
                        _this.editId = index
                        _this.dialogVisibleDataEdit = true
                    })
                    .catch(function (error) {
                        console.log(error);
                });
            },
            handleDel: function (index, row) {
                console.log(index)
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

					this.$axios.get('http://www.xhw8888.com/index/app/deleKc?id='+index)
					    .then(function (response) {
							console.log(response.data);
							_this.$message({
								message: '删除成功！',
								type: 'success'
							});
							_this.showData();

						})
						.catch(function (error) {
							console.log(error);
					});


				}).catch(() => {

				});
			},
            visible:function(){
                this.seen = true;
            },
            handleAdd: function () {
                this.addFormVisible = true;
                this.addForm = {
                    stno:'',
                    password:'',
                    stuClass:'',
                    name: '',
                    tel: '',
                    academy:'',
                    major:''
                };
            },
            invisible:function(){
            this.seen = false;
        },
        showData () {
            //      const orderData = { 'stno': '180327001' }
            //      localStorage.setItem('courseinfo', JSON.stringify(orderData))
            //      const dataB = JSON.parse(localStorage.getItem('courseinfo'))
            this.userName = localStorage.getItem('username')
            console.log(this.userName)
            this.$axios.get('http://www.xhw8888.com/index/app/AllCourse', {
                params: {
                    teacherid: this.userName
                }
            }).then(res => {
                this.list = res.data
                console.log(res)
            })
                .catch(function (error) {
                    console.log(error)
                })
        },

            addSubmit: function(){

                this.$refs.addForm.validate((valid) => {
                        if (valid) {
                            this.$confirm('确认提交吗？', '提示', {}).then(() => {
                                this.addLoading = true;
                                var addParams = {
                                    name: this.addForm.name,
                                    stuClass: this.addForm.stuClass,
                                    teacher: this.addForm.teacher,
                                };
                                var formData =new FormData();
                                formData.append('name',addParams.name);
                                formData.append('stuClass',addParams.stuClass);
                                formData.append('teacher',addParams.teacher);
                                var sec_this=this;
                                sec_this.$axios.put('http://47.113.124.225:8083/course/add', formData)
                                    .then(function (response) {
                                        console.log(response.data);
                                    })
                                    .catch(function (error) {
                                        console.log(error);
                                    });
                            });
                        } else {
                            console.log('error submit!!');
                            return false;
                        }

            })
            },
            //获取所有班级
            getStuClass: function (a) {
                this.$axios.get('http://47.113.124.225:8083/c/getAll',)
                    .then(function (response) {
                        a.stuClasss = response.data.data;   //交给前端显示
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            //获取所有班级
            getTeachers: function (a) {
                this.$axios.get('http://47.113.124.225:8083/Teacher/Page',{params:{indexpage:1,everypage:999}})
                    .then(function (response) {
                        a.teachers = response.data.data;   //交给前端显示
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },

            getCourse(o){

		    console.log(o);
			var para = {
					courseid: o,
					//name: this.filters.name
				};
				console.log(para.courseid);
				var second_this = this;
				this.$axios.get('http://47.113.124.225:8083/CourseMsg',{params:{courseid:para.courseid}})
				.then(function (response) {
					//console.log(response.data["data"]);

					second_this.gridData = response.data["data"];   //交给前端显示
					second_this.courseid= response.data["data"]["courseId"];
					second_this.courseName= response.data["data"]["courseName"];
					second_this.teacherName= response.data["data"]["teacherName"];
					second_this.teacherId= response.data["data"]["teacherId"];
					second_this.examTime= response.data["data"]["examTime"];

				})
				.catch(function (error) {
					console.log(error);
				});
		},

            onSubmit() {
                this.$message.success('提交成功！');
            }
        }
    }
</script>


