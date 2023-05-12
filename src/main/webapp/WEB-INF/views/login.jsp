<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인을 해주세요!</title>

</head>

<% if (request.getParameter("error") != null) { %>
    <p>아이디 또는 비밀번호가 맞지 않습니다. 다시 시도해주세요.</p>
<% } %>

<link rel="stylesheet" href="/login.css">

<body style="text-align: center">
<<<<<<< HEAD

<p>안녕하세요. 로그인을 해주세요:)</p>
=======
<div class="logo">
<a href="#">
	<img src="img/logo2.jpg" alt="이미지">
</a>
</div>
<br>

<form id="loginForm" action="login" method="post">
	
	<div class="wrap">	
	
		<div class="id">
			<input id="id" name="id" type="text" placeholder="아이디">
		</div>
	
		<div class="password">
		<input id="password" name="password" type="password" placeholder="비밀번호">
		</div>
	
		<div class="submit-btn">
		<input id="submit" type="submit" value="로그인">
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

<<<<<<< HEAD
<input id="button" type="button" onclick="location.href='/Signup';" value="회원가입하기">
   
=======

<input id="button" type="button" onclick="location.href='/join';" value="광고배너">
>>>>>>> 23da742ee4d3e6263ecae42ebd1cbd6e46bc56f4
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