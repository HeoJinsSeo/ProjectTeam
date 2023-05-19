<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HYPE MUSIC 회원가입</title>
</head>
<link rel="stylesheet" href="/Signup.css">
<body>
	<div id="wrap">
		<header class="pageHeader">
			<a href="http://localhost:8081/Mainpage" class="logo">
				<img width="180px" height="100px" src="/img/logo_ex.jpg">
			</a>
		</header>
	<form id="boxes" method="post" action="Signup">
		<div id="inputGroup">
			<div id="input">
				<div class="label-wrapper">
					<label for="id" id="lb">아이디</label><br>
				</div>
				<input type="text" name="id"><br>
				<div class="notice">아이디는 영문으로 시작하고 숫자를 포함하는 5자 이상 10자 이하여야 합니다.</div>
			</div>
			<div id="input">
				<div class="label-wrapper">
					<label for="password" id="lb">비밀번호</label><br>
				</div>
				<input type="password" name="password"><br>
				<div class="notice">비밀번호는 영문, 숫자, 특수문자를 최소 한 글자 이상 포함하는</div>
				<div class="notice">8~16자여야 합니다.</div>
			</div>
			<div id="input">
				<div class="label-wrapper">
					<label for="password-confirm" id="lb">비밀번호 확인</label><br>
				</div>
				<input type="password" name="password-confirm"><br>
			</div>
			<div id="input">
				<div class="label-wrapper">
					<label for="age" id="lb">나이</label><br>
				</div>
				<input type="text" name="age"><br>
			</div>
			<br>
    		<div id="input">
    			<div class="label-wrapper">
       				<label for="preference" id="lb">선호 장르</label>
       			</div>
      				<select id="preference" name="preference">
           				<option class="genre-options" value="ballad">발라드</option>
           				<option class="genre-options" value="OST">OST</option>
           				<option class="genre-options" value="indie">인디</option>
           				<option class="genre-options" value="dance">댄스</option>
           				<option class="genre-options" value="pop">팝</option>
           				<option class="genre-options" value="folk">포크</option>
           				<option class="genre-options" value="RNB">알앤비</option>
           				<option class="genre-options" value="soul">소울</option>
           				<option class="genre-options" value="jazz">재즈</option>
           				<option class="genre-options" value="metal">메탈</option>
           				<option class="genre-options" value="newage">뉴에이지</option>                
       				</select>
   				</div>
   				<br>
   			<div id="input">
				<input type="submit" id="submit" value="회원가입">
			</div>
		</div>
      </form>      
   </div>
   
<script>
	
	document.querySelector("#submit").onclick = function(){
	let id = document.querySelector('input[name="id"]').value.trim();
	// 영문으로 시작하고 숫자를 포함하는 5자 이상인 정규식
	let idRegex = /^[a-zA-Z][a-zA-Z0-9]{5,10}$/;
	let password = document.querySelector('input[name="password"]').value;
	let password_confirm = document.querySelector('input[name="password-confirm"]').value.trim();
	// 영문,숫자,특수문자 최소 하나씩 포함하는 최소 8~최대 16 글자인 정규식
	let passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W)(?!.*\s).{8,16}$/; 
	let age = document.querySelector('input[name="age"]').value.trim();
	// 0부터 120까지 입력받는 정규식
	let ageRegex = /^([0-9]|[0-9][0-9]|1[01][0-9]|120)$/;
		if ( id.length === 0 ) {
			alert("아이디를 입력해주세요.");
			event.preventDefault();
		} else if (!id.match(idRegex)){
			alert("아이디는 영문으로 시작하여 숫자를 포함한 5자 이상 10자 이하여야 합니다.");
			event.preventDefault();
		} else if ( password.length === 0) {
			alert("비밀번호를 입력해주세요.");
			event.preventDefault();
		} else if (!password.match(passwordRegex)){
			alert("비밀번호는 영문, 숫자, 특수문자를 최소 한 글자 이상 포함하는"
					+ "8자 이상 16자 이하여야 합니다.");
			event.preventDefault();
		} else if ( password !== password_confirm ){
			alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();
		} else if ( age.length === 0) {
			alert("나이를 입력해주세요.");
			event.preventDefault();
		} else if (!age.match(ageRegex)){
			alert("나이는 0부터 120까지 입력 가능합니다.");
			event.preventDefault();
		} 
		
	}
</script>
<footer id="footer">
	<div class="copyright"> ⓒ HMC HypeMusicStudio Corp. All rights reserved.</div>
</footer>
</body>
</html>