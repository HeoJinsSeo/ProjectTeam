<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>musicInfo</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<style>
/*musicInfo_body {
	margin: 0 auto;
	padding: 0;
}*/

div {
	width: 100%;
}

ul, ol {
	display: inline-block;
	list-style: none;
}

.d1 {
	margin: 0 auto;
	padding: 0;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.d2 {
	display: flex;
	text-align: center;
	justify-content: center;
	align-items: center;
	display: block;
	width: 90%;
	height: 45%;
}

.d3 {
	display: flex;
	text-align: center;
	overflow: auto;
	height: 180px;
}

.d4 {
	width: 80%;
	overflow: auto;
	height: inherit;
}

.musicInfo_album_image {
	border-radius: 100px;
	width: 30%;
	height: 99%;
	object-fit: cover;
}

.d5 {
	flex-direction: column;
}

.d5 h3 {
	
}

.d6 {
	width: 80%;
	height: auto;
	white-space: pre-wrap;
}

.i {
	border-radius: 100px;
	width: 80%;
	height: 50%;
}

.d7 {
	width: 80px;
	display: flex;
	justify-content: space-between;
	display: flex;
}

button:hover {
	background-color: skyblue;
}


button:active {
	background-color: #blue;
}
</style>

<body>
	<div class="d1">
		<div>
			<br>
			<br>
			<br>
			<div class="d3">
				<img src="${album_image}" class = "musicInfo_album_image" alt="대체_텍스트">
			</div>
			<br>
			<br>
			<div>
				<div class="d2 playbox" id="">
					<h3>"${artist}"의"${style}"</h3>
					<br>
					<br>
					<div class="d7">
						<button class="i">
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
					</div>
				</div>
				<br>
				<div class="d2 d5" style="width: 50%;">
					<h2>${title}</h2>
					<br>
					<div class="d6">${lyrics}</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	
</script>

</html>