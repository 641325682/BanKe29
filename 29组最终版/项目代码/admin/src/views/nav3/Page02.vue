<template>
<div>
    <el-row>
    <el-button type="primary" @click="showBz">添加结构</el-button>
    </el-row>
    <!-- <el-tree :data="data" :props="defaultProps" @node-click="handleNodeClick"></el-tree> -->
    <el-tree
    :data="data"
    show-checkbox
    default-expand-all
    node-key="id"
    ref="tree"
    highlight-current
    @node-click="selectNodel"
    :props="defaultProps">
    </el-tree>
    <el-dialog
        title="添加结构"
        :visible.sync="dialogVisible"
        width="30%"
        
        >
        <el-form ref="form" :model="form" label-width="180px">
            <el-form-item label="结构名称">
                <el-input v-model="form.name" style="width:50%"></el-input>
            </el-form-item>
             <el-form-item label="组织级别">
                <el-select v-model="form.region" placeholder="请选择组织结构">
                    <el-option label="顶级" value="0"></el-option>
                    <el-option v-for="item in orgList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="save">确 定</el-button>
        </span>
    </el-dialog>

</div>
</template>


<script>
    import util from '../../common/js/util'
    //import NProgress from 'nprogress'
    import { getUserListPage, removeUser, batchRemoveUser, editUser, addUser } from '../../api/api';

    export default {
        data: function(){
            return {
                form:{
                    name:'',
                    region: '',
                },
                data: [],
                orgList:[],
                defaultProps: {
                    children: 'children',
                    label: 'label'
                },
                dialogVisible:false,
                options: []
            }
        },
        mounted () {
            this.getDataOrg()
        },
        methods: {
            getDataOrg(){
            this.$axios.get('http://www.xhw8888.com/index/app/getDataOrg', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.data=res.data
                })
            },
            showBz(){
                this.getOrg()
                this.dialogVisible = true
            },
            save () {
                if(this.form.name == ''){
                  this.$message({
                        message: '不能为空',
                        type: 'warning'
                    });
                    return false
                }
                console.log(this.form.region)
                this.$axios.get('http://www.xhw8888.com/index/app/saveOrg?name=' + this.form.name +
                "&id=" + this.form.region, {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.$message({
                        message: '创建成功',
                        type: 'success'
                    });
                    this.dialogVisible=false
                })
            },
            getOrg(){
                this.$axios.get('http://www.xhw8888.com/index/app/getorg', {
                    emulateJSON: true
                }, {
                    headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
                    }
                }).then(res => {
                    this.orgList = res.data
                })
            },
            selectNodel (obj1,obj2,obj3) {
              console.log(obj1)
              console.log(obj2)
              console.log(obj3)
              this.$confirm('确认删除该记录吗?', '提示', {
                type: 'warning'
              }).then(() => {
                var _this=this;
                this.$axios.get('http://www.xhw8888.com/index/app/deleOrg?id='+obj1.id)
                    .then(function (response) {
                    console.log(response.data);
                    _this.$message({
                      message: '删除成功！',
                      type: 'success'
                    });
                    _this.getDataOrg();

                  })
                  .catch(function (error) {
                    console.log(error);
                });


              }).catch(() => {

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

