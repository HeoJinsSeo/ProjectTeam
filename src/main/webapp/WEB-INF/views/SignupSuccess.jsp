<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HYPE MUSIC 가입 완료</title>
</head>
<style>

	html {
		background-color: #ebebeb;
	}
	
	.pageHeader{
		padding: 40px 0;
	}
	
	.logo{
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0 auto;
		width: 180px;
		height: 68px;
	}
	
	#mainBox {
		dispaly: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid lightgrey;
		background-color: white;
		width: 540px;
		height: 640px;
		margin: auto;
	}
	
	#mainBox .innerBox {
		display: flex;
		flex-direction: column;
		width: 500px;
		height: 600px;
		border: 1px solid lightgrey;
		margin: 20px 20px 20px 20px;
	}
	
	.announcement {
		padding-top: 20px;
		padding-bottom: 20px;
		text-align: center;
		color: #757575;
	}
	
	#btn {
		display: flex;
		justify-content: center;

	}
	
	#btn .home {
		border: 1px solid lightgrey;
		border-radius: 4px;
		text-align: center;
		font-size: 18px;
		background-color: #fec5e5;
		color: white;
		height: 50px;
		width: 280px;
	}
	
	#btn .home:hover {
		background-color: #faaad8;
		cursor: pointer;
		font-weight: bold;
		border: 2px solid grey;
	}
	
	#image {
		display: flex;
		margin: auto;
		padding-bottom: 80px;
		width: 260px;
		height: 260px;
	}
</style>
<body>
	<div id="pgWrap">
		<header class="pageHeader">
			<a href="http://localhost:8081/Mainpage" class="logo">
				<img width="180px" height="100px" src="/img/logo_ex.jpg">
			</a>
		</header>
		<div id="mainBox">
			<div class="innerBox">
				<div class="announcement">
					<h1>회원가입이 완료되었습니다</h1>
				</div>
				<div>
					<img id="image" src="/img/signup.png">
				</div>
				<div id="btn">
					<button class="home" onclick="location.href='http://localhost:8081/Mainpage'">
						메인페이지로
					</button>
				</div>
			</div>
		</div>
	
	
	</div>

</body>
</html>