package com.daoyun.demo.Service.Impl;

import com.daoyun.demo.Entity.BaseClass.BaseRole;
import com.daoyun.demo.Entity.Role;
import com.daoyun.demo.Entity.UserInfo;
import com.daoyun.demo.Entity.UserRole;
import com.daoyun.demo.Repository.RoleRepository;
import com.daoyun.demo.Repository.UserInfoRepository;
import com.daoyun.demo.Service.RoleService;
import com.daoyun.demo.Service.UserInfoService;
import com.daoyun.demo.Service.UserRoleService;
import com.daoyun.demo.Utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoRepository userInfoRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    RoleService roleService;

    @Autowired
    UserRoleService userRoleService;

    @Autowired
    LoginInfoServiceImpl loginInfoService;


    @Override
    public UserInfo findUserByAccount(String account) {
        return userInfoRepository.findUserInfoByAccount(account);
    }

    @Override
    public UserInfo findUserById(Long id) {
        Optional<UserInfo> byId = userInfoRepository.findById(id);
        if (!byId.isPresent()) {
            return null;
        }
        return byId.get();
    }

    @Override
    public List<UserInfo> findUserByEmail(String email) {
        List<UserInfo>user =  userInfoRepository.findUserByEmail(email);
        if (user.size() < 1 || user == null) {
            return null;
        }
        return user;
    }

    @Override
    public Integer Insert(UserInfo user) {
        if (user == null) {
            return 1; //insert
        }
        if (user.getAccount() == null) {
            return 2; 
        }
        if (user.getPwd() == null) {
            return 5;
        }
        if (user.getEmail() == null) {
            return 6;
        }
        if (findUserByAccount(user.getAccount())!=null) {
            return 3; 
        }
        if (findUserByEmail(user.getEmail()) != null) {
            return 4;
        }
        if (user.getAccount().length() <= 4 || user.getAccount().length() > 10) {
            return 7;
        }

        user.setCreateDate(new Date());
        user.setModifyDate(new Date());
        user.setPwd(DigestUtils.md5DigestAsHex(user.getPwd().getBytes())); 
        Role byRoleName = roleRepository.findByRoleId(BaseRole.UserId);
        if (byRoleName == null) {
            byRoleName = new Role();
            roleService.Insert(byRoleName);
        }
        user.setCreateDate(new Date());
        user.setModifyDate(new Date());
        user.setCreateBy(user.getAccount());
        user.setModifyBy(user.getAccount());
        userInfoRepository.save(user);
        UserRole userRole = new UserRole(user, byRoleName);
        userRole.setIsDefault(UserRole.ISDEFAULT.isDefault.toString());
        userRoleService.addUserRole(userRole);
        return 0;
    }

    @Override
    public Integer Delete(Long userId) {
        if (userId == null) {
            return 1;
        }
        UserInfo userInfo = findUserById(userId);
        if (userInfo != null) {
            userInfoRepository.delete(userInfo);
        }
        return 0;
    }

    @Override
    public Integer modify(UserInfo userInfo) {
        UserInfo userById = findUserById(userInfo.getId());
        if (null == userById ) {
            return 1;
        }
        if (!"".equals(userInfo.getEmail()) && userInfo.getEmail() != null) {
            userById.setEmail(userInfo.getEmail());
        }
        if (!"".equals(userInfo.getPwd()) && userInfo.getPwd() != null) {
            userById.setPwd(userInfo.getPwd());
        }
        if (!"".equals(userInfo.getUserName()) && userInfo.getUserName() != null) {
            userById.setUserName(userInfo.getUserName());
        }
        if (!"".equals(userInfo.getStatus()) && userInfo.getStatus() != null) {
            userById.setStatus(userInfo.getStatus());
        }
        if (!"".equals(userInfo.getPhone()) && userInfo.getPhone() != null) {
            userById.setPhone(userInfo.getPhone());
        }
        if (!"".equals(userInfo.getSex()) && userInfo.getSex() != null) {
            userById.setSex(userInfo.getSex());
        }
        userById.setModifyDate(new Date());
        userById.setModifyBy(loginInfoService.getAccount());
        userInfoRepository.save(userById);
        return 0;
    }

    @Override
    public List<UserInfo> findAll() {
        List<UserInfo> all = userInfoRepository.findAll();
        return all;
    }

    @Override
    @Transactional
    public void allResetPwd(Long[] list) {
        userInfoRepository.allResetPwd(DigestUtils.md5DigestAsHex("8888".getBytes()), new Date(),list);
    }
}
