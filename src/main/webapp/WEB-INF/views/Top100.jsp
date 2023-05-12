<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<header>
<link rel="stylesheet" href="/Top100.css">

<div id="util_menu">
	<div class="head_top_left">
		<a title="이용권구매"><button class="buy_ticket_btn" onclick="location.href='/ad';">이용권구매</button></a>
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
        <img src="img/logo2.jpg" alt="로고" class="logo" onclick="location.href='/Mainpage';">
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

	<!-- 상단 Top100 로고 -->
	<div class="wrap_btn">
		<br>
		<br>
		
		<div class="content_box" item-align="left">
			<h2>Top100</h2>
		</div>
	</div>	
	
	
	<!-- 상단 날짜 입력 -->
	<div class="date">
	
	</div>
	
	
	<!-- 음악 100곡 리스트 -->	
	<div id="tb_list">
	
		<div class="select_button" alt="select_button">
			<button class="btn suffle">셔플듣기</button>
			<button class="btn_all_listen">전체듣기</button>
			<button class="btn_listen">듣기</button>
			<button class="btn_put">담기</button>
			<button class="btn_down">다운</button>
			<button class="btn_plac">FLAC</button>
			<button class="btn_present">선물</button>
		
		</div>
		
		<table>
		
		<!-- 리스트 제목 -->
			<thead>
				<tr>
					<th>□</th>
					<th>순위</th>
					<th></th>
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

		<!-- 곡 리스트 100개 -->
			<tbody>
			
				<tr>
					<td>□</td>
					<td>1</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40849/4084947.jpg?version=20230414004012.0" alt="앨범자켓"></a></td>
					<td>I AM</td>
					<td>I've IVE</td>
					<td>141,313</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>2</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40859/4085992.jpg?version=20230509025819.0" alt="앨범자켓"></a></td>
					<td>UNFORGIVEN</td>
					<td>UNFORGIVEN</td>
					<td>68,676</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>3</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40849/4084947.jpg?version=20230414004012.0"></a></td>
					<td>Kitsch</td>
					<td>I've IVE</td>
					<td>122,689</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>4</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40857/4085791.jpg?version=20230509004441.0"></a></td>
					<td>손오공</td>
					<td>SEVENTEEN 10th Mini Albumn</td>
					<td>100,916</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>5</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/204715/20471520.jpg?version=20220721043332.0"></a></td>
					<td>Spicy</td>
					<td>MY WORLD</td>
					<td>36,274</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>6</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40850/4085066.jpg?version=20230411020709.0"></a></td>
					<td>꽃</td>
					<td>ME</td>
					<td>97,579</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>7</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40859/4085908.jpg?version=20230429003924.0"></a></td>
					<td>물론</td>
					<td>물론</td>
					<td>17,110</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>8</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40835/4083586.jpg?version=20230314012829.0"></a></td>
					<td>파이팅 해야지</td>
					<td>부석순</td>
					<td>150,916</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>9</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40856/4085673.jpg?version=20230421064519.0"></a></td>
					<td>헤어지자 말해요</td>
					<td>1집 Alone</td>
					<td>25,215</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
				<tr>
					<td>□</td>
					<td>10</td>
					<td>ㅡ</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40824/4082425.jpg?version=20230105002539.0"></a></td>
					<td>Ditto</td>
					<td>NewJeans 'OMG'</td>
					<td>254,695</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
					<td>아이콘</td>
				</tr>
				
			</tbody>
		</table>
		
	
	</div>
		
	
	
	
	







</body>
</html>