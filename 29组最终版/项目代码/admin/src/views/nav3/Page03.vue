<template>
    <div>
        <el-row>
        <el-button type="primary" @click="addprofile">添加角色</el-button>
        </el-row>
        <el-table
        :data="tableData"
        style="width: 100%">
        <el-table-column
            prop="name"
            label="角色名称"
            width="180">
        </el-table-column>
        <!-- <el-table-column
            prop="addtime"
            label="权限日期">
        </el-table-column> -->
        <el-table-column
            label="详情">
            <template slot-scope="scope">
                创建课程权限：<el-switch
                @change="switchchange(tableData[scope.$index].kepro,'kepro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].kepro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                加入班课权限：<el-switch
                @change="switchchange(tableData[scope.$index].bkpro,'bkpro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].bkpro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                学生用户管理：<el-switch
                @change="switchchange(tableData[scope.$index].xsuspro,'xsuspro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].xsuspro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                发起签到：<el-switch
                @change="switchchange(tableData[scope.$index].fqqdpro,'fqqdpro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].fqqdpro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                进行签到：<el-switch
                @change="switchchange(tableData[scope.$index].jxqdpro,'jxqdpro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].jxqdpro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                发布作业：<el-switch
                @change="switchchange(tableData[scope.$index].fbzypro,'fbzypro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].fbzypro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                发布活动：<el-switch
                @change="switchchange(tableData[scope.$index].fbhdpro,'fbhdpro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].fbhdpro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
                教师用户管理：<el-switch
                @change="switchchange(tableData[scope.$index].dlpro,'dlpro',tableData[scope.$index].id)"
                v-model="tableData[scope.$index].dlpro_bo"
                active-text=""
                inactive-text="开启">
                </el-switch>
            </template>
        </el-table-column>
        <el-table-column label="操作" >
            <template slot-scope="scope">
                <el-button type="danger" size="mini" @click="handleDel(tableData[scope.$index].id, scope.row)">删除</el-button>
            </template>
        </el-table-column>
        </el-table>
        <el-dialog
            title="添加角色"
            :visible.sync="dialogVisible"
            width="30%"
            :before-close="handleClose">
            <el-form ref="form" :model="form" label-width="180px">
                <el-form-item label="角色名称">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="submit">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>


<script>
    import util from '../../common/js/util'
      import qs from 'qs'
    //import NProgress from 'nprogress'
    import { getUserListPage, removeUser, batchRemoveUser, editUser, addUser } from '../../api/api';

    export default {
        data: function(){
            return {
                userData:[],
                checkList:[],
                value1: 1,
                form:{
                    name:'',
                    region: '',
                },
                dialogVisible:false,
                tableData: []
            }
        },
        mounted () {
            this.getData()
        },
        methods: {
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

					this.$axios.get('http://www.xhw8888.com/index/app/delepro?id='+index)
					    .then(function (response) {
							console.log(response.data);
							_this.$message({
								message: '删除成功！',
								type: 'success'
							});
							_this.getData();

						})
						.catch(function (error) {
							console.log(error);
					});


				}).catch(() => {

				});
			},
            getData () {
                this.$axios.get('http://www.xhw8888.com/index/app/getProlist', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.tableData=res.data
                })
            },
            handleClose () {
                
            },
            addprofile () {
                this.$axios.get('http://www.xhw8888.com/index/app/getUser', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.userData=res.data
                    this.dialogVisible = true
                })
                
            },
            submit () {
                var vm = this
                if(this.form.name == ''){
                  this.$message({
                        message: '名称不能为空',
                        type: 'warning'
                    });
                    return false
                }
                
                this.$axios.post('http://www.xhw8888.com/index/app/savePro',qs.stringify(
                {
                    region:this.form.region,
                    name:this.form.name,
                    // checkList:this.checkList
                    }))
                    .then(function (response) {
                        vm.dialogVisible = false
                        vm.$message({
                        message: '创建成功',
                        type: 'success'
                    });
                    vm.getData();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            switchchange (index,param,id) {
                this.$axios.get('http://www.xhw8888.com/index/app/Updatapro?id='+id+"&param="+param+"&index="+index, {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.getData()
                })
            }
        }
    }
</script>


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
