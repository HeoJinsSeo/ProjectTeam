package com.study.springboot;

import com.study.springboot.User;
import com.study.springboot.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController
{
    @Autowired
    UserService userService;

    @GetMapping("/Signup")
    public String Signup() {
    	System.out.println("회원가입 페이지 진입1");
        return "Signup";
    }

    @PostMapping("/Signup")
    public String Signup(@RequestParam String id, @RequestParam String password, @RequestParam int age, @RequestParam String preference) {
    	System.out.println("회원가입 페이지 진입2");
        User user = new User(id, password, age, preference);
        userService.save(user);
        return "redirect:/Signup";
    }    
}
