package com.daoyun.demo.Repository;

@Repository
public interface DictionaryContentRepository extends JpaRepository<DictionaryContent,Long>{

    @Query("select dc from DictionaryContent dc where dc.dictionary.id = ?1")
    List<DictionaryContent> findDicContentByDicId(Long dicId);
}