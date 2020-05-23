<template>
    <div class="main-layout">
        <router-view/>
        <mt-tabbar v-model="selected" >
            <mt-tab-item id="schedule">
                <i class="fa fa-table fa-fw"></i><br/>
                <span class="tabbar-title">课程表</span>
            </mt-tab-item>
            <mt-tab-item id="discovery">
                <i class="fa fa-pagelines fa-fw"></i><br/>
                <span class="tabbar-title">发现</span>
            </mt-tab-item>
            <mt-tab-item id="profile">
                <i class="fa fa-user-circle-o fa-fw"></i><br/>
                <span class="tabbar-title">我的</span>
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>

<script>
    export default {
        name: "layout",
        data(){
            return {
                selected: 'discovery'
            }
        },
        watch: {
            selected: function (val, old) {
                console.log(val,old)
                switch (val) {
                    case 'schedule': this.$router.push({path: '/schedule/index'});break;
                    case 'discovery': this.$router.push({path: '/discovery/index'});break;
                    case 'profile': this.$router.push({path: '/profile/index'});
                }
            }
        },
        methods:{
        }
    }
</script>

<style rel="stylesheet/scss" lang="scss">
    .main-layout{
        position: fixed;
        top: 0;
        width: 100%;
        bottom: 0;
        i{
            padding: 0 0 0.2em;
        }
        .tabbar-title{
            font-size: 1em;
            display: block;
        }
        .fa{
            font-size: 1.5em;
        }
    }
</style>