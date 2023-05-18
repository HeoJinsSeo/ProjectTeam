package com.study.springboot;

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
	// 메인페이지 
	String Mainpage_genre_state = "recent";
  
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
    
    // 로그인 페이지 진입용 컨트롤러
    @GetMapping("/login")
    public String login() {
        System.out.println("로그인 페이지 진입");
        return "login";
    }
    
    
	 // 로그인 시 csv파일을 ajax로 변환해 /users로 보낸 후	
	 // login.jsp에 스크립트 단에서 /users로 간 데이터를 읽어서 대조하기위한 컨트롤러
    @GetMapping("/users")
    @ResponseBody
    public String ajaxUsers() {
        List<User> userList = null;

        try {
            userList = functions.getUserListFromCSV();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        ObjectMapper mapper = new ObjectMapper();
        String jsonResult = "";

        try {
            jsonResult = mapper.writeValueAsString(userList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return jsonResult;
    }
    
    // 회원가입 완료 페이지 컨트롤러
    @RequestMapping("/SignupSuccess")
    public String SignupSuccess() {
    	System.out.println("회원가입 완료 페이지 진입");
    	return "SignupSuccess";
    }
    
	 // 회원가입 처리용 컨트롤러
	 // @RequestParam("id")를 해놓은 이유는 submit 할떄 값을 받기 위함
    
	 @PostMapping("/Signup")
	 public String Signup(@RequestParam("id") String id,
	 @RequestParam("password") String password,
	 @RequestParam("age") int age,
	 @RequestParam("preference") String preference
	 ) {	
		 System.out.println("회원가입 처리 완료"); // 동작 확인용 메세지
		 User user = new User(id, password, age, preference, 1); // rank 는 따로 입력사항이 없기 때문에 기본값으로 1을 넣었습니다
		 userService.save(user);
		
		 // 세이브 성공시 메인페이지 이동
		 return "redirect:/SignupSuccess";
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
    public String Mainpage(HttpServletRequest req,
    					   Model model
    					   ) throws IOException, ParseException {
    	
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
    	
    	// 모델
    	model.addAttribute("trackInfos", trackInfos);
    	model.addAttribute("trackInfos_Mainpage_genres", trackInfos_2023);
    	
        // 최초 진입시 메인페이지 장르를 "recent"로 설정합니다
        model.addAttribute("Mainpage_Body_genre", "recent");
 
    	HttpSession session = req.getSession();
    	
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
    
    // 메인페이지 바디 최신음악 컨트롤러
    @PostMapping("/Mainpage")
    public String Mainpage_Body_Genres(Model model,
    									@RequestParam("Mainpage_Body_genre") String genre) throws IOException, ParseException {
    	
    	// 호출용 전체 트랙
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
  	    	
    	// 장르 상태 변경
    	switch(genre)
    	{
    		case "recent":
    			trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_2023);
    			System.out.println("최신장르 변경완료");
    			break;    			
    		case "dance":
    			List<TrackInfo> trackInfos_Dance_Random = functions.getRandomDanceTracks(trackInfos);
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_Dance_Random);
    			System.out.println("댄스 변경완료");
    			break;
    		case "hiphop":
    			List<TrackInfo> trackInfos_Hiphop_Random =
    			functions.getRandomHiphopTracks(trackInfos);
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_Hiphop_Random);
    			System.out.println("힙합 변경완료");
    			break;
    		case "ballad":
    			List<TrackInfo> trackInfos_Ballad_Random = functions.getRandomBalladTracks(trackInfos);
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_Ballad_Random);
    			System.out.println("발라드 변경완료");
    			break;
    		case "OST":
    			List<TrackInfo> trackInfos_OST_Random = functions.getRandomOSTTracks(trackInfos);
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_OST_Random);
    			System.out.println("OST 변경완료");
    			break;
    		default:
    			model.addAttribute("trackInfos_Mainpage_genres", trackInfos_2023);
    	}   
    	
        System.out.println("메인페이지 바디 장르변경 완료"); 	// 동작 확인용     	
            	
        return "/Mainpage";	
    }
    
    // 내정보 페이지 진입용 컨트롤러
    @GetMapping("/mymusic_test")
    public String myMusic_test(HttpServletRequest req,
    					  Model model
    					  ) throws IOException, ParseException {
    	
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	//List<TrackInfo> trackInfos_2023 = functions.getRandomTracksFrom2023(trackInfos);
    	model.addAttribute("trackInfos", trackInfos);

        System.out.println("마이뮤직 페이지 진입");
        
        /*for(TrackInfo track : trackInfos)
        {
        	System.out.println(track.getArtist());
        }*/     
    	
        return "mymusic_test";
    }
    
    // 음악 담기 기능
    @PostMapping("addTrack")
    public String addtrack(HttpServletRequest req,
			  Model model,
			  @RequestParam("addTrack") Integer add_track
			  ) throws IOException, ParseException {
    	
    	HttpSession session = req.getSession();
    	
    	Integer rank = (Integer) session.getAttribute("rank");
    	
        // rank 값이 null이거나 1보다 작을 경우 음악 담기가 제한됩니다.
        if (rank == null || rank < 1) {
            System.out.println("방문객이면 음악 담기 제한");
            return "redirect:/mymusic_test";
        }
    	
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	List<Integer> addedTracks = (List<Integer>) session.getAttribute("addedTracks");
    	
        if (addedTracks == null) {
            addedTracks = new ArrayList<>();
        }

        if (!addedTracks.contains(add_track)) {
            addedTracks.add(add_track);
            session.setAttribute("addedTracks", addedTracks);
            System.out.println("음악 담기 성공");
            System.out.println("담은 곡: " + add_track);
        } else {
            System.out.println("이미 담긴 곡입니다");
        }     
    	
    	return "redirect:/mymusic_test";
    }
    
    // 음악 빼기 컨트롤러
    @GetMapping("/removeTrack")
    public String removetrack(HttpServletRequest req,
			  @RequestParam("trackId") Integer trackId,
			  @RequestParam("action") String action
			  ) throws IOException, ParseException {
    	
    	HttpSession session = req.getSession();
    	
    	// html 에서 전달하는 전달값이 remove 라면 동작
        if (action.equals("remove")) {
            List<Integer> addedTracks = (List<Integer>) session.getAttribute("addedTracks");
            List<TrackInfo> selectedTracks = (List<TrackInfo>) session.getAttribute("selectedTracks");

            if (addedTracks != null && selectedTracks != null) {
                // 선택된 트랙에서 제외할 트랙을 제거합니다.
                addedTracks.remove(trackId);
                selectedTracks = functions.getTracksByExcludedIds(addedTracks, selectedTracks);
                
                System.out.println("음악 삭제 성공");
                System.out.println("삭제한 곡: " + trackId);

                // 세션에 업데이트된 값들을 저장합니다.
                session.setAttribute("addedTracks", addedTracks);
                session.setAttribute("selectedTracks", selectedTracks);
            }
        }    	
    	return "redirect:/mymusic";
    }
    
    // 내정보 페이지 진입용 컨트롤러
    @GetMapping("/mymusic")
    public String myMusic(HttpServletRequest req,
    					  Model model
    					  ) throws IOException, ParseException {
    	// 전체 트랙 불러오기
    	List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();
    	// 세션 시작
    	HttpSession session = req.getSession();
    	
    	List<Integer> addedTracks = (List<Integer>) session.getAttribute("addedTracks");
    	// addedTracks 가 null 값일때도 실행되게 초기화하는 코드
        if (addedTracks == null) {
            addedTracks = new ArrayList<>();
        }
        // 선택한 곡 넣기
    	List<TrackInfo> selectedTracks = functions.getTracksByAddedIds(addedTracks,trackInfos);
    	
    	session.setAttribute("selectedTracks", selectedTracks);

        System.out.println("마이뮤직 페이지 진입");
        
        for(Integer track : addedTracks)
        {
        	System.out.println("저장한 트랙 넘버 : " + track);
        }    
    	
        return "mymusic";
    }
    
    // 내정보 페이지 진입용 컨트롤러
    @GetMapping("/myInfo")
    public String myinfo(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	String id = (String) session.getAttribute("id");
    	Integer age = (Integer) session.getAttribute("age");
    	String preference = (String) session.getAttribute("preference");
    	Integer rank = (Integer) session.getAttribute("rank");
    	
        System.out.println("내정보 페이지 진입");
        System.out.println("id : " + id);
        System.out.println("age : " + age);
        System.out.println("preference : " + preference);
        System.out.println("rank : " + rank);
    	
        return "myInfo";
    }

    @RequestMapping("/musicInfo")
    public String musicInfo(HttpServletRequest request, Model model) throws IOException, ParseException {
        // 클릭 이벤트에서 전달된 track_id 값을 가져옴
        String strtrack_id = request.getParameter("track_id");
        int track_id = -1;
        if(strtrack_id!=null) {
        	track_id= Integer.parseInt(strtrack_id);
        }

        // XLSX 파일을 읽어오는 함수 호출
        List<TrackInfo> trackInfos = functions.getTrackInfoFromXlsx();

        // track_id 값을 기반으로 XLSX 파일에서 해당하는 행을 찾는 함수 호출
        TrackInfo musicInfo = findTrackByTrack_id(trackInfos, track_id);

        if (musicInfo == null) {
            return "redirect:/chart";  // chart로 리다이렉트
        }

        // 필요한 데이터를 추출하여 모델에 추가
        model.addAttribute("title", musicInfo.getTitle());
        model.addAttribute("artist", musicInfo.getArtist());
        model.addAttribute("style", musicInfo.getStyle());
        model.addAttribute("album_image", musicInfo.getAlbum_image());
        model.addAttribute("lyrics", musicInfo.getLyrics());

        // musicInfo 페이지로 이동
        return "musicInfo";
    }

    public TrackInfo findTrackByTrack_id(List<TrackInfo> trackInfos, int track_id) {
        for (TrackInfo trackInfo : trackInfos) {
            if (trackInfo.getTrack_id() == track_id) {
                return trackInfo;  // track_id와 일치하는 트랙을 찾았을 때 해당 트랙 정보 반환
            }
        }
        return null;  // 일치하는 트랙을 찾지 못한 경우 null 반환
    }
    
    @GetMapping("/infos")
    @ResponseBody
    public String ajaxTrackInfos(HttpServletRequest request, HttpServletResponse response) {
    	
    	// session
    	HttpSession session = request.getSession();
    	
    	
    	List<TrackInfo> trackInfoList = null;
    	try {
    		trackInfoList = functions.getTrackInfoFromXlsx();
    		session.setAttribute("trackInfoList", trackInfoList);
    	} catch (IOException e) {
    		e.printStackTrace();
    	} catch (ParseException e) {
    		e.printStackTrace();
    	}
    	ObjectMapper mapper = new ObjectMapper();
    	String jsonResult ="";
    	try {
    		jsonResult = mapper.writeValueAsString(trackInfoList);
    	} catch (JsonProcessingException e) {
    		e.printStackTrace();
    	}
    	response.setContentType("application/json; charset=UTF-8"); // content type 설정
    	
    	return jsonResult;
    }
    
    @GetMapping("/search/{keyword}")
    public String search(@PathVariable("keyword")String keyword,
    					Model model,
    					HttpServletRequest request) {
    	
    	// session
    	HttpSession session = request.getSession();
    	List list = (List) session.getAttribute("trackInfoList");
    	
    	String lowerCaseKeyword = keyword.toLowerCase();
    	
    	// Get track data list from Excel file.
    	List<TrackInfo> trackInfoList = null;
    	try {
    		trackInfoList = functions.getTrackInfoFromXlsx();
    	} catch(IOException|ParseException e) {
    		e.printStackTrace();
    	}
    	// Filter track data according to search keyword
    	List<TrackInfo> filteredList = trackInfoList.stream()
    		.filter(trackInfo -> trackInfo.getAlbum_image().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getTitle().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getArtist().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getAlbum().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getRelease_date().toLowerCase().contains(lowerCaseKeyword)
    				|| String.valueOf(trackInfo.getLike_count()).toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getNews1().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getNews2().toLowerCase().contains(lowerCaseKeyword)
    				|| trackInfo.getNews3().toLowerCase().contains(lowerCaseKeyword))
    		.collect(Collectors.toList());
    	// searchResults를 뷰로 전달
    	model.addAttribute("searchResults", filteredList);
    	// search.jsp 뷰를 반환
    	return "search";
    }
}

