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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mainpage.css?after">
</head>
<header>
<div id="header">
	<div class = head_top>
		<div class="head_top_left">
			<a title="이용권구매" href = "/hjs_ad"><button class="buy_ticket_btn">이용권구매</button></a>
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
        <a href="/Mainpage" title="Go_Mainppge">
        	<img src="/img/logo2.jpg" alt="로고" class="logo">
        </a>
        <div class="search-input-container">
        	<form action="/search" method="get" id="search-form">
				<input type="text" name="keyword" placeholder="곡 또는 가수를 입력하세요" class="search_box">
		  		<div class="search-icon-container">
					<button type="submit" class="search-btn"><img src="/img/search_icon3.jpg" width="35px" height="35px" alt="검색아이콘" class="search-btn-img"></button>
		  		</div>
		  	</form>
		  	<pre id="search-results"></pre>
		 </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		const form = document.querySelector('#search-form'); // form 태그 가져오기
		const input = document.querySelector('input[name=keyword]'); // input 태그 가져오기
	
		form.addEventListener('submit', function(event) { // form submit 이벤트 리스너 등록
		    event.preventDefault(); // 기본 동작(새로고침) 막기
	
		    const keyword = input.value; // 검색어 가져오기
	
		    if (keyword.trim().length === 0) {
		        alert("검색어를 입력해주세요.");
		        event.preventDefault();
		    } else {
		        const url = '/search/' + keyword; // URL 생성
		        window.location.href = url; // URL 변경
		    }
		});		
	</script>	
	<div class="head_bottom">
	    <div class="head_bottom_left">
	      <a href="/musicchart_2" title="top100"><button class="music_chart_btn">음악차트</button></a>
	      <a href="/newalbum" title="newmusic"><button class="new_music_btn">최신음악</button></a>
	      <a href="/genremusic" title="genremusic"><button class="genre_music_btn">장르음악</button></a>
	      <a href="/magazine" title="starmagazine"><button class="star_magazine_btn">스타매거진</button></a>
	      <a href="/hotmv" title="hotmv"><button class="popular_music_video_btn">인기 뮤직비디오</button></a>
	      <a href="/music4u" title="music4u"><button class="music_4u_btn">뮤직4U</button></a>
	      <a href="/letter_table" title="board"><button class="board_btn" >게시판</button></a>
	      <a href="/mymusic" title="mymusic"><button class="my_music_btn">마이뮤직</button></a>	      
	    </div> 
	    <div class="head_bottom_right">
	      	<c:choose>
	          <c:when test="${empty id}">
	            <a href="/login" title="로그인"><button class="login_btn">로그인</button></a>
	            <a href="/Signup" title="회원가입"><button class="signup_btn">회원가입</button></a>
	          </c:when>
	          <c:otherwise>
	            <a href="/hjs_myInfo" title="내정보"><button class="myInfo_btn">내정보</button></a>
	            <a href="/logout" title="로그아웃"><button class="logout_btn">로그아웃</button></a>
	          </c:otherwise>
	        </c:choose>	    
	    </div>
	   </div>	
	</div>
	        <hr class="header_line">        
</header>
<body>

</body>
</html>