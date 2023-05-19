<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYINFO PAGE</title>
</head>
<link rel="stylesheet" href="/footer.css">

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #white;
    font-size: 20px;
}

h1 {
    text-align: center;
    color: gray;
    padding: 20px 0;
}

.info-container {
    max-width: 600px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 1px 3px 5px rgba(0.1, 0, 0, 0.5);
}

.info-item {
    display: flex;
    margin-bottom: 15px;
    font-size: 25px;
}
.info-item .info-value{
	font-size: 30px;
}
.info-item_age {
    display: flex;
    margin-bottom: 15px;
    font-size: 25px;
}
.info-item_age .info-value{
	font-size: 30px;
}
.info-item_genre {
    display: flex;
    margin-bottom: 15px;
    color: cornflowerblue;
    font-size: 25px;
    
}
.info-item_genre .info-value{
	color: cornflowerblue;
	font-size: 30px;
}
.info-item_level {
    display: flex;
    margin-bottom: 15px;
    color: #BA942B;
    font-size: 25px;
}
.info-item_level .info-value{
	color: #BA942B;
	font-size: 30px;
}

.info-label {
    flex-basis: 100px;
    color: #666;
    font-weight: bold;
}

.info-value {
    flex-grow: 1;
    color: #333;
}
</style>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<body>
    <h1>내정보</h1>
    <div class="info-container">
    
		        <div class="info-item">
		            <div class="info-label">ID:</div>
		            <span class="info-value">${id}</span>
		        </div>
		        <div class="info-item_age">
		            <div class="info-label">나이:</div>
		            <span class="info-value">${age}</span>
		        </div>
		        <div class="info-item_genre">
		            <div class="info-label">취향:</div>
		            <span class="info-value">${preference}</span>
		        </div>
		        <div class="info-item_level">
		            <div class="info-label">등급:</div>
		            <span class="info-value">${rank}</span>
		        </div>
	    	
  
    </div>
</body>
<!--  선아님 Footer -->
<footer>
    <hr>
    <div>
        <ui class="footernav">
            <li><a href="#" class ="footer_text">이용약관</a></li>
            <li><a href="#" class ="footer_text">위치기반서비스 이용약관</a></li>
            <li><a href="#" class ="footer_text">개인정보처리방침</a></li>
            <li><a href="#" class ="footer_text">제휴/프로모션</a></li>
            <li><a href="#" class ="footer_text">이메일주소무단</a></li>
            <li><a href="#" class ="footer_text">파트너센터</a></li>
            <li><a href="#" class ="footer_text">문의사항</a></li>
        </ui>
    </div>

    <hr id="hr">

    <div class="info">
        <p>(주)하입봇엔터테인먼트</p>
        <p>영등포구 휴먼교육</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>

    <div class="info2">
        <p>(주)하입봇엔터테인먼트</p>
        <p>영등포구 휴먼교육</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>
</footer>
</html>