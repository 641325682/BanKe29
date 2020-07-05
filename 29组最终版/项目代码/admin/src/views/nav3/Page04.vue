<template>
    <div>
        <el-row>
        <el-button type="primary" @click="dialogVisible = true">添加菜单</el-button>
        </el-row>
        <el-table
        :data="tableData"
        style="width: 100%">
        <el-table-column
            prop="date"
            label="创建时间"
            width="180">
        </el-table-column>
        <el-table-column
            prop="address"
            label="菜单名称">
        </el-table-column>
        </el-table>
        <el-dialog
            title="添加菜单"
            :visible.sync="dialogVisible"
            width="30%"
            :before-close="handleClose">
            <el-form ref="form" :model="form" label-width="180px">
                <el-form-item label="菜单名称">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
                <el-form-item label="菜单标题">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
                <el-form-item label="菜单状态">
                    <el-input v-model="form.name" style="width:50%"></el-input>
                </el-form-item>
                <el-checkbox-group v-model="checkList">
                    <el-checkbox label="菜单a"></el-checkbox>
                    <el-checkbox label="菜单b"></el-checkbox>
                    <el-checkbox label="菜单c"></el-checkbox>
                </el-checkbox-group>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
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
                checkList:[],
                form:{
                    name:'',
                    region: '',
                },
                dialogVisible:false,
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1517 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1519 弄'
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1516 弄'
                }]
            }
        },
        mounted () {
        },
        methods: {
            handleClose () {
                
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
