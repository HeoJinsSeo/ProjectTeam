package com.study.springboot;

import com.study.springboot.TrackInfo;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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


@Controller
// 저는컨트롤러는 이거 하나만 쓰겠습니다.
// 컨트롤러를 따로 여러개 만들 필요는 없더라구요.
public class MainController
{
	// CSV에서 배열로 user 정보 읽어오기
	// 이제 userList 라는 변수가 csv 파일을 읽어 옵니다.
    private List<User> getUserListFromCSV() throws IOException {
        List<User> userList = new ArrayList<>();
        // 경로 설정
        ClassPathResource resource = new ClassPathResource("metadata/user.csv");
        // 메모리 효율성을 위한 BufferReader를 골랐습니다
        BufferedReader reader = new BufferedReader(new FileReader(resource.getFile()));
        String line = reader.readLine(); // 첫 번째 라인은 헤더
        while ((line = reader.readLine()) != null) {		// 더이상 읽을수 없는 라인이 생길때까까지
        	// 필드라는 리스트로 하나씩 저장, ","를 기준으로 데이터를 읽어옵니다
            String[] fields = line.split(",");
            String id = fields[0];					// 첫번째 id
            String password = fields[1];			// 두번째 password
            int age = Integer.parseInt(fields[2]);	// 세번째 나이
            String preference = fields[3];			// 네번째 취향
            int rank = Integer.parseInt(fields[4]);	// 다섯번쨰 등급
            User user = new User(id, password, age, preference, rank);		// user 객체에 담기
            // 추가
            userList.add(user);
        }
        reader.close();	
        return userList;
    }
    
    private List<TrackInfo> getTrackInfoFromXlsx() throws IOException {
    	FileInputStream fis = new FileInputStream(new File("C:\\Users\\User\\Desktop\\ProjectTeam\\src\\main\\resources\\metadata\\music_all_230510(1).xlsx"));
    	XSSFWorkbook workbook = new XSSFWorkbook(fis);
    	int sheetIndex = 0;
    	XSSFSheet sheet = workbook.getSheetAt(sheetIndex);
    	
    	int colCnt = sheet.getRow(0).getPhysicalNumberOfCells();
    	String[] headers = new String[colCnt];
    	XSSFRow headerRow = sheet.getRow(0);
    	
    	for (int i = 0; i<colCnt; i++) {
    		XSSFCell cell = headerRow.getCell(i);
    		headers[i] = cell.getStringCellValue();
    	}
    	
    	List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
    	Iterator<Row> rowIterator = sheet.iterator();
    	rowIterator.next();
    	while(rowIterator.hasNext()) {
    		XSSFRow row = (XSSFRow)rowIterator.next();
    		TrackInfo trackInfo = new TrackInfo();
    		
    		for(int i = 0; i<headers.length; i++) {
    			XSSFCell cell = row.getCell(i);
    			if(cell == null) {
    				continue;
    			}
    			switch (cell.getCellType()) {
    			case NUMERIC:
    				//System.out.println(headers[i] + "=" + (int)cell.getNumericCellValue());
    				if (headers[i].equals("track_id")) {
    					trackInfo.setTrack_id((int)cell.getNumericCellValue());
    				} else if (headers[i].equals("album_id")) {
    					trackInfo.setAlbum_id((int)cell.getNumericCellValue());
    				} else if (headers[i].equals("like_count")) {
    					trackInfo.setLike_count((int)cell.getNumericCellValue());
    				}
    				break;
    			case STRING:
    				//System.out.println(headers[i] + "=" + cell.getStringCellValue());
    				if (headers[i].equals("title")) {
    					trackInfo.setTitle(cell.getStringCellValue());
    				} else if(headers[i].equals("artist")) {
    					trackInfo.setAlbum(cell.getStringCellValue());
    				} else if(headers[i].equals("album")) {
    					trackInfo.setAlbum(cell.getStringCellValue());
    				} else if(headers[i].equals("album_image")) {
    					trackInfo.setAlbum_image(cell.getStringCellValue());
    				} else if(headers[i].equals("lyrics")) {
    					trackInfo.setLyrics(cell.getStringCellValue());
    				} else if(headers[i].equals("genre")) {
    					trackInfo.setGenre(cell.getStringCellValue());
    				} else if(headers[i].equals("style")) {
    					trackInfo.setStyle(cell.getStringCellValue());
    				} else if(headers[i].equals("release_date")) {
    					trackInfo.setRelease_date(cell.getStringCellValue());
    				} else if(headers[i].equals("news1")) {
    					trackInfo.setNews1(cell.getStringCellValue());
    				} else if(headers[i].equals("news2")) {
    					trackInfo.setNews2(cell.getStringCellValue());
    				} else if(headers[i].equals("news3")) {
    					trackInfo.setNews3(cell.getStringCellValue());
    				} 
    				break;
    			}
    		}
    		trackInfos.add(trackInfo);
    	}
    	
    	workbook.close();
    	fis.close();
    	
    	return trackInfos;
    }
    
    
    @Autowired
    UserService userService;
    
    // 트랙정보 출력 테스트 페이지
    @RequestMapping("/Ttest")
    public String getTtest(Model model) throws IOException {
    	List<TrackInfo> trackInfos = getTrackInfoFromXlsx();
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
        List<User> userList = getUserListFromCSV();		// csv 에서 유저정보 읽어옴
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
    
    // 메인 페이지 컨트롤러
    @GetMapping("/Mainpage")
    public String Mainpage(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
    	
    	// 세션에서 모든 정보를 읽어옵니다
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
}

