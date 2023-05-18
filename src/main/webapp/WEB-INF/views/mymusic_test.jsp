<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>음악 담기 테스트용 페이지 입니다</h1>
<body>
    <table>
        <tr>
            <th>Album Image</th>
            <th>Title</th>
            <th>Artist</th>
            <th>Genre</th>
            <th>Release Date</th>
            <th>담기</th>
        </tr>
	        <c:forEach var="trackInfo" items="${trackInfos}">
	            <tr>
	                <td>
	                    <img src="${trackInfo.album_image}" width="100" height="100" alt="Album Image">
	                </td>
	                <td>${trackInfo.title}</td>
	                <td>${trackInfo.artist}</td>
	                <td>${trackInfo.genre}</td>
	                <td>${trackInfo.release_date}</td>
	                <td>
					<td>
					    <c:if test="${rank == null || rank < 1}">
					        <a href="#" onclick="showLoginAlert()">
					            <img src="img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					    </c:if>
					    <c:if test="${rank != null && rank >= 1}">
					        <a href="#" onclick="addTrack('${trackInfo.track_id}')">
					            <img src="img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
					        </a>
					    </c:if>
					
					<script>
					    function showLoginAlert() {
					        alert("로그인이 필요합니다.");
					    }			    

					    function addTrack(trackId) {
					        let form = document.createElement('form');
					        form.action = '/addTrack';
					        form.method = 'post';

					        let input = document.createElement('input');
					        input.type = 'hidden';
					        input.name = 'addTrack';
					        input.value = trackId;

					        form.appendChild(input);
					        document.body.appendChild(form);

					        form.submit();
					    }
					</script>
	                </td>
	            </tr>
	        </c:forEach>
	</table>
</body>
</html>