<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	function closePage(){
		window.open('', '/',''); // 새로운 빈 페이지를 열고 현재 페이지로 대체
		window.close(); // 현재 페이지를 닫는 자바스크립트 호출
	}
</script>
<link rel="stylesheet" href="/ad.css">
</head>

<body>

<p>무제한 듣기 이용권 구입</p>

<table width="800px" height="400px">
	<tr>
		<td >1개월 Streaming 무제한</td>
		<td >1개월 Streaming 무제한 + 다운로드 20곡</td>
		<td>쿠폰 할인 50%</td>
	</tr>

<div class="img2">
<a href="https://unsplash.com/ko">
	<img src="img/img2.png" alt="이미지">
</a>
</div>


<footer>

	
	<button onclick="closePage()">팝업창 닫기</button>
	
</footer>
</body>
</html>