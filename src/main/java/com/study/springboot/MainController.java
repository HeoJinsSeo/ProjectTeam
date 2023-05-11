package com.study.springboot;

import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController
{
	@RequestMapping("/")
	@ResponseBody
	public String root() throws Exception
	{
		return "Model & View";
	}
	
	@RequestMapping("/Mainpage")
	public String mainpage()
	{
		System.out.println("메인페이지 진입");
		return "Mainpage";
	}

}
