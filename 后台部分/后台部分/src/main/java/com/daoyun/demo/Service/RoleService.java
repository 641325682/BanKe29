package com.daoyun.demo.Service;

public interface RoleService {
    Role findRoleById(Long id);

    List<Role> findAll();

    Integer Insert(Role role);

    Integer Delete(Long roleId);

    Integer modify(Role role);
}