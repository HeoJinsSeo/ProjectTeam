<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<!DOCTYPE html>
<html>
<head>
<title>HYPEMUSIC STUDIO</title>
</head>
<link rel="stylesheet" href="/Mainpage.css">

<link rel="stylesheet" href="/footer.css">
<style>
    #recent_track{	    
    	margin-left:105px;
     }
       .track {
           display: inline-block;
           width: 200px;
           height: 200px;
           margin: 2px;
           position: relative;
           overflow: hidden;
       }
    .track-wrapper {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 2px;
        justify-items: center; /* 가로 중앙 정렬을 위해 추가 */
     }       

       .track img {
           width: 100%;
           height: 100%;
           object-fit: cover;
       }

       .track .caption {
           position: absolute;
           bottom: 0;
           left: 0;
           width: 100%;
           background-color: rgba(0, 0, 0, 0.7);
           color: #fff;
           padding: 10px;
           opacity: 0;
           transition: opacity 0.3s ease;
       }
       
       .track:hover .caption {
           opacity: 1;
       }
               .pagination {
           margin-top: 20px;
       }

       .pagination button {
           margin-right: 5px;
       }

</style>
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
        <a href="Mainpage" title="Go_Mainppge"><img src="img/logo2.jpg" alt="로고" class="logo"></a>
		  <input type="text" placeholder="곡 또는 가수를 입력하세요" class="search_box">
		<!--<a href="" title="Search"><img src="img/search_icon3.jpg" alt="검색아이콘" class="search_btn"></a>  -->
	</div>
	<div class="head_bottom">
	    <div class="head_bottom_left">
	      <a href="top100" title="top100"><button class="music_chart_btn">음악차트</button></a>
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
    	<button onclick="showGenre('recent')">최신</button>
        <button onclick="showGenre('dance')">댄스</button>
        <button onclick="showGenre('hiphop')">힙합</button>
        <button onclick="showGenre('ballad')">발라드</button>
    </div>

    <!-- 트랙 1-10 -->
    <div class="track-wrapper">
        <c:forEach var="trackInfo_2023" items="${trackInfos_2023}" begin="0" end="9">
        <div class="track">
            <img src="${trackInfo_2023.album_image}">
            <div class="caption">
                <p>${trackInfo_2023.title}</p>
                <p>${trackInfo_2023.artist}</p>
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