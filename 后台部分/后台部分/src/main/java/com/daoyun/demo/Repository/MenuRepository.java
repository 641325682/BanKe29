package com.daoyun.demo.repository;



@Repository
public interface MenuRepository extends JpaRepository<Menu,Long>{
    @Query(value = "select m from Menu m order by m.createDate desc ")
    List<Menu> findAll();
}