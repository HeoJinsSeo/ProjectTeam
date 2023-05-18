<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/Mainpage.css">
<link rel="stylesheet" href="/footer.css">
<link rel="stylesheet" href="/hjs_top100top100.css">

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

<!-- 타이틀 로고 -->
<div class="section_1"></div>
	<h1>마이뮤직</h1>

	
<!-- 내가 담은 노래 -->
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">셔플듣기</button>
			<button class="all_listen">모두듣기</button>
			<button class="listen">듣기</button>
			<button class="down">다운</button>
			<button class="FLAC">FLAC</button>
			<button class="present">선물</button>
	</div>		
		<table>		
			<thead>				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th>번호</th>
					<th>ㅡ</th>
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>좋아요</th>
					<th>듣기</th>
					<th>뺴기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>			
    	<tbody>    	
    	<c:forEach var="selectedTrack" items="${selectedTracks}" begin="0" end="99" varStatus="loop">				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>					
					<td>
						${loop.index + 1}
					</td>
					
					<td>ㅡ</td>
					<td>
						 <div class="track">
          				 <img src="${selectedTrack.album_image}">
        				 	<div class="caption">
                			<p>${selectedTrack.title}</p>
                			<p>${selectedTrack.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${selectedTrack.title}</p>
				      <p>${selectedTrack.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${selectedTrack.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${selectedTrack.like_count}</p>
					</td>					 
					<td><a href="#"><img src="img/hjs_play.png" class="logo1"></a></td>
					<td><a href="/removeTrack?trackId=${selectedTrack.track_id}&action=remove"><img src="img/hjs_remove.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4"></a></td>				
					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>   
</div>

</body>
</html>