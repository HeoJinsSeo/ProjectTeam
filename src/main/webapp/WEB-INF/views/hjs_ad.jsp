<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/hjs_ad.css?after">
</head>

<body>
<div class="container">
	<div class="section_1">
		<p>무제한 듣기 이용권 구입</p>
	</div>
	<div class="section_2">
		<div class="img2">
		<a href="https://unsplash.com/ko">
			<img src="/img/hjs_ad.png" alt="이미지">
		</a>
		</div>
	</div>
	
	<div class="section_3">
	
		<table width="800px" height="400px">
			<tr>
				<td >1개월 Streaming 무제한</td>
				<td >1개월 Streaming 무제한<br> 
			    	 + 다운로드 20곡</td>
			
			</tr>
	
		</table>
	</div>

</div>

<footer>

	
	<button onclick="location.href='/Mainpage';">오늘은 그만 보기</button>
	
</footer>
<script>
	function closePage(){
		window.open('', '/',''); // 새로운 빈 페이지를 열고 현재 페이지로 대체
		window.close(); // 현재 페이지를 닫는 자바스크립트 호출
	}
</script>
</body>
</html>