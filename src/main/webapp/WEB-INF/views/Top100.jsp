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
        <img src="img/logo2.jpg" alt="�ΰ�" class="logo" onclick="location.href='/Mainpage';">
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

	<!-- ��� Top100 �ΰ� -->
	<div class="wrap_btn">
		<br>
		<br>
		
		<div class="content_box" item-align="left">
			<h2>Top100</h2>
		</div>
	</div>	
	
	
	<!-- ��� ��¥ �Է� -->
	<div class="date">
	
	</div>
	
	
	<!-- ���� 100�� ����Ʈ -->	
	<div id="tb_list">
	
		<div class="select_button" alt="select_button">
			<button class="btn suffle">���õ��</button>
			<button class="btn_all_listen">��ü���</button>
			<button class="btn_listen">���</button>
			<button class="btn_put">���</button>
			<button class="btn_down">�ٿ�</button>
			<button class="btn_plac">FLAC</button>
			<button class="btn_present">����</button>
		
		</div>
		
		<table>
		
		<!-- ����Ʈ ���� -->
			<thead>
				<tr>
					<th>��</th>
					<th>����</th>
					<th></th>
					<th></th>
					<th>������</th>
					<th>�ٹ�</th>
					<th>���ƿ�</th>
					<th>���</th>
					<th>���</th>
					<th>�ٿ�</th>
					<th>�º�</th>
				</tr>
			</thead>

		<!-- �� ����Ʈ 100�� -->
			<tbody>
			
				<tr>
					<td>��</td>
					<td>1</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40849/4084947.jpg?version=20230414004012.0" alt="�ٹ�����"></a></td>
					<td>I AM</td>
					<td>I've IVE</td>
					<td>141,313</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>2</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40859/4085992.jpg?version=20230509025819.0" alt="�ٹ�����"></a></td>
					<td>UNFORGIVEN</td>
					<td>UNFORGIVEN</td>
					<td>68,676</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>3</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40849/4084947.jpg?version=20230414004012.0"></a></td>
					<td>Kitsch</td>
					<td>I've IVE</td>
					<td>122,689</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>4</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40857/4085791.jpg?version=20230509004441.0"></a></td>
					<td>�տ���</td>
					<td>SEVENTEEN 10th Mini Albumn</td>
					<td>100,916</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>5</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/204715/20471520.jpg?version=20220721043332.0"></a></td>
					<td>Spicy</td>
					<td>MY WORLD</td>
					<td>36,274</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>6</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40850/4085066.jpg?version=20230411020709.0"></a></td>
					<td>��</td>
					<td>ME</td>
					<td>97,579</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>7</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40859/4085908.jpg?version=20230429003924.0"></a></td>
					<td>����</td>
					<td>����</td>
					<td>17,110</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>8</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40835/4083586.jpg?version=20230314012829.0"></a></td>
					<td>������ �ؾ���</td>
					<td>�μ���</td>
					<td>150,916</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>9</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40856/4085673.jpg?version=20230421064519.0"></a></td>
					<td>������� ���ؿ�</td>
					<td>1�� Alone</td>
					<td>25,215</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
				<tr>
					<td>��</td>
					<td>10</td>
					<td>��</td>
					<td><a href="#"><img src="https://image.bugsm.co.kr/album/images/200/40824/4082425.jpg?version=20230105002539.0"></a></td>
					<td>Ditto</td>
					<td>NewJeans 'OMG'</td>
					<td>254,695</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
					<td>������</td>
				</tr>
				
			</tbody>
		</table>
		
	
	</div>
		
	
	
	
	







</body>
</html>