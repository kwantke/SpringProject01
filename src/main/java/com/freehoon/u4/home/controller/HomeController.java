package com.freehoon.u4.home.controller;

import com.freehoon.u4.home.service.UserInfoService;
import com.freehoon.u4.home.vo.UserInfoVO;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    private static final Logger logger = LogManager.getLogger(HomeController.class);

 //   protected Logger logger = LogManager.getLogger(this.getClass());
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
        logger.info("Hello. this is LogManager's logger");
        try {

            //log.info("test");

            UserInfoVO userInfo = userInfoService.selectUserInfo();
            System.out.println(userInfo);
        } catch(Exception e) {

        }


        return "home/index2";
    }
}
