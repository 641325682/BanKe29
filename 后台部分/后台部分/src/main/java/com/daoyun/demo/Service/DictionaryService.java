package com.daoyun.demo.Service;




public interface DictionaryService {

    Dictionary findById(Long id);

    List<Dictionary> findAll();

    Integer insert(Dictionary dictionary);

    Integer Delete(Long id);

    Integer modify(Dictionary dictionary);
}