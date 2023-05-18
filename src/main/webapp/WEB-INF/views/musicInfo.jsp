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
<style>
* {
	margin: 0 auto;
	padding: 0;
}

div {
	width: 100%;
}

ul, ol {
	display: inline-block;
	list-style: none;
}

.d1 {
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

img {
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
				<img src="${album_image}" alt="대체_텍스트">
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
						<button class="i">
							<i class="material-icons">add</i>
						</button>
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