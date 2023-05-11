package com.study.springboot.test;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping("/music")
	public String music() {
		System.out.println("/music");
		return "MusicHot";
	}
	
	@RequestMapping("/login8")
	public String login7() {
		System.out.println("/login7");
		
		return "login";
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
	
}
