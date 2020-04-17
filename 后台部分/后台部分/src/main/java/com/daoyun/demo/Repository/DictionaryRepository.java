package com.daoyun.demo.Repository;

@Repository
public interface DictionaryRepository extends JpaRepository<Dictionary, Long> {

    @Query("select d from Dictionary d order by d.createDate desc ")
    List<Dictionary> findAll();
}