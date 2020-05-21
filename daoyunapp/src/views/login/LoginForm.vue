<template>
    <div class="login_form">
        <img src="../../assets/login/login_title.png" class="title" alt="">
        <form class="login-form-content">
            <div class="form-input-group">
                <i class="fa fa-envelope-open icon-left"></i>
                <mt-field placeholder="请输入账号" type="text" v-model="account" class="login-input"></mt-field>
            </div>
            <div class="form-input-group">
                <i class="fa fa-key icon-left"></i>
                <mt-field placeholder="请输入密码" type="password" v-model="password" class="login-input"></mt-field>
            </div>
            <mt-button type="primary" @click.native="login">登录</mt-button>
        </form>
        <div class="login-footer">
            <a @click="showForget" class="login-footer-left">忘记密码?</a>
            <a @click="showRegister" class="login-footer-right">注册</a>
        </div>
    </div>
</template>

<script>
    import loginAPI from '../../api/loginAPI';
    import {showSuccess} from '../../utils/message';
    export default {
        name: "LoginForm",
        props: {
            showForget: {
                type: Function,
                default() {
                }
            },
            showRegister: {
                type: Function,
                default() {
                }
            }
        },
        data() {
            return {
                account: "",
                password: ""
            }
        },
        methods: {
            login() {
                loginAPI.login(this.account, this.password).then(res => {
                    showSuccess("登陆成功!");
                    this.$router.push({
                        path: '/home'
                    })
                })
            }
        }
    }
</script>

<style scoped>


</style>