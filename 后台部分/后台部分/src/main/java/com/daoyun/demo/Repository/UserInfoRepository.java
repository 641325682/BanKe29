package com.daoyun.demo.repository;



@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {

    UserInfo findUserInfoByAccount(String account);

  

    @Query("select u from UserInfo u order by u.createDate desc ")
    List<UserInfo> findAll();

    @Modifying
    @Query(value = "update UserInfo u set u.pwd = ?1, u.modifyDate = ?2  where u.id in ?3")
    void allResetPwd(String newPwd, Date date, Long[] listSet);
}
