package com.daoyun.demo.repository;






@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByRoleName(String roleName);

    @Query("select r from Role r order by r.createDate")
    List<Role> findAll();

    Role findByRoleId(Long roleId);
}