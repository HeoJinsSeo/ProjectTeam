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
<p>안녕하세요. 로그인을 해주세요:)</p>

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
<p th:text="${loginMessage}" style="color: blue"></p>

<p2>회원가입은 여기서 해주세요!</p2><br>
<br>

<input id="button" type="button" onclick="location.href='/join';" value="회원가입하기">

<!-- 아이디와 비밀번호 일치 여부 확인 -->
<script>
	/* document.getElementById("loginForm").addEventListener("submit",function (event){
		event.preventDefault(); /* 폼 기본 제출 동작 방지 */
	/* 	let memId = document.getElementById("memId").value;
		let memPw = document.getElementById("memPw").value;
		 */
		/* 아이디와 비밀번호 일치여부 결과 (예시로 true로 설정) */
	/* 	let isValid = true;
		
		if(isValid){
			
			//데이터를 서버로 전송하는 코드
			let formData = new FormData();
			formData.append("memId", memId);
			formData.append("memPw", memPw);
			
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/service");
			xhr.onreadystatechange = function() {
				if(xhr.readyState === XMLHttpRequest.DONE) {
					if(xhr.status === 200) { */
						//서버로부터 응답을 받았을 때 처리할 코드
						//예를 들어, 로그인 성공 시 다음 페이지로 이동하는 등의 동작을 수행
						//window.location.href = "/service";
				//	} else {
						//서버로부터 응답이 실패했을 때 처리할 코드
				//		console.error("서버 응답이 실패했습니다.");
			//		}
			//	}
		//	};
		//	xhr.send(formData);
	//	} else {
			
			/* 아이디와 비밀번호가 일치하지 않는 경우, 에러 메시지 표시 */
	    //	let errorMessage = document.createElement("p");
		//	errorMessage.style.color = "red";
		//	errorMessage.textContent = "아이디 또는 비밀번호가 일치하지 않습니다~!";
		//	document.body.appendChild(errorMessage);
			
	//	}
		
//	});
 
</script>
   
<br>

</body>
</html>