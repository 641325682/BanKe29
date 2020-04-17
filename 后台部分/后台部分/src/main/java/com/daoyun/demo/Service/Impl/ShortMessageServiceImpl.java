/**
 * created by
 * Date:2019/4/4
 **/
package com.daoyun.demo.Service.Impl;

import com.daoyun.demo.Entity.ShortMessage;
import com.daoyun.demo.Repository.ShortMessageRepository;
import com.daoyun.demo.Service.ShortMessageService;
import com.daoyun.demo.Utils.EmailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service("shortMessageService")
public class ShortMessageServiceImpl implements ShortMessageService {
    @Autowired
    ShortMessageRepository shortMessageRepository;
    @Override
    public Integer sendEmailMessage(String account, String receiver, String purpose) {
        if ("".equals(receiver)) {
            return 1; //send
        }
        String code = EmailUtils.editEmail(receiver);
        if ("".equals(code)) {
            return 2; //edit
        }
        shortMessageRepository.save(new ShortMessage(account, receiver, code, new Date(), purpose));
        return 0;
    }
    @Override
    public Integer verifyEmailMessage(String code, String account, String email) {
        ShortMessage msgList = shortMessageRepository.findShortMessagesByAccountEmail(account, email);
        if (msgList.getCode().equals(code)) {
            return 0;
        }
        return 1; //verify
    }
}