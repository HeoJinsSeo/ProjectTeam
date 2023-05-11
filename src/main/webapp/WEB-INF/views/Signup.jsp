<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${param.error}">
    <div class="alert alert-danger" role="alert">
        이미 존재하는 ID입니다.
    </div>
</c:if>
<body>
	    <h1>회원가입 페이지</h1>
    <form method="post" action="Signup">
        <div>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id">
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <div>
            <label for="age">age:</label>
            <input type="number" id="age" name="age">
        </div>
         <div>
            <label for="preference">Preference:</label>
            <select id="preference" name="preference">
                <option value="ballad">발라드</option>
                <option value="OST">OST</option>
                <option value="indie">인디</option>
                <option value="dance">댄스</option>
                <option value="pop">팝</option>
                <option value="folk">포크</option>
                <option value="RNB">알앤비</option>
                <option value="soul">소울</option>
                <option value="jazz">재즈</option>
                <option value="metal">메탈</option>
                <option value="newage">뉴에이지</option>                
            </select>
        </div>
        <input type="submit" value = "summit">
        <a href="Mainpage"><button type="button">메인페이지</button></a>        
    </form>
   
</body>
</html>