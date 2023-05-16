package com.study.springboot;

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
import java.util.Random;
import java.util.stream.Collectors;

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

public class Functions
{
	/**
	 * Functions 사용법
	 * public Functions() 안 괄호에 리스트를 생성합니다
	 * try 문 안에 리스트를 정의합니다
	 * 밑에 Functions() 는 생성자입니다.
	 */
	public Functions()  {
		List<User> userList;
	    List<TrackInfo> trackInfos;
	    List<TrackInfo> trackInfos_2023;
	    
		try
		{
			trackInfos = getTrackInfoFromXlsx();
			trackInfos_2023 = getRandomTracksFrom2023(trackInfos);
			userList = getUserListFromCSV();
		} 
		catch (Exception  e)
		{
			e.printStackTrace();
		}

	}
	
	/**
	 * @author 박정수
	 * @return 유저정보 리스트
	 * @throws IOException
	 * 유저정보 csv 파일을 읽어오는 메소드입니다.
	 */
    List<User> getUserListFromCSV() throws IOException {
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
	
    //----------------------------------------------------------------------
    // 여기서부터는 엑셀 파일 불러오고 출력하기위한 함수들입니다.
    
    // 내부에서 사용할 cloumn을 받은 후 column 이름을 release_date와 대조하여 true, false를 리턴
    // 아래 xlsx파일 읽는 함수에서 NUMERIC과 함께 release_date를 날짜 형식으로 입력할 때 사용
    private boolean isDateColumn(String column) {
        return column.equals("release_date");
    }
    
    // release_date 값을 원하는 포맷으로 변경하는 함수
    // "E MMM dd HH:mm:ss z yyyy" 형식에서 "yyyy.MM.dd" 형식으로 변경하여 반환하는 함수
    private String formatDate(String date) throws ParseException {
    	// 현재 출력되는 날짜 포맷
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        // 변경될 날짜 포맷
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy.MM.dd");
        
        // date 값을 현재 날짜 포맷으로 변환하여 Date 객체로 생성
        Date parsedDate = inputDateFormat.parse(date);
        // 변경할 날짜 포맷으로 Date객체를 문자열로 변환하여 리턴
        return outputDateFormat.format(parsedDate);
    }
    // exel 파일로부터 데이터를 추출하여 List<TrackInfo> 객체로 반환하는 함수
    	List<TrackInfo> getTrackInfoFromXlsx() throws IOException, ParseException {
    	// 엑셀 파일을 읽어들일 FileInputStream 객체 생성
    	// 경로는 사용자 환경에 맞게 세팅해주셔야합니다
    	FileInputStream fis = new FileInputStream(new File("C:\\Users\\h\\Desktop\\ProjectTeam\\src\\main\\resources\\metadata\\music_all_230510(1).xlsx"));
    	
    	// XSSFWorkbook 객체를 생성하여 엑셀 파일을 읽음
    	XSSFWorkbook workbook = new XSSFWorkbook(fis);
    	
    	// sheetIndex 변수에 0을 할당하여 첫 번째 시트를 선택함
    	int sheetIndex = 0;
    	
    	// sheet 변수에 XSSFWorkbook 객체에서 getSheetAt 메소드를 사용하여 SheetIndex에 해당하는
    	// 시트를 가져옴
    	XSSFSheet sheet = workbook.getSheetAt(sheetIndex);
    	
    	// 헤더 정보 추출
    	int colCnt = sheet.getRow(0).getPhysicalNumberOfCells();
    	String[] headers = new String[colCnt];
    	XSSFRow headerRow = sheet.getRow(0);
    	
    	// headerRow에 있는 셀 정보를 이용하여 헤더 정보를 추출 한 뒤 headers 배열에 저장
    	for (int i = 0; i<colCnt; i++) {
    		XSSFCell cell = headerRow.getCell(i);
    		headers[i] = cell.getStringCellValue();
    	}
    	
    	// TrackInfo 객체를 담을 ArrayList 생성
    	List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
    	
    	// rowIterator 객체 생성
    	Iterator<Row> rowIterator = sheet.iterator();
    	// 첫 번째 줄(헤더) 제거
    	rowIterator.next();
    	
    	// rowIterator를 이용하여 엑셀 파일의 데이터를 추출하여 객체 생성
    	while(rowIterator.hasNext()) {
    		XSSFRow row = (XSSFRow)rowIterator.next();
    		TrackInfo trackInfo = new TrackInfo();
    		
    		// rowVariable을 이용하여 각 열 데이터를 추출하여 TrackInfo 객체의 변수에 세팅
    		for(int i = 0; i<headers.length; i++) {
    			XSSFCell cell = row.getCell(i);
    			// cell 값이 null일 경우 continue
    			if(cell == null) {
    				continue;
    			}
    			// cell의 type에 따라 처리할 범위 지정
    			switch (cell.getCellType()) {
    			case NUMERIC:
    				//release_date 값은 DATE타입으로 받아오기
    				if (isDateColumn(headers[i])) {
    					trackInfo.setRelease_date(formatDate(cell.getDateCellValue().toString()));
    				} else if (headers[i].equals("track_id")) {
    					trackInfo.setTrack_id((int)cell.getNumericCellValue());
    				} else if (headers[i].equals("album_id")) {
    					trackInfo.setAlbum_id((int)cell.getNumericCellValue());
    				} else if (headers[i].equals("like_count")) {
    					trackInfo.setLike_count((int)cell.getNumericCellValue());
    				}
    				break;
    			case STRING:
    				if (headers[i].equals("title")) {
    					trackInfo.setTitle(cell.getStringCellValue());
    				} else if(headers[i].equals("artist")) {
    					trackInfo.setArtist(cell.getStringCellValue());
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
    	
    	workbook.close(); // XSSFWorkbook 닫기
    	fis.close(); // FileInputStream 닫기
    	
    	return trackInfos;
    }
	
    	/**
    	 * @author 박정수
    	 * 년도가 2023년인 트랙 정보를 랜덤하게 선택하여 반환하는 함수입니다.
    	 * @param trackInfo 년도별 트랙 정보 리스트
    	 * @return 2023년의 랜덤한 트랙 정보 리스트
    	 * @throws ParseException 날짜 파싱 예외가 발생할 경우
    	 */
    	public List<TrackInfo> getRandomTracksFrom2023(List<TrackInfo> trackInfo) throws ParseException {
    		
    		// 날짜 비교용 날짜형 데이터 생성
    	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
    	        	    
    	    List<TrackInfo> filteredTracks = trackInfo.stream()
    	    		// track을 인자로 하는 람다식 사용합니다 참 또는 거짓을 리턴함
    	    		// 람다식은 함수와 같다고 강사님이 하셨습니다.
    	            .filter(track -> {
    	                try {
    	                    Date releaseDate = dateFormat.parse(track.getRelease_date());
    	                    return releaseDate.after(dateFormat.parse("2020.01.01"));
    	                } catch (ParseException e) {
    	                    return false;
    	                }
    	            })
    	            .collect(Collectors.toList());

    	    List<TrackInfo> randomTracks_2023 = new ArrayList<>();
    	    Random random = new Random();

    	    int totalTracks = filteredTracks.size();
    	    int trackCount = Math.min(totalTracks, 300); // 최대 100개의 랜덤 트랙 선택

    	    // 랜덤하게 트랙 선택 (중복 제거)
    	    while (randomTracks_2023.size() < trackCount) {
    	        int randomIndex = random.nextInt(totalTracks);
    	        TrackInfo track = filteredTracks.get(randomIndex);
    	        
    	        // 중복된 트랙인 경우 다시 선택
    	        if (!randomTracks_2023.contains(track)) {
    	            randomTracks_2023.add(track);
    	        }
    	    }

    	    return randomTracks_2023;
    	}
}
