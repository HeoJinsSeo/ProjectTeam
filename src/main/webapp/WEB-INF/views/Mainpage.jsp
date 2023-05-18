<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<%@ page import="com.study.springboot.letterController" %>
<%@ page import="com.study.springboot.hjs_LoginController" %>
<!DOCTYPE html>
<html>
<head>
<title>HYPEMUSIC STUDIO</title>
<link rel="stylesheet" href="/Mainpage.css?after">
<link rel="stylesheet" href="/footer.css">
</head>
<header>
<div id="header">
	<div class = head_top>
		<div class="head_top_left">
			<a title="이용권구매"><button class="buy_ticket_btn">이용권구매</button></a>
		</div>
		<div class="head_top_right">
			<a title="환영코드"><span class="user_states">
			<c:choose>
			  <c:when test="${empty id}">
			    방문객
			  </c:when>
			  <c:otherwise>
			    ${id}
			  </c:otherwise>
			</c:choose> </span>님 환영합니다!</a>
		</div>
	</div>
	<div class="head_middle">
        <a href="Mainpage" title="Go_Mainppge">
        	<img src="img/logo2.jpg" alt="로고" class="logo">
        </a>
        <div class="search-input-container">
        	<form action="/search" method="get" id="search-form">
				<input type="text" name="keyword" placeholder="곡 또는 가수를 입력하세요" class="search_box">
		  		<div class="search-icon-container">
					<button type="submit" class="search-btn"><img src="img/search_icon3.jpg" width="35px" height="35px" alt="검색아이콘" class="search-btn-img"></button>
		  		</div>
		  	</form>
		  	<pre id="search-results"></pre>
		 </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	 	const form = document.querySelector('#search-form'); // form 태그 가져오기
	    const input = document.querySelector('input[name=keyword]');  // input 태그 가져오기
	    form.addEventListener('submit', function(event) { // form submit 이벤트 리스너 등록
	        event.preventDefault(); // 기본 동작(새로고침) 막기
	        const keyword = input.value; // 검색어 가져오기
	        const url = '/search/' + keyword; // URL 생성
	        window.location.href = url; // URL 변경
	    });			
	</script>	
	<div class="head_bottom">
	    <div class="head_bottom_left">
	      <a href="musicchart_2" title="top100"><button class="music_chart_btn">음악차트</button></a>
	      <a href="newmusic" title="newmusic"><button class="new_music_btn">최신음악</button></a>
	      <a href="genremusic" title="genremusic"><button class="genre_music_btn">장르음악</button></a>
	      <a href="starmagazine" title="starmagazine"><button class="star_magazine_btn">스타매거진</button></a>
	      <a href="hotmv" title="hotmv"><button class="popular_music_video_btn">인기 뮤직비디오</button></a>
	      <a href="music4u" title="music4u"><button class="music_4u_btn">뮤직4U</button></a>
	      <button class="board_btn" onclick="loadLetterTable()">게시판</button>
	      <a href="mymusic" title="mymusic"><button class="my_music_btn">마이뮤직</button></a>	      
	    </div> 
	    <div class="head_bottom_right">
	      	<c:choose>
	          <c:when test="${empty id}">
	            <a href="login" title="로그인"><button class="login_btn">로그인</button></a>
	            <a href="Signup" title="회원가입"><button class="signup_btn">회원가입</button></a>
	          </c:when>
	          <c:otherwise>
	            <a href="myInfo" title="내정보"><button class="myInfo_btn">내정보</button></a>
	            <a href="logout" title="로그아웃"><button class="logout_btn">로그아웃</button></a>
	          </c:otherwise>
	        </c:choose>	    
	    </div>
	   </div>	
	</div>
	        <hr class="header_line">        
</header>
<body>
<section id="recent_track">
    <h1>최신 음악</h1>
    <!-- 장르 버튼 -->
	<div class="genres">
		<form id="genreForm" method="POST" action="/Mainpage">
		  <button type="submit" name="Mainpage_Body_genre" class ="Mainpage_genre_btn" value="recent">최신</button>
		  <button type="submit" name="Mainpage_Body_genre" class ="Mainpage_genre_btn" value="dance">댄스</button>
		  <button type="submit" name="Mainpage_Body_genre" class ="Mainpage_genre_btn" value="hiphop">힙합</button>
		  <button type="submit" name="Mainpage_Body_genre" class ="Mainpage_genre_btn" value="ballad">발라드</button>
		  <button type="submit" name="Mainpage_Body_genre" class ="Mainpage_genre_btn" value="OST">OST</button>
		</form>
	</div>	
    <!--최신음악 트랙 1-10 -->
    <div class="track-wrapper"> 
        <c:forEach var="trackInfo_Mainpage_genres" items="${trackInfos_Mainpage_genres}" begin="0" end="9">
            <div class="track">
                <img src="${trackInfo_Mainpage_genres.album_image}">
                <div class="caption">
                    <p>${trackInfo_Mainpage_genres.title}</p>
                    <p>${trackInfo_Mainpage_genres.artist}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

</body>
<!--  선아님 Footer -->
<footer>
    <hr>
    <div>
        <ui class="footernav">
            <li><a href="#" class ="footer_text">이용약관</a></li>
            <li><a href="#" class ="footer_text">위치기반서비스 이용약관</a></li>
            <li><a href="#" class ="footer_text">개인정보처리방침</a></li>
            <li><a href="#" class ="footer_text">제휴/프로모션</a></li>
            <li><a href="#" class ="footer_text">이메일주소무단</a></li>
            <li><a href="#" class ="footer_text">파트너센터</a></li>
            <li><a href="#" class ="footer_text">문의사항</a></li>
        </ui>
    </div>

    <hr id="hr">

    <div class="info">
        <p>(주)하입봇엔터테인먼트</p>
        <p>영등포구 휴먼교육</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>

    <div class="info2">
        <p>(주)하입봇엔터테인먼트</p>
        <p>영등포구 휴먼교육</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>    
</footer>
</html>