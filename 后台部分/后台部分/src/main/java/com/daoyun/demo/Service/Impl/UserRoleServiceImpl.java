/**
 * created by
 * Date:2019/4/3
 **/
package com.daoyun.demo.Service.Impl;

import com.daoyun.demo.Entity.BaseClass.BaseRole;
import com.daoyun.demo.Entity.Role;
import com.daoyun.demo.Entity.UserInfo;
import com.daoyun.demo.Entity.UserRole;
import com.daoyun.demo.Repository.UserRoleRepository;
import com.daoyun.Service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    UserRoleRepository userRoleRepository;

    @Override
    public UserRole findById(Long id) {
        if (id == null) {
            return null;
        }
        Optional<UserRole> byId = userRoleRepository.findById(id);
        if (byId.get() == null) {
            return null;
        }
        return byId.get();
    }

    @Override
    public Integer addUserRole(UserRole userRole) {
        if (userRole == null) {
            return 1; // user role
        }
        UserRole byId = findById(userRole.getId());
        if (byId != null) {
            return 2; //id
        }
        long time = System.currentTimeMillis();
        userRole.setCreateDate(new Date(time));
        userRoleRepository.save(userRole);
        return 0;
    }

    @Override
    public Integer removeUserRole(Long id) {
        UserRole userRole = findById(id);
        if (id == null || userRole == null) {
            return 1; //remove user role
        }
        userRoleRepository.delete(userRole);
        return 0;
    }

    @Override
    @Transactional
    public Integer removeAllUserRoleByUserId(Long userId) {
        if (userId == null) {
            return 1; // remove
        }
        userRoleRepository.deleteAllByUserId(userId);
        return 0;
    }

    @Override
    public Integer modifyUserRole(UserRole userRole) {
        if (userRole == null || findById(userRole.getId()) == null) {
            return 1; // modify
        }
        userRoleRepository.save(userRole);
        return 0;
    }

  
    @Override
    public Boolean isAdmin(Long userId) {
        List<UserRole> allByUserId = userRoleRepository.findAllByUserId(userId);
        for (UserRole userrole : allByUserId) {
            if (userrole.getRole().getRoleName().equals(BaseRole.Admin)) {
                return true;
            }
        }
        return false;
    }

 
    @Override
    public UserRole findDefaultRoleByUserId(Long userId) {
        List<UserRole> allByUserId = userRoleRepository.findAllByUserId(userId);
        for (UserRole userRole : allByUserId) {
            if (userRole.getIsDefault().equals(UserRole.ISDEFAULT.isDefault.toString())) {
                return userRole;
            }
        }
        return null;
    }

    @Override
    public List<UserRole> findAll() {
        return userRoleRepository.findAll();
    }
}