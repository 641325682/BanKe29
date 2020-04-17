package com.daoyun.demo.Service;

public interface UserInfoService {
    UserInfo findUserById(Long id);

    UserInfo findUserByAccount(String account);

    Integer Insert(UserInfo user);

    Integer Delete(Long userId);

    Integer modify(UserInfo user);

    List<UserInfo> findUserByEmail(String email);

    List<UserInfo> findAll();

    void allResetPwd(Long[] list);

}
