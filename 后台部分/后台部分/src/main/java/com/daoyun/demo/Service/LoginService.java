package com.daoyun.demo.Service;



public interface LoginService {
    UserInfo checkLogin(String uname, String pwd);

    Integer createUser(UserInfo user);
}
