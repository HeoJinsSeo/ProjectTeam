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
		<a title="�̿�Ǳ���"><button class="buy_ticket_btn" onclick="location.href='/ad';">�̿�Ǳ���</button></a>
	</div>
	<div class="head_top_right">
		<a title="ȯ���ڵ�"><span class="user_states">
		<c:choose>
		  <c:when test="${empty id}">
		    �湮��
		  </c:when>
		  <c:otherwise>
		    ${id}
		  </c:otherwise>
		</c:choose> </span>�� ȯ���մϴ�!</a>
		<a href="login" title="�α���"><button class="login_btn">�α���</button></a>
		<a href="Signup" title="ȸ������"><button class="signup_btn">ȸ������</button></a>
	</div>
	<div class="head_middle">
        <img src="img/logo2.jpg" alt="�ΰ�" class="logo">
        <input type="text" placeholder="�� �Ǵ� ������ �Է��ϼ���" class="search_box">
	</div>
    <div class="head_bottom_left">
      <button class="music_chart_btn">������Ʈ</button>
      <button class="new_music_btn">�ֽ�����</button>
      <button class="genre_music_btn">�帣����</button>
      <button class="star_magazine_btn">��Ÿ�Ű���</button>
      <button class="popular_music_video_btn">�α� ��������</button>
      <button class="music_4u_btn">����4U</button>
      <button class="board_btn">�Խ���</button>
      <hr class = "head_division_line">
    </div>
    
    <div class="head_bottom_right">
      <button class="my_music_btn">���̹���</button>
      <hr class = "head_division_line">
    </div>	
</div>
</header>
<body>
<div class="wrap_btn">
		<br>
		<br>
		
		<div class="content_box" item-align="left">
			<h2>�ֽžٹ�</h2>
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
				<h4>�̽��ͷζ� ����Ʈ PART1</h4>
				<h5>Various Artists</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h4>Ȳ�ݰ���</h4>
				<h5>�赿��</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h5>ȫ����</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h4>������ ����Ҳ�</h4>
				<h5>Joonand (�ֳ���)</h5>
				<h5>2023.05.12</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h4>Ʈ������ ������ ����Ʈ PART2</h4>
				<h5>Various Artists</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h5>���� (YOUNHA)</h5>
				<h5>2023.05.10</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
				<h5>Milena (�з���)</h5>
				<h5>2023.05.11</h5>
				<div class="item">
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
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
					<li>������1</li>
					<li>������2</li>
					<li>������3</li>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>