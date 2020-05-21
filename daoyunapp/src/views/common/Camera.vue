<template>
    <div class="camera-container">
        <mt-button type="primary" @click="checkin" class="checkin-button" >立刻签到</mt-button>
        <mt-button type="danger" @click="checkout" class="checkout-button" >立刻签退</mt-button>
        <img id="myImage" style="display: none" />
    </div>
</template>

<script>
    import {cameraTakePicture} from "../../api/common/cordovaplugin";
    import { Indicator } from 'mint-ui';
    import { Toast } from 'mint-ui';

    export default {
        name: "Camera",
        data(){
            return{}
        },
        methods:{
            checkin () {

                cameraTakePicture().then(()=>{
                    document.getElementById("myImage").style.display = 'block';
                    Indicator.open({
                        text: '签到中...',
                        spinnerType: 'snake'
                    });
                    setTimeout(() => {
                        Indicator.close();
                        Toast({
                            message: '签到成功',
                            iconClass: 'icon icon-success'
                        });
                        document.getElementById("myImage").style.display = 'none';
                    }, 5000);
                })
            },
            checkout(){

                cameraTakePicture().then(()=>{
                    document.getElementById("myImage").style.display = 'block';
                    Indicator.open({
                        text: '签退中...',
                        spinnerType: 'snake'
                    });
                    setTimeout(() => {
                        Indicator.close();
                        Toast({
                            message: '签退成功',
                            iconClass: 'icon icon-success'
                        });
                        document.getElementById("myImage").style.display = 'none';
                    }, 5000);
                })
            }
        }
    }
</script>

<style rel="stylesheet/scss" lang="scss">
    .camera-container{
        background: url("../../assets/camera-bg.jpg");
        background-repeat: no-repeat;
        background-size: 100% auto;
        position: fixed;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        #myImage{
            width: 250px;
            height: 400px;
            margin: 80px auto;
        }
        .checkin-button{
            position: fixed;
            bottom: 5%;
            left: 20%;
        }
        .checkout-button{
            position: fixed;
            bottom: 5%;
            left: 55%;
        }
    }

</style>