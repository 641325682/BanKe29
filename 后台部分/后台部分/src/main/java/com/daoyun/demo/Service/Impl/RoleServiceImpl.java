package com.daoyun.demo.Service.Impl;

import com.daoyun.demo.Entity.BaseClass.BaseRole;
import com.daoyun.demo.Entity.Role;
import com.daoyun.demo.Repository.RoleRepository;
import com.daoyun.demo.Service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;

    @Override
    public Role findRoleById(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        if (role.isPresent()) {
            return role.get();
        }
        return null;
    }

    @Override
    public Integer Insert(Role role) {
        if (role == null) {
            return 1;//insert
        }
        role.setCreateDate(new Date());
        role.setModifyDate(new Date());
        roleRepository.save(role);
        return 0;
    }

    @Override
    public Integer Delete(Long roleId) {
        Role role = findRoleById(roleId);
        if (role == null) {
            return 1;//delete
        }
        if (Objects.equals(roleId, BaseRole.AdminId) || Objects.equals(roleId, BaseRole.UserId)) {
            return 2; //id
        }
        roleRepository.delete(role);
        return 0;
    }

    @Override
    public Integer modify(Role role) {
        if (role == null) {
            return 1; // modify
        }
        Role oldRole = findRoleById(role.getRoleId());
        if (oldRole == null) {
            return 2; // find id
        }
        roleRepository.save(role);
        return 0;
    }

    @Override
    public List<Role> findAll() {
        return roleRepository.findAll();
    }
}