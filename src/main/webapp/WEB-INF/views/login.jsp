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

<p>안녕하세요. 로그인을 해주세요:)</p>

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

<p2>회원가입은 여기서 해주세요!</p2><br>
<br>

<input id="button" type="button" onclick="location.href='/Signup';" value="회원가입하기">
   
<br>


</body>
</html>