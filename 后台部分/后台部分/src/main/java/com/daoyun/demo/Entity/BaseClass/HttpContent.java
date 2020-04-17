package com.daoyun.demo.Entity.BaseClass;

public class HttpContent {
    public static final String data = "data";
    public static final String userId = "userId";
    public static final String userRole = "userRole";
    public static final String Token = "token"; 
    public static final String emailCode = "emailCode"; 
    public static final String total = "total";
    public static Set<String> removeIngoreSet = new HashSet<String>(){{

        add(UserRole.STATUS.Normal.toString());
        add(UserRole.STATUS.Disabled.toString());
        add(BaseRole.UserId.toString());
        add(BaseRole.AdminId.toString());
        add(BaseRole.Admin);
        add(BaseRole.User);
        add(Dictionary.DATATYPE.System.toString());
        add(Dictionary.DATATYPE.Standard.toString());
    }};
}
