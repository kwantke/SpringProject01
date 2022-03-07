package com.freehoon.u4.home.controller;

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

    @RequestMapping(value="/home")
    public String home2(Model model) {
        System.out.println("dfdf");
        return "home/index2";
    }
}
