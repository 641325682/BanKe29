<template>
    <div class="login_form">
        <img src="../../assets/login/forget_title.png" class="title" alt="">
        <form class="login-form-content">
            <div class="form-input-group">
                <i class="fa fa-envelope-open icon-left"></i>
                <mt-field placeholder="请输入邮箱" type="email" v-model="email" class="login-input"></mt-field>
            </div>
            <div class="form-input-group">
                <i class="fa fa-paper-plane icon-left"></i>
                <mt-field placeholder="请输入验证码" type="text" v-model="vercode" class="login-input">
                    <mt-button type="default" class="get-vercode-button">获取验证码</mt-button>
                </mt-field>
            </div>
            <div class="form-input-group">
                <i class="fa fa-key icon-left"></i>
                <mt-field placeholder="请输入密码" type="password" v-model="newpassword" class="login-input"></mt-field>
            </div>
            <div class="form-input-group">
                <i class="fa fa-paint-brush icon-left"></i>
                <mt-field placeholder="请确认密码" type="password" v-model="renewpassword" class="login-input"></mt-field>
            </div>
            <mt-button type="primary">确定</mt-button>
        </form>
        <div class="login-footer">
            <a @click="showLogin" class="login-footer-left">返回登录</a>
            <a @click="showRegister" class="login-footer-right">注册</a>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ForgetForm",
        props:{
            showLogin:{
                type:Function,
                default(){}
            },
            showRegister:{
                type: Function,
                default(){}
            }
        },
        data(){
            return {
                email: "",
                vercode:"",
                newpassword:"",
                renewpassword:""
            }
        }
    }
</script>

<style scoped>
    .get-vercode-button{
        background: none;
        color: #ffffff;
        margin-right: -20px;
    }
</style>