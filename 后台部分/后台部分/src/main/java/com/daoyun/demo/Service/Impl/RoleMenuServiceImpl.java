/**
 * created by
 * Date:2019/4/15
 **/
package com.daoyun.demo.Service.Impl;

import com.daoyun.demo.Entity.Menu;
import com.daoyun.demo.Entity.Role;
import com.daoyun.demo.Entity.RoleMenu;
import com.daoyun.demo.Repository.RoleMenuRepository;
import com.daoyun.demo.Service.LoginInfoService;
import com.daoyun.demo.Service.RoleMenuService;
import com.daoyun.demo.Service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service("roleMenuService")
public class RoleMenuServiceImpl implements RoleMenuService {
    @Autowired
    RoleMenuRepository roleMenuRepository;
    @Autowired
    RoleService roleService;
    @Autowired
    LoginInfoService loginInfoService;

    @Override
    public RoleMenu findById(Long id) {
        Optional<RoleMenu> byId = roleMenuRepository.findById(id);
        if (!byId.isPresent()) {
            return null;
        }
        return byId.get();
    }

    @Override
    public List<RoleMenu> findAll() {
        List<RoleMenu> all = findAll();
        if (all == null) {
            return null;
        }
        return all;
    }

    @Override
    public Integer add(RoleMenu menu) {
        if (menu == null) {
            return 1;
        }
        roleMenuRepository.save(menu);
        return 0;
    }

    @Override
    public Integer remove(Long id) {
        RoleMenu byId = findById(id);
        if (byId == null) {
            return 1;
        }
        roleMenuRepository.delete(byId);
        return 0;
    }

    @Override
    public Integer modify(RoleMenu menu) {
        if (menu == null) {
            return 1;
        }
        roleMenuRepository.save(menu);
        return 0;
    }

    @Override
    public Integer add(Menu menu, Long roleId) {
        if (menu == null || roleId == null) {
            return 1; //add
        }
        Role roleById = roleService.findRoleById(roleId);
        if (roleById == null) {
            return 2; //id
        }
        RoleMenu rm = new RoleMenu();
        rm.setRole(roleById);
        rm.setMenu(menu);
        rm.setCreateDate(new Date());
        rm.setCreateBy(loginInfoService.getAccount());
        add(rm);
        return 0;
    }

    @Override
    public List<RoleMenu> findRoleMenuByMenuId(Long id) {
        List<RoleMenu> roleMenuByRoleId = roleMenuRepository.findRoleMenuByRoleId(id);
        if (roleMenuByRoleId == null || roleMenuByRoleId.size() < 1) {
            return null;
        }
        return roleMenuByRoleId;
    }
}