package com.study.springboot;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * 
 * @author 박정수
 * 메인 컨트롤러 단입니다.
 * 메소드들은 전부 Functions에 옮겨 두었습니다.
 * 필요하신 함수는 Functions 클래스에서 정의 하시고,
 * functions.method() 이런식으로 호출해 주시면 감사하겠습니다.
 */
@Controller
public class MainController
{
	// 함수 호출
	Functions functions = new Functions();
    
    @Autowired
    UserService userService;
    
    // 로고 클릭시 메인페이지 다시가는 컨트롤러
    @GetMapping("/go_Mainpage")
    public String go_mainpage() {
        return "redirect:/Mainpage"; // 메인페이지로 리다이렉트
    }
    
    // 트랙정보 출력 테스트 페이지
    @RequestMapping("/Ttest")
    public String getTtest(Model model) throws IOException, ParseException {
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	model.addAttribute("trackInfos", trackInfos);
        return "Ttest";
    }
    
    // 회원가입 페이지 진입용 컨트롤러
    @GetMapping("/Signup")
    public String Signup() {
    	System.out.println("회원가입 페이지 진입");
        return "Signup";
    }
    
    // 회원가입 처리용 컨트롤러
    // @RequestParam("id")를 해놓은 이유는 submit 할떄 값을 받기 위함
    @PostMapping("/Signup")
    public String Signup(@RequestParam("id") String id,			
    					 @RequestParam("password") String password,
    					 @RequestParam("age") int age,
    					 @RequestParam("preference") String preference
    					 ) {
    	System.out.println("회원가입 처리 완료");						// 동작 확인용 메세지
        User user = new User(id, password, age, preference, 1);		// rank 는 따로 입력사항이 없기 때문에 기본값으로 1을 넣었습니다
        userService.save(user);
        // 세이브 성공시 메인페이지 이동
        return "redirect:/Mainpage";
    }
     
    // 로그인 페이지 진입용 컨트롤러
    @GetMapping("/login")
    public String login() {
        System.out.println("로그인 페이지 진입");
        return "login";
    }
    
    // 로그인 처리용 컨트롤러
    @PostMapping("/login")
    public String Login(@RequestParam("id") String id,
    					@RequestParam("password") String password,
    					HttpServletRequest req) throws IOException {
    	// 세션 선언
    	HttpSession session = req.getSession();
    	
        System.out.println("로그인 처리");		// 동작 확인용
        List<User> userList = functions.getUserListFromCSV();		// csv 에서 유저정보 읽어옴
                for (User user : userList) {
            if (user.getId().equals(id) && user.getPassword().equals(password)) {	// 만약 id, password가 일치한다면
            	
            	// 세션에 모든 정보 저장
            	session.setAttribute("id", id);
            	session.setAttribute("password", password);
            	session.setAttribute("age", user.getAge());
            	session.setAttribute("preference", user.getPreference());
            	session.setAttribute("rank", user.getRank());
            	
                return "redirect:/Mainpage?success=true";	// 로그인 잘 됫는지 확인용으로 success=true 넣었습니다
            }
        }
        return "redirect:/login?error=true";		// 실패시 다시 로그인 페이지
    }
    
    // 로그아웃 컨트롤러
    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.invalidate(); // 세션초기화
        System.out.println("로그아웃 성공");
        return "redirect:/Mainpage"; // 메인페이지로 리다이렉트
    }
    
    // 메인 페이지 컨트롤러
    @GetMapping("/Mainpage")
    public String Mainpage(HttpServletRequest req, Model model) throws IOException, ParseException {
    	
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);    	
    	
    	HttpSession session = req.getSession();
    	model.addAttribute("trackInfos", trackInfos);
    	model.addAttribute("trackInfos_2023",trackInfos_2023);
    	
    	// 세션에서 계정 정보를 읽어옵니다
    	String id = (String) session.getAttribute("id");
    	Integer age = (Integer) session.getAttribute("age");
    	String preference = (String) session.getAttribute("preference");
    	Integer rank = (Integer) session.getAttribute("rank");
    	
        System.out.println("메인 페이지 진입");
        System.out.println("id : " + id);
        System.out.println("age : " + age);
        System.out.println("preference : " + preference);
        System.out.println("rank : " + rank);
                    
        return "Mainpage";
    }
    
    // 회원가입 페이지 진입용 컨트롤러
    @GetMapping("/myInfo")
    public String myinfo(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	String id = (String) session.getAttribute("id");
    	Integer age = (Integer) session.getAttribute("age");
    	String preference = (String) session.getAttribute("preference");
    	Integer rank = (Integer) session.getAttribute("rank");
    	
        System.out.println("내정ㅂ 페이지 진입");
        System.out.println("id : " + id);
        System.out.println("age : " + age);
        System.out.println("preference : " + preference);
        System.out.println("rank : " + rank);
    	
        return "myInfo";
    }


}

