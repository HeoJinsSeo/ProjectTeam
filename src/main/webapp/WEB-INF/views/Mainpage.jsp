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
<link rel="stylesheet" href="/footer.css">
</head>
<header>
<jsp:include page="header.jsp"></jsp:include>    
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