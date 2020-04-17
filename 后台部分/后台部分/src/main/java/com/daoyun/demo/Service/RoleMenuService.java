package com.daoyun.demo.Service;

public interface RoleMenuService {

    RoleMenu findById(Long id);

    List<RoleMenu> findAll();

    Integer add(RoleMenu menu);

    Integer remove(Long id);

    Integer modify(RoleMenu menu);

    Integer add(Menu menu, Long roleId);

    List<RoleMenu> findRoleMenuByMenuId(Long id);
}