<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입을 해주세요.</title>
</head>
<link rel="stylesheet" href="/member.css">
<body style="text-align: center">
<p>안녕하세요. 회원가입을 해주세요.</p> 
<form action="/login" method="post">
	<div>
		<label for="memId" >아이디 :</label>
		<input id="memId" name="memId" type="text">
	</div>
	<div>
		<label for="memPw">비밀번호: </label>
		<input id="memPw" name="memPw" type="memPw">
	</div>
	<div>
		<label for="memName">이름 : </label>
		<input id="memName" name="memName" type="text">
	</div>	
	<div>
		<label for="memBirth">생년월일: </label>
		<input id="memBirth" name="memBirth" type="memBirth">
	</div>	
	<div>
		<label for="memEmail">이메일: </label>
		<input id="memEmail" name="memEmail" type="text">
	</div>	
	<div>
		<label for="memPhone">연락처 : </label>
		<input id="memPhone" name="memPhone" type="memPhone">
	</div>	
	<div>
		<label for="memAges">연령대 : </label>
		<input id="memAges" name="memAges" type="memAges">
	</div>	
	<br>
	<br>
		<input id="button" type="button" onclick="location.href='/login8';" value="저장">
</form>
</body>
</html>