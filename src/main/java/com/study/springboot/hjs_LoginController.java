package com.study.springboot;

import com.study.springboot.Functions;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.study.springboot.Functions;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.HashMap;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class hjs_LoginController {
	
	// 함수 호출
		Functions functions = new Functions();
	    
	    @Autowired
	    UserService userService;
	
	@RequestMapping("/music")
	public String music() {
		System.out.println("/music");
		return "MusicHot";
	}
	
	@RequestMapping("/login8")
	public String login7() {
		System.out.println("/login7");
		
		return "hjs_login";
	}
	@RequestMapping("/main1")
	public String login() {
		return "main";
	}
	// join : 회원가입 페이지 요청
	@GetMapping("/join")
	public String joinForm() {
		return "member";
	}
	
	@PostMapping("/service")
	public String login(@RequestParam("memId")String memId,
					@RequestParam("memPw")String memPw,
					Model model) {
		System.out.println("memId : "+memId);
		// 회원 정보를 가져오는 로직
//		MemberDTO member = getMemberFromMemberDTO(memId);
//		MemberDTO member1 = getMemberFromMemberDTO(memPw);
		
		// 회원 ID와 비밀번호가 일치하는 경우, 로그인 페이지로 이동
		System.out.println(memPw);
//		System.out.println(member1.getMemPw());
//		System.out.println(member1.getMemPw().equals(memPw));
//		if(member1 != null && member1.getMemPw().equals(memPw)) {
//			return "main";
//		} else {
//			// 회원 ID와 비밀번호가 일치하지 않는 경우, 에러 페이지로 이동
//			model.addAttribute("error","Invalid memId or memPw");
//			return "error";
//		}
		return "error";
	}

	
	private String getMemberFromMemberDTO(String memId) {
		// TODO Auto-generated method stub
		
		
		String member = null;
	    try {
	        // Service에서 회원 정보를 조회하는 로직을 수행합니다.
//	        member =Service.getMemId(memId);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return member;
		
		
	}
	
	@GetMapping("/ad")
	public String closePage() {
		return "ad";
	}
	
	@RequestMapping("/musicchart")
	public String chart() {
		System.out.println("/chart");
		
		return "hjs_top100";
	}
	
	@RequestMapping("/newalbum")
	public String chart1() {
		System.out.println("/chart");
		
		return "hjs_newalbum";
	}
	
	@GetMapping("/musicchart_2")
	public String Mainpage(Model model) throws IOException, ParseException {
		List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
		List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
		List<TrackInfo> trackInfos_like = functions.getPopularTracks(trackInfos);
		
    	model.addAttribute("trackInfos", trackInfos);
    	model.addAttribute("trackInfos_Like",trackInfos_like);
    	
    	for(TrackInfo track : trackInfos)
    	{
    		System.out.println("track : " +track.getTrack_id());
    	}	
    
		return "hjs_top100top100";
	}
	
	
	@RequestMapping("/music4u")
	public String Mainpage1(Model model) throws IOException, ParseException {
		List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
		List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);		
		
		model.addAttribute("trackInfos", trackInfos);
		model.addAttribute("trackInfos_2023", trackInfos_2023);
    	
		System.out.println("music4u");
		
		return "hjs_music4u";
	}
	
	@RequestMapping("/magazine")
	   public String Mainpage2(Model model) throws IOException, ParseException {
	      List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
	      List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
	      
	      model.addAttribute("trackInfos", trackInfos);
	      model.addAttribute("trackInfos_2023", trackInfos_2023);
	      
	      System.out.println("magazine");
	      
	      return "hjs_magazine";
	   }

}
