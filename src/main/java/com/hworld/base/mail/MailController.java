package com.hworld.base.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
	private final MailService mailService;
    
    @ResponseBody
    @PostMapping("/mail")
    public String MailSend(String mail){

       int number = mailService.sendMail(mail);

       String num = "" + number;

       return num;
    }
    
    @ResponseBody
    @PostMapping("/mailPw")
    public String MailSendPw(String mail){

       String newPw = mailService.sendMailPw(mail);

       String newPwd = "" + newPw;

       return newPw;
    }

}
