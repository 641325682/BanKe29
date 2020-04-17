package com.daoyun.demo.Service;


public interface UserRoleService {

    UserRole findById(Long id);

    UserRole findDefaultRoleByUserId(Long userId);

    List<UserRole> findAll();

    Boolean isAdmin(Long userId);

    Integer addUserRole(UserRole userRole);

    Integer removeUserRole(Long id);

    Integer removeAllUserRoleByUserId(Long userId);

    Integer modifyUserRole(UserRole userRole);
}