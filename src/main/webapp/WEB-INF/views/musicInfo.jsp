<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}&nbsp:::HYPEMUSIC&nbsp음악정보</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<style>
#album-info{
	position: relative;
	min-height: 240px;
	min-width: 800px;
	margin-bottom: 30px;
}
#album-image {
	float: left;
	padding-left: 14%;
	padding-top : 65px;
	margin-right: 50px;
}

#lyrics-wrapper {
	width: 70%;
	margin: auto;
}

pre {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
}
</style>

<body>
	<div id="wrapper">
		<div id="album-info">
			<div id="album-image">
				<img src="${album_image}" width="180px" height="180px" alt="album_img">
			</div>
			<br>
			<br>
			<div>
				<div>
					<h2 id="title">${title}</h2>
					<h3 id="artist">${artist}</h3>
					<h4 id="genre">${genre}&nbsp&nbsp&nbsp${style}</h4>
					<div>
						<button class="play">
							<i class="material-icons">play_arrow</i>
						</button>
			<!-- 담기 버튼 -->
			    <c:if test="${rank == null || rank < 1}">
			        <a href="#" onclick="showLoginAlert()">
			            <img src="/img/hjs_put.png" alt="담기" style="border: none; width: 20px; height: 20px;">
			        </a>
			    </c:if>
			    <c:if test="${rank != null && rank >= 1}">
			    		<!--  onclick 이벤트 jsp 불러오는 함수에 맞게 꼭 변경해주세요! -->
			        <a href="#" onclick="addTrack('${track_id}')">
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
					</div>
				</div>
				<br>
			</div>
			</div>
		<div id="lyrics-wrapper"> 
			<div>
				<hr>
				<h2 id="lyrics-head">Lyrics</h2>
				<hr>
			</div>
			<br>
			<div id="lyrics-container"><pre>${lyrics}</pre></div>
		</div>	
		</div>


</body>

</html>