package com.daoyun.demo.Service;


public interface DictionaryContentService {
    DictionaryContent findById(Long id);

    Integer insert(DictionaryContent dictionaryContent);

    Integer Delete(Long id);

    Integer modify(DictionaryContent dictionaryContent);

    List<DictionaryContent>  findDicContentByDicId(Long dicId);
}