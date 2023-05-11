<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HYPEMUSIC STUDIO</title>
</head>
<header>
<link rel="stylesheet" href="/Mainpage.css">

<div id="util_menu">
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
		<a href="login" title="로그인"><button class="login_btn">로그인</button></a>
		<a href="Signup" title="회원가입"><button class="signup_btn">회원가입</button></a>
	</div>
	<div class="head_middle">
        <img src="img/logo2.jpg" alt="로고" class="logo">
        <input type="text" placeholder="곡 또는 가수를 입력하세요" class="search_box">
	</div>
    <div class="head_bottom_left">
      <button class="music_chart_btn">뮤직차트</button>
      <button class="new_music_btn">최신음악</button>
      <button class="genre_music_btn">장르음악</button>
      <button class="star_magazine_btn">스타매거진</button>
      <button class="popular_music_video_btn">인기 뮤직비디오</button>
      <button class="music_4u_btn">뮤직4U</button>
      <button class="board_btn">게시판</button>
      <hr class = "head_division_line">
    </div>
    <div class="head_bottom_right">
      <button class="my_music_btn">마이뮤직</button>
      <hr class = "head_division_line">
    </div>	
</div>
</header>

<body>

</body>
</html>