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
	#header {
	  display: flex;
	  flex-direction: column;
      justify-content: center;
      margin-left: auto;
      margin-right: auto;
	  width: 1000px;
	}
	
	.head_top {
      display: flex;
      height: 45px;
    }
    
    .head_top_left {
    	display: flex;
		justify-self: flex-start;
		margin-top: auto;
    }

    .head_top_right {
    	display: flex;
		justify-self: flex-end;
		margin-left: auto;
		line-height: 45px;
    }
    
    .head_middle {
    	display:flex;
    	justify-content: center;
    	align-items: center;
    	position: relative;
	    width: 80%;
	    margin: 0 auto;
	}	
	
    .head_bottom {
      display: flex;
      justify-content: space-between;
      flex-wrap: nowrap; 
  	  overflow-x: auto; 
    }    
    
    .head_bottom_left {
    	display: flex;
    	justify-self: flex-start;
        justify-content: space-between;
        /*float: left;*/
    }

    .head_bottom_right {
        display: flex;
        justify-self: flex-end;
        justify-content: space-between;
        /*float: right;*/
    }  

    .user_states {
        font-weight: bold;
    }

	.logo {
	    
	    width: 200px;
	    height: 100px;
	}
	form {
		width: 100%;
	}
	.search-input-container {
	 	flex-direction: row-reverse;
		display: flex;
		position: relative;
		width: 400px;
		margin-left: 40px;
		margin-right: auto;
		position: relative;
	}
	
	.search_box {
		width: 100%;
		top: 0px;
		margin-left: -20px;
  		height: 40px;
  		border-radius: 5px;
  		border: 2px solid grey;
  		padding: 5px 10px;
  		font-size: 16px;
	}
	
	.search-icon-container {
		display:flex;
		justify-content: center;
		align-items: center;
		width: 40px;
		margin-left: 50px;
	}
	
	.search-btn {
		background: transparent;
		border: 0px;
		
	}
	
	.search-btn:hover {
		cursor: pointer;
	}
	
	.search-btn-img {
		position: absolute;
  		top: 2px;
  		right: 23px;  		
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
	    <a href="Mainpage" title="Go_Mainppge">
	        <img src="img/logo2.jpg" alt="로고" class="logo">
	    </a>
	    <div class="search-input-container">
	        <form action="/search/${searchKeyword}" method="get">
	            <input type="text" name="searchKeyword" placeholder="곡 또는 가수를 입력하세요" class="search_box">
	            <div class="search-icon-container">
	                <button type="submit" class="search-btn">
	                    <img src="img/search_icon3.jpg" width="35px" height="35px" alt="검색아이콘" class="search-btn-img">
	                </button>
	            </div>
	        </form>
	    </div>
	</div>	
	<script>
    // form 태그 가져오기
    let searchForm = document.querySelector('.search-input-container > form');
    searchForm.addEventListener("submit", handleSubmit);

    // form 태그의 submit 이벤트 등록
    searchForm.addEventListener("submit", function(event) {
        // form submit 이벤트 막기
        event.preventDefault();
        // 검색어 가져오기
        let searchBox = document.querySelector(".search_box");
        let searchKeyword = searchBox.value;

        // ajax 요청 보내기
        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    let data = JSON.parse(xhr.responseText);
                    console.log(data);
                } else {
                    console.error(xhr.responseText);
                }
            }
        };

        xhr.open('POST', '/search');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({ keyword: searchKeyword }));
    });
	</script>
	
	<div class="head_bottom">
	    <div class="head_bottom_left">
	      <a href="top100" title="top100"><button class="music_chart_btn">음악차트</button></a>
	      <a href="newmusic" title="newmusic"><button class="new_music_btn">최신음악</button></a>
	      <a href="genremusic" title="genremusic"><button class="genre_music_btn">장르음악</button></a>
	      <a href="starmagazine" title="starmagazine"><button class="star_magazine_btn">스타매거진</button></a>
	      <a href="hotmv" title="hotmv"><button class="popular_music_video_btn">인기 뮤직비디오</button></a>
	      <a href="music4u" title="music4u"><button class="music_4u_btn">뮤직4U</button></a>
	      <button class="board_btn">게시판</button>
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
		  <button type="submit" name="Mainpage_Body_genre" value="recent">최신</button>
		  <button type="submit" name="Mainpage_Body_genre" value="dance">댄스</button>
		  <button type="submit" name="Mainpage_Body_genre" value="hiphop">힙합</button>
		  <button type="submit" name="Mainpage_Body_genre" value="ballad">발라드</button>
		  <button type="submit" name="Mainpage_Body_genre" value="OST">OST</button>
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