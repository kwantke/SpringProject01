package com.freehoon.u4.home.controller;

import com.freehoon.u4.home.service.UserInfoService;
import com.freehoon.u4.home.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

/*    @RequestMapping(value="/")
    public String home(Model model) {
        System.out.println("eeeeeeeeeeeeee");
        return "index";
    }*/
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value="/home")
    public String home2(Model model) {
        System.out.println("dfdf");

        UserInfoVO userInfo = userInfoService.selectUserInfo();

        return "home/index2";
    }
}
