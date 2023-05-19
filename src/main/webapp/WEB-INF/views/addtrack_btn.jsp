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
<body>
		<!-- 담기 버튼 -->
		    <c:if test="${rank == null || rank < 1}">
		        <a href="#" onclick="showLoginAlert()">
		            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
		        </a>
		    </c:if>
		    <c:if test="${rank != null && rank >= 1}">
		    		<!--  onclick 이벤트 jsp 불러오는 함수에 맞게 꼭 변경해주세요! -->
		        <a href="#" onclick="addTrack('${trackInfo.track_id}')">
		            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
		        </a>
		        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			    <script>
			        function showLoginAlert() {
			            alert("로그인이 필요합니다.");
			        }
			        // ajax 방식으로 변경
			        function addTrack(trackId) {
			            $.ajax({
			                url: '/addTrack',
			                type: 'POST',
			                data: { addTrack: trackId },
			                success: function(response) {
			                    alert("음악 담기 성공!"); // 음악 담기 성공시 알림창 띄우기
			                    console.log(response);  
			                },
			                error: function(error) {
			                    alert("이미 담겨 있는 음악입니다!"); // 이미 담겨 있는 음악일시 알림창 띄우기
			                    console.log(error);  
			                }
			            });
			        }
			    </script>
		    </c:if>
		<!-- 여기까지가 담기 버튼입니다 -->
</body>
</html>