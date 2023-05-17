<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
html{text-align: center;}
div{margin-left: auto; margin-right: auto; width:70%; }
h1{}
ol{width: 60%;margin-right: auto;margin-left: auto;}
li{text-align: start;}
textarea{min-width: 50%; min-height: 200px;}
button{}
</style>
<body>
    <h1>"${param.writer}"님의 "${param.title}" 을 보고 있습니다.</h1>


    <textarea>${text}</textarea>

	<form action="table_button" method="post">
        <button type="submit" name="buttonId" value="return">게시판으로 돌아가기</button>
        <button type="submit" name="buttonId" value="delete">내 글 삭제</button>
    </form>

</body>
<script>
	var deleteButton = document.getElementById('delete');

	deleteButton.addEventListener('click', function () {
	    if (deleteButton.innerHTML === '내 글 삭제') {
	        deleteButton.innerHTML = '댓글';
	    } else {
	        deleteButton.innerHTML = '내 글 삭제';
	    }
	});
	


</script>

</html>