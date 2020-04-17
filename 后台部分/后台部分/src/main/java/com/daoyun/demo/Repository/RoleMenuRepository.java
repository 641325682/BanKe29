package com.daoyun.demo.repository;





@Repository
public interface RoleMenuRepository extends JpaRepository<RoleMenu, Long> {

    @Query("select rm from RoleMenu rm order by rm.createDate desc")
    List<RoleMenu> findAll();

    @Query("select rm from RoleMenu rm where rm.menu.id = ?1 order by rm.createDate desc ")
    List<RoleMenu> findRoleMenuByRoleId(Long id);
}