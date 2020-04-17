package com.daoyun.demo.Service.Impl;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
    @Autowired
    UserInfoRepository userInfoRepository;
    @Autowired
    UserInfoService userInfoService;

    @Override
    public UserInfo checkLogin(String uname, String pwd) {
        UserInfo user = userInfoRepository.findUserByAccountOrEmail(uname);
        if (user == null || UserInfo.STATUS.Disable.equals(user.getStatus())) {
            return null;
        }
        if (DigestUtils.md5DigestAsHex(pwd.getBytes()).equals(user.getPwd())) {
            return user;
        }
        return null;
    }

    @Override
    public Integer createUser(UserInfo user) {
        Integer res = userInfoService.Insert(user);
        return res;
    }
}
