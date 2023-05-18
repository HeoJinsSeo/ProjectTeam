<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>top100 top100</title>
</head>
<link rel="stylesheet" href="/hjs_top100top100.css">

<body>
<!-- 타이틀 로고 -->
<div class="section_1"></div>
	<h1>Top100</h1>

<!-- 날짜 -->
<div class="section_2">
<%
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd a h:mm");
        String formattedDateTime = dateFormat.format(currentDate);
    %>
</div>
	<h2><%= formattedDateTime %></h2>
	
<!-- 차트 top100 -->
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">셔플듣기</button>
			<button class="all_listen">모두듣기</button>
			<button class="listen">듣기</button>
			<button class="put">담기</button>
			<button class="down">다운</button>
			<button class="FLAC">FLAC</button>
			<button class="present">선물</button>
	</div>		
		<table>		
			<thead>				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th>순위</th>
					<th>ㅡ</th>
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>Like</th>
					<th>듣기</th>
					<th>담기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>			
    	<tbody>    	
    	<c:forEach var="trackInfo_like" items="${trackInfos_Like}" begin="0" end="99" varStatus="loop">				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>					
					<td>
						${loop.index + 1}
					</td>
					
					<td>ㅡ</td>
					<td>
						 <div class="track">
          				 <img src="${trackInfo_like.album_image}">
        				 	<div class="caption">
                			<p>${trackInfo_like.title}</p>
                			<p>${trackInfo_like.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${trackInfo_like.title}</p>
				      <p>${trackInfo_like.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${trackInfo_like.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${trackInfo_like.like_count}</p>
					</td>
					<td><a href="#"><img src="img/hjs_play.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjs_put.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4"></a></td>					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>   
</div>
</body>
</html>
    			
    			
 