package com.daoyun.demo.repository;




@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

    @Modifying
    @Query(value = "delete from user_role where user_id = ?1", nativeQuery = true)
    Integer deleteAllByUserId(Long id);

    @Query(value = "select u from UserRole u where u.userInfo.id = ?1")
    List<UserRole> findAllByUserId(Long userId);

    @Query(value = "select u from UserRole u order by u.createDate desc ")
    List<UserRole> findAll();

}