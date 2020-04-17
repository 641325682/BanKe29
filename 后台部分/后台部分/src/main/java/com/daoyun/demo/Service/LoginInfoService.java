
package com.daoyun.demo.Service;



public interface LoginInfoService {

    HttpServletRequest getRequest();
    HttpServletResponse getResponse();
    String getRequestPath();
    LoginInfor getLogiInfo();
    String getAccount();
}