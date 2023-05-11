<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인을 해주세요!</title>
</head>

<link rel="stylesheet" href="/login.css">

<body style="text-align: center">
<div class="logo">
<a href="#">
	<img src="/logo2.jpg" alt="이미지">
</a>
</div>
<br>


<form id="loginForm" action="/service" method="post">
	
	<div class="wrap">
	
	
		<div class="memId">
			<input id="memId" name="memId" type="text" placeholder="아이디">
		</div>
	
	
	
		<div class="memPw">
		<input id="memPw" name="memPw" type="password" placeholder="비밀번호">
		</div>
	
		<div class="submit-btn">
		<input id="submit" type="submit"  value="로그인">
		</div>
	</div>
	
</form>

<%-- <p th:text="${loginMessage}" style="color: blue"></p> --%>

<div class="tab">
	<div class="item1">
		<a target="#" href="#">비밀번호 찾기</a>
	</div>
	<div class="item2">
		<a target="#" href="#">아이디 찾기</a>
	</div>
	<div class="item3">
		<a target="#" href="#">회원가입</a>
	</div>
</div>
<br>


<input id="button" type="button" onclick="location.href='/join';" value="광고배너">
<br>
<br>

<div class="tab2">
	<div class="item4">
		<a target="#" href="#">이용약관</a>
	</div>
	<div class="item5">
		<a target="#" href="#">위치기반서비스 이용약관</a>
	</div>
	<div class="item6">
		<a target="#" href="#">개인정보처리방침</a>
	</div>
</div>

</body>
</html>