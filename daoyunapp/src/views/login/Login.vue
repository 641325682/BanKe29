<template>
    <div class="login_page">
        <!--登录-->
        <transition name="fade" mode="out-in">
            <login-form v-show="form=='login'"
                        :show-forget="showForget"
                        :show-register="showRegister"
            ></login-form>
        </transition>

        <!--注册-->
        <transition name="fade" mode="out-in">
            <register-form  v-show="form=='register'" :show-login="showLogin">
                <register-form></register-form>
            </register-form>
        </transition>

        <!--忘记密码-->
        <transition name="fade" mode="out-in">
            <forget-form  v-show="form=='forget'"
                          :show-login="showLogin"
                          :show-register="showRegister"
            ></forget-form>
        </transition>
    </div>
</template>

<script>
    import LoginForm from "./LoginForm";
    import RegisterForm from "../../../node_modules/RegisterForm";
    import ForgetForm from "./ForgetForm";
    export default {
        name: "login",
        components: {ForgetForm, RegisterForm, LoginForm},
        data(){
            return {
                form: "login"
            }
        },
        methods:{
            showRegister(){
                this.form = "register"
            },
            showLogin(){
                this.form = "login"
            },
            showForget(){
                this.form = "forget"
            }
        }
    }
</script>

<style rel="stylesheet/scss" lang="scss">
    .login_page{
        background: url("../../assets/login/bg.jpg");
        background-repeat: no-repeat;
        background-size: 100% auto;
        position: fixed;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        .title{
            width: 40%;
            margin-top: 20%;
        }
        .login-form-content{
            margin-top: 130px;
        }
        .login-input{
            background: none;
            .mint-field-core{
                background: none;
            }
            .mint-cell-wrapper{
                background-image:none;
            }
        }
        .form-input-group{
            width: 70%;
            margin: 0 auto;
            border-bottom: 1px solid #ffffff;
        }
        .icon-left{
            float: left;
            margin-top: 13px;
            font-size: 20px;
            color: #ffffff;
        }
        .mint-button--primary{
            width: 70%;
            margin-top: 30px;
            border-radius: 15px;
            box-shadow: 0 2px 2px 0 rgba(171, 171, 171, 0.2), 0 3px 5px 0 rgba(81, 81, 81, 0.19);
        }
        .login-footer{
            width: 70%;
            margin: 0 auto;
            margin-top: 20px;
        }
        .login-footer-left{
            float: left;
        }
        .login-footer-right{
            float: right;
        }
    }
</style>