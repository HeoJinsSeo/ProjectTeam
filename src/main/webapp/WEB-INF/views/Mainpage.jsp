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
</head>
<style>
	/*--------------------------------------------------------------------------------*/
	/*-------------이 부분부터 body 쪽 css 입니다------------------------------------------*/
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
                <a href="/musicInfo?track_id=${trackInfo_Mainpage_genres.track_id }"><img src="${trackInfo_Mainpage_genres.album_image}"></a>
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
<jsp:include page="footer.jsp"></jsp:include>   
</footer>
</html>