package com.daoyun.demo.Service.Impl;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    LoginInfoService loginInfoService;

    @Override
    public Menu findById(Long id) {
        Optional<Menu> byId = menuRepository.findById(id);
        if (!byId.isPresent()) {
            return null;
        }
        return byId.get();
    }

    @Override
    public List<Menu> findAll() {
        List<Menu> all = menuRepository.findAll();
        if (all == null || all.size() < 1) {
            return null;
        }
        return all;
    }

    @Override
    public Integer add(Menu menu) {
        if (menu == null) {
            return 1;
        }
        menu.setCreateDate(new Date());
        menu.setModifyDate(new Date());
        menu.setCreateBy(loginInfoService.getAccount());
        menu.setModifyBy(loginInfoService.getAccount());
        menuRepository.save(menu);
        return 0;
    }

    @Override
    public Integer remove(Long id) {
        Menu menu = findById(id);
        if (menu == null) {
            return 1;
        }
        menuRepository.delete(menu);
        return 0;
    }

    @Override
    public Integer modify(Menu menu) {
        if (menu == null) {
            return 1;
        }
        LoginInfor logiInfo = loginInfoService.getLogiInfo();
        if (logiInfo == null) {
            System.out.println("请登陆！");
            return 2;
        }
        menu.setModifyBy(logiInfo.getUserId().toString());
        menu.setModifyDate(new Date());
        menuRepository.save(menu);
        return 0;
    }
}