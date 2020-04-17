package com.daoyun.demo.Service;




public interface MenuService {

    Menu findById(Long id);

    List<Menu> findAll();

    Integer add(Menu menu);

    Integer remove(Long id);

    Integer modify(Menu menu);

}