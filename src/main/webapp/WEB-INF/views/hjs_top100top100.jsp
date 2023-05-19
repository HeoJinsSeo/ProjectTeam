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
<style>
.suffle_listen:hover,
.all_listen:hover,
.listen:hover,
.put:hover,
.down:hover,
.FLAC:hover,
.present:hover
 {
    background-color:#04aa6d;
    color: white;
    cursor: pointer;
    background-size: 50%; /* Show only half of the background color */
    background-position: right; /* Align the background to the right */
}	
</style>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

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
					<!--  곡정보 이미지 추가 -->
					<td><a href="/musicInfo?track_id=${searchResult.track_id }" id="info"><img src = "/img/music_info_icon2.jpg" style="border: none; width: 25px; height: 30px;"></a></td>
					<td>
						 <div class="track">
          				 <a href="/musicInfo?track_id=${trackInfo_like.track_id }"><img src="${trackInfo_like.album_image}"></a>
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
					<td><a href="#"><img src="img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td>
					<!-- 담기 버튼 -->
					    <c:if test="${rank == null || rank < 1}">
					        <a href="#" onclick="showLoginAlert()">
					            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					    </c:if>
					    <c:if test="${rank != null && rank >= 1}">
					    		<!--  onclick 이벤트 jsp 불러오는 함수에 맞게 꼭 변경해주세요! -->
					        <a href="#" onclick="addTrack('${trackInfo_like.track_id}')">
					            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
						    <script>
						        function showLoginAlert() {
						            alert("로그인이 필요합니다.");
						        }
						        // ajax 방식으로 변경
						        function addTrack(trackId) {
						            $.ajax({
						                url: '/addTrack',
						                type: 'POST',
						                data: { addTrack: trackId },
						                success: function(response) {
						                    alert("음악 담기 성공!"); // 음악 담기 성공시 알림창 띄우기
						                    console.log(response);  
						                },
						                error: function(error) {
						                    alert("이미 담겨 있는 음악입니다!"); // 이미 담겨 있는 음악일시 알림창 띄우기
						                    console.log(error);  
						                }
						            });
						        }
						    </script>
					    </c:if>
					<!-- 여기까지가 담기 버튼입니다 -->	
					</td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4" style="border: none; width: 20px; height: 20px;"></a></td>					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>   
</div>
</body>
<footer>
<jsp:include page="footer.jsp"></jsp:include>   
</footer>
</html>
    			
    			
 