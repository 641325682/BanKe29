<template>
    <div>
        <el-row>
        <el-button type="primary" @click="dialogVisible=true">添加权限</el-button>
        <!-- <el-button type="primary" @click="getDictype">添加权限</el-button> -->
        </el-row>
        <el-table
        :data="dicList"
        style="width: 100%">
        <el-table-column
            prop="name"
            label="名称"
            width="180">
        </el-table-column>
        <el-table-column
            prop="addtime"
            label="日期">
        </el-table-column>
        <el-table-column label="操作" >
            <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(dicList[scope.$index].id, scope.row)">编辑</el-button>
                <el-button type="danger" size="mini" @click="handleDel(dicList[scope.$index].id, scope.row)">删除</el-button>
            </template>
        </el-table-column>
        </el-table>
        <el-dialog
            title="添加权限"
            :visible.sync="dialogVisible"
            width="30%"
            >
            <el-form ref="form" :model="form" label-width="180px">
                <el-form-item label="名称">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="adddicType">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog
            title="添加数据"
            :visible.sync="dialogVisibleData"
            width="30%"
            >
            <el-form ref="form" :model="form" label-width="180px">
                <el-form-item label="数据名称">
                    <el-input v-model="form.data" style="width:50%"></el-input>
                </el-form-item>
                <el-form-item label="类型">
                    <el-select v-model="form.region" placeholder="请选择类型">
                        <el-option v-for="item in typeData" :label="item.name" :value="item.id"></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisibleData = false">取 消</el-button>
                <el-button type="primary" @click="submit">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog
            title="编辑数据"
            :visible.sync="dialogVisibleDataEdit"
            width="30%"
            >
            <el-form ref="form" :model="form" label-width="180px">
                <el-form-item label="名称">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisibleDataEdit = false">取 消</el-button>
                <el-button type="primary" @click="submitEdit">确 定</el-button>
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
                typeData:[],
                dicList:[],
                form:{
                    name:'',
                    name_en: '',
                    data:'',
                    region:''
                },
                dialogVisible:false,
                dialogVisibleData:false,
                dialogVisibleDataEdit:false,
                tableData: [],
                editId:0,
            }
        },
        mounted () {
            this.getDicList()
        },
        methods: {
            submitEdit () {
                var _this=this;
                _this.$axios.get('http://www.xhw8888.com/index/app/editFireSubmit?id='+_this.editId+"&name="+this.form.name)
                    .then(function (response) {
                        _this.$message({
                            message: '编辑成功！',
                            type: 'success'
                        });
                        _this.dialogVisibleDataEdit = false
                        _this.getDicList()
                    })
                    .catch(function (error) {
                        console.log(error);
                });
            },
            handleEdit: function (index, row) {
                this.getDictypess()
                var _this=this;
                this.$axios.get('http://www.xhw8888.com/index/app/editfire?id='+index)
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

					this.$axios.get('http://www.xhw8888.com/index/app/delefire?id='+index)
					    .then(function (response) {
							console.log(response.data);
							_this.$message({
								message: '删除成功！',
								type: 'success'
							});
							_this.getDicList();

						})
						.catch(function (error) {
							console.log(error);
					});


				}).catch(() => {

				});
			},
            getDicList () {
                this.$axios.get('http://www.xhw8888.com/index/app/getFireList', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.dicList=res.data
                })
            },
            adddicType () {
                var vm = this
                this.$axios.post('http://www.xhw8888.com/index/app/saveFire',qs.stringify(
                {
                    name:this.form.name,
                    }))
                    .then(function (response) {
                        vm.dialogVisible = false
                        vm.$message({
                            message: '创建成功',
                            type: 'success'
                        });
                        vm.getDicList()
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            getDictype () {
                this.$axios.get('http://www.xhw8888.com/index/app/getDictypelist', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.typeData=res.data
                    this.dialogVisibleData = true
                })
            },
            getDictypess () {
                this.$axios.get('http://www.xhw8888.com/index/app/getDictypelist', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.typeData=res.data
                })
            },
            submit () {
                var vm = this
                if(this.form.data == ''){
                    this.$message({
                        message: '存在表单项为空，请填写完整',
                        type: 'warning'
                    });
                    return false
                }
                this.$axios.post('http://www.xhw8888.com/index/app/saveDicdata',qs.stringify(
                {
                    region:this.form.region,
                    name:this.form.data,
                    }))
                    .then(function (response) {
                        vm.dialogVisibleData = false
                        vm.$message({
                        message: '创建成功',
                        type: 'success'
                    });
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
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
