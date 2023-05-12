<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<header>
<link rel="stylesheet" href="/Newalbum.css">

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
<div class="wrap_btn">
		<br>
		<br>
		
		<div class="content_box" item-align="left">
			<h2>최신앨범</h2>
		</div>
	</div>	
	<div class="container">
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/42/669/11242669_20230511152825_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>미스터로또 베스트 PART1</h4>
				<h5>Various Artists</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/41/248/11241248_20230510154340_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>황금가면</h4>
				<h5>김동률</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/39/518/11239518_20230508140756_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>Fly away</h4>
				<h5>홍미진</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/40/929/11240929_20230510135141_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>마음을 고백할께</h4>
				<h5>Joonand (주낸드)</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/41/255/11241255_20230510161119_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>트랄랄라 브라더스 베스트 PART2</h4>
				<h5>Various Artists</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/40/350/11240350_20230509165510_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>YOUNHA Studio Live Album 'MINDSET...</h4>
				<h5>윤하 (YOUNHA)</h5>
				<h5>2023.05.10</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/40/428/11240428_20230509181051_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>Dancing on the table</h4>
				<h5>Milena (밀레나)</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		<div class="table1">
			<div class="album">
				<a href="#">
					<img src="https://cdnimg.melon.co.kr/cm2/album/images/112/39/880/11239880_20230509100245_500.jpg/melon/resize/360/quality/80/optimize">
				</a>
			</div>
			<div class="album_info">
				<h4>Restart : 20th</h4>
				<h5>KCM</h5>
				<h5>2023.05.10</h5>
				<div class="item">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>