<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>music4u</title>
</head>
<link rel="stylesheet" href="/hjs_music4u.css">

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<body>
 
    <!-- 타이틀 제목 -->
    <div class="section_1">
    	<h1>MUSIC FOR YOU~♡</h1>
    	<br>
    </div>
    
    <!-- 이미지와 소개 -->
    <div class="section_2">
    	<div class="title_img">
    		<a href="#" ><img src="https://cdnimg.melon.co.kr/svc/images/melondj/playlist/508844633_org.jpg?tm=20230515034004/melon/resize/x236/quality/80/optimize" alt></a>
    	</div>
    	<div class="title_logo">
    		<h3>국내와 해외의 만남! 아티스트 컬래버레이션</h3>
    		<h4>2023.05.15</h4>
    		<h4>좋아요</h4>
    	</div>
    
    </div>
    
    <!-- 소개글 -->
    <div class="section_3">
    	<h3>소개글</h3>
    	<h4>  국내X해외 아티스트들의, 예측불가 신선한 조합! 완벽한 케미를 보여주는, 팝 컬래버레이션!

            K팝의 부상으로 국내/해외 가수들의 협업이 더 이상 놀라운 일이 아니게 된 지금. 
            
            그중에서도 한국어 가사를 더해 국내 팬들에게는 반가움을, 해외 팬들에게는 신선함을 주는 
            
            팝트랙들 들려드릴게요. 다른 언어·다른 나라의 아티스트들이 만나 더욱 황금 시너지를 내는 
            
            매력적인 컬래버, 바로 만나보시죠!</h4>
    </div>
    
    <!-- 플레이 리스트 -->
    <div class="section_4">
    	<h3>플레이리스트</h3>
    	
    	<div class="music_btn">
	
			<input type="text" placeholder="장르를 검색해 주세요" id="search_box">
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
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>좋아요</th>
					<th>듣기</th>
					<th>담기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>
			
    	<tbody>    	
    	<c:forEach var="trackInfo_2023" items="${trackInfos_2023}" begin="0" end="9" varStatus="loop">
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					
					<td>
						${loop.index + 1}
					</td>
					<!--  곡정보 이미지 추가 -->
					<td><a href="/musicInfo?track_id=${trackInfo_2023.track_id}" id="info"><img src = "/img/music_info_icon2.jpg" style="border: none; width: 25px; height: 30px;"></a></td>
			
					
					<td>
						 <div class="track">
          				 <img src="${trackInfo_2023.album_image}">
        				 	<div class="caption">
                			<p>${trackInfo_2023.title}</p>
                			<p>${trackInfo_2023.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${trackInfo_2023.title}</p>
				      <p>${trackInfo_2023.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${trackInfo_2023.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${trackInfo_2023.like_count}</p>
					</td>
					<td><a href="#"><img src="img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td>		<!-- 담기 버튼 -->
		    <c:if test="${rank == null || rank < 1}">
		        <a href="#" onclick="showLoginAlert()">
		            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
		        </a>
		    </c:if>
		    <c:if test="${rank != null && rank >= 1}">
		    		<!--  onclick 이벤트 jsp 불러오는 함수에 맞게 꼭 변경해주세요! -->
		        <a href="#" onclick="addTrack('${trackInfo_2023.track_id}')">
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
		<!-- 여기까지가 담기 버튼입니다 -->	</td>
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