<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�������� ���ּ���.</title>
</head>
<link rel="stylesheet" href="/member.css">
<body style="text-align: center">
<p>�ȳ��ϼ���. ȸ�������� ���ּ���.</p> 
<form action="/login" method="post">
	<div>
		<label for="memId" >���̵� :</label>
		<input id="memId" name="memId" type="text">
	</div>
	<div>
		<label for="memPw">��й�ȣ: </label>
		<input id="memPw" name="memPw" type="memPw">
	</div>
	<div>
		<label for="memName">�̸� : </label>
		<input id="memName" name="memName" type="text">
	</div>	
	<div>
		<label for="memBirth">�������: </label>
		<input id="memBirth" name="memBirth" type="memBirth">
	</div>	
	<div>
		<label for="memEmail">�̸���: </label>
		<input id="memEmail" name="memEmail" type="text">
	</div>	
	<div>
		<label for="memPhone">����ó : </label>
		<input id="memPhone" name="memPhone" type="memPhone">
	</div>	
	<div>
		<label for="memAges">���ɴ� : </label>
		<input id="memAges" name="memAges" type="memAges">
	</div>	
	<br>
	<br>
		<input id="button" type="button" onclick="location.href='/login8';" value="����">
</form>
</body>
</html>