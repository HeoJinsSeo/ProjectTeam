<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.study.springboot.TrackInfo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${keyword }에 대한 검색결과</title>
<link rel="stylesheet" href="/Mainpage.css?after">
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
<div id="keyword-container">
	<h1>"${keyword }"&nbsp에 대한 검색결과입니다</h1>
</div>
<div id="search-result-container">
	<c:forEach var="searchResult" items="${searchResults }">
		<div>
			<img src="${searchResult.album_image }" width="128px" height="128px">
			<h4>${searchResult.title }</h4>
			<a href="#">곡 정보</a>
			<p>${searchResult.artist }</p>
			<p>${searchResult.album }</p>
			<p>${searchResult.release_date }</p>
			<p>${searchResult.like_count }</p>
			<a href="${searchResult.news1 }">news1</a>
			<a href="${searchResult.news2 }">news2</a>
			<a href="${searchResult.news2 }">news3</a>
			<input type="button" name="play" value="재생">
			<input type="button" name="add" value="담기">
		</div>
	</c:forEach>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(document).ready(function(){
		// 결과 페이지가 로딩될 때, 아래 코드가 실행됩니다.
	    let trackInfos = [];
	    $.ajax({
			url: "/infos", // AJAX 요청을 보낼 URL
			method: "GET", // 요청 방식
			dataType: "json", // 데이터 타입
			success: function(jsonStr){
				// AJAX 요청이 성공할 경우 실행되는 함수
				trackInfos = JSON.parse(jsonStr);
				let searchResults = [];
	            let searchParams = new URLSearchParams(document.location.search.substring(1));
	            let keyword = searchParams.get("keyword").toLowerCase();
	            $.each(trackInfos, function(index, item){
	            	// 검색어로 필터링된 리스트를 생성
	                if(item.album_image.toLowerCase().indexOf(keyword) > -1
	                   || item.title.toLowerCase().indexOf(keyword) > -1 
	                   || item.artist.toLowerCase().indexOf(keyword) > -1 
	                   || item.album.toLowerCase().indexOf(keyword) > -1
	                   || item.release_date.toLowerCase().indexOf(keyword) > -1
	                   || item.like_count.toLowerCase().indexOf(keyword) > -1
	                   || item.news1.toLowerCase().indexOf(keyword) > -1
	                   || item.news2.toLowerCase().indexOf(keyword) > -1
	                   || item.news3.toLowerCase().indexOf(keyword) > -1){
	                    searchResults.push(item);
	                }
	            });
	            let resHTML = '';
	            for(let i=0;i<searchResults.length;i++){
	            	let trackInfo = searchResults[i];
	            	resHTML += `
	            	<div>
	            		<h4>${trackInfo.title}</h4>
	            		<p>${trackInfo.artist}</p>
	            		<p>${trackInfo.album}</p>
	            	</div>`;
	            }
	            // HTML 출력
	            $('#search-result-container').html(resHTML);
			},
			error: function(){
				// AJAX 요청이 실패할 경우 실행되는 함수
				alert("An error occured!");
			}
		});
	});

</script>

</body>
</html>