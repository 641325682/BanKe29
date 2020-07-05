<template>

    <el-row >
        <el-col :span="10" v-for="(item, i) in list" :key="o" >


            <el-card :body-style="{ padding: '0px' }" shadow="hover">
                <el-card class="box-card">
                    <el-popover
                            placement="right"
                            width="400"
                            trigger="click">
                        <p>{{'班级编号：'+ item.name }}</p>
                        <p>{{'班级编号：'+ item.id}}</p>

                        <el-button type="info"  @click="getCourse(item.courseId)" slot="reference" round>{{'班级' + item.name + '详情' }}</el-button>
                    </el-popover>

                </el-card>
            </el-card>





        </el-col>

        <el-col :span="10" v-for="(o, index) in 1" :key="o" >

            <el-card :body-style="{ padding: '0px' }" shadow="hover">
                <el-card class="box-card">
                    <el-popover
                            placement="right"
                            width="400"
                            trigger="click">
                        <p>{{'待添加！' }}</p>


                        <el-button type="warning"  slot="reference" round>{{'+添加班级'}}</el-button>
                    </el-popover>

                </el-card>
            </el-card>

        </el-col>


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
                form: {
                    no:'',
                    name:'',
                    phone:'',
                    password:'',
                    email:'',
                    newpassword:'',
                    checkpassword:''

                },
                seen: false,
            }
        },
        mounted () {
            this.showData()
        },
        methods: {
            visible:function(){
                this.seen = true;
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
                this.$axios.get('http://47.113.124.225:8083/c/getAll', {
                }).then(res => {
                    this.list = res.data.data
                    console.log(res)
                })
                    .catch(function (error) {
                        console.log(error)
                    })
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


