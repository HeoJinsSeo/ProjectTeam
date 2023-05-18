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
html{text-align: center;font-size:20px;}
.menu {position: absolute;right: 15%;}
.text {width: 50%;}
.hidden-input {display: none;}
textarea{min-width: 50%; min-height: 200px;}
button {}
.icon-button {display: inline-flex;align-items: center;}
.icon-button span {vertical-align: middle;line-height: 1;}


</style>
<body>
    <form action="table_button" method="post">
        <button type="submit" name="buttonId"  value="import" class="menu" id="menu">저장 불러오기</button><br>
        <button type="submit" name="buttonId"  value="add" class="menu" id="add">파일 첨부하기</button><br>
        <button type="submit" name="buttonId"  value="back" class="menu" id="back">뒤로가기</button><br>
       
        <!-- 제목란 -->
        <input type="text" name="inputField" class="text" id="title" value="" placeholder="제목을 적어주세요.">
          
        <!-- 내용란 -->
        <textarea class="text" id="myTextarea" placeholder="내용을 적어주세요." ></textarea>
        <input type="text" class="hidden-input" id="myInput">
        
        <br>
        <button type="submit" name="buttonId"  value="registry" class="icon-button" id="registry"><span>저장하기</span><i class="material-icons">save</i></button>
        <button type="submit" name="buttonId"  value="post" class="icon-button" id="post"><span>등록하기</span><i class="material-icons">done</i></button>
    </form>
</body>
<script>
//textarea 를 input 모양으로 변형하기
var textarea = document.getElementById("myTextarea");
var input = document.getElementById("myInput");

textarea.addEventListener("input", function () {
    input.value = textarea.value;
});

</script>
</html>