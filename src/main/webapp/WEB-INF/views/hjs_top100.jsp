<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>허진서 top100</title>

</head>
<link rel="stylesheet" href="/hjs_top100.css">
<body>
<!-- 타이틀 로고 -->
<div class="section_1"></div>
	<h1>Top100</h1>

<!-- 날짜 -->
<div class="section_2"></div>
	<h2>2023.05.12  21:00</h2>
	
<!-- 차트 top100 -->
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">셔플듣기</button>
			<button class="all_listen">모두듣기</button>
			<button class="listen">듣기</button>
			<button class="put">담기</button>
			<button class="down">다운</button>
			<button class="FLAC">FLAC</button>
			<button class="present">선물</button>
	</div>
		
		<table>
		
			<thead>
				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th>순위</th>
					<th>ㅡ</th>
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>좋아요</th>
					<th>듣기</th>
					<th>담기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>1</td>
					<td>ㅡ</td>
					<td>
						<a href="#">
							<img id="myImage" src="https://cdnimg.melon.co.kr/cm2/album/images/112/11/297/11211297_20230410151046_500.jpg/melon/resize/120/quality/80/optimize">
						</a>
					</td>
					<td>I AM</td>
					<td>I've IVE</td>
					<td>♡ 142,082</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage = document.getElementById("myImage");
	
						myImage.addEventListener("mouseenter", function() {
						  myImage.classList.add("hovered");
						});
	
						myImage.addEventListener("mouseleave", function() {
						  myImage.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>2</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage2" src="https://image.bugsm.co.kr/album/images/200/40859/4085992.jpg?version=20230509025819.0"></a></td>
					<td>UNFORGIVEN
					(feat.Nile Rodgers)</td>
					<td>UNFORGIVEN</td>
					<td>♡ 70,283</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage2 = document.getElementById("myImage2");
	
						myImage2.addEventListener("mouseenter", function() {
						  myImage2.classList.add("hovered");
						});
	
						myImage2.addEventListener("mouseleave", function() {
						  myImage2.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>3</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage3" src="https://cdnimg.melon.co.kr/cm2/album/images/112/11/297/11211297_20230410151046_500.jpg/melon/resize/120/quality/80/optimize"></a></td>
					<td>Kitsch</td>
					<td>I've IVE</td>
					<td>♡ 123,197</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage3 = document.getElementById("myImage3");
	
						myImage3.addEventListener("mouseenter", function() {
						  myImage3.classList.add("hovered");
						});
	
						myImage3.addEventListener("mouseleave", function() {
						  myImage3.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>4</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage4" src="https://image.bugsm.co.kr/album/images/200/40857/4085791.jpg?version=20230509004441.0"></a></td>
					<td>손오공</td>
					<td>SEVENTEEN 10th Mini Album ‘FML'</td>
					<td>♡ 102,047</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage4 = document.getElementById("myImage4");
	
						myImage4.addEventListener("mouseenter", function() {
						  myImage4.classList.add("hovered");
						});
	
						myImage4.addEventListener("mouseleave", function() {
						  myImage4.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>5</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage5" src="https://cdnimg.melon.co.kr/cm2/album/images/112/36/264/11236264_20230508184331_500.jpg/melon/resize/120/quality/80/optimize"></a></td>
					<td>Spicy</td>
					<td>MY WORLD-The 3rd Min</td>
					<td>♡ 38,478</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage5 = document.getElementById("myImage5");
	
						myImage5.addEventListener("mouseenter", function() {
						  myImage5.classList.add("hovered");
						});
	
						myImage5.addEventListener("mouseleave", function() {
						  myImage5.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>6</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage6" src="https://image.bugsm.co.kr/album/images/200/40850/4085066.jpg?version=20230411020709.0"></a></td>
					<td>꽃</td>
					<td>ME</td>
					<td>♡ 98,000</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage6 = document.getElementById("myImage6");
	
						myImage6.addEventListener("mouseenter", function() {
						  myImage6.classList.add("hovered");
						});
	
						myImage6.addEventListener("mouseleave", function() {
						  myImage6.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>7</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage7" src="https://image.bugsm.co.kr/album/images/200/40658/4065831.jpg?version=20230422005430.0"></a></td>
					<td>사랑은 늘 도망가</td>
					<td>신사와 아가씨 OST Part.2</td>
					<td>♡ 194,270</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage7 = document.getElementById("myImage7");
	
						myImage7.addEventListener("mouseenter", function() {
						  myImage7.classList.add("hovered");
						});
	
						myImage7.addEventListener("mouseleave", function() {
						  myImage7.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>8</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage8" src="https://image.bugsm.co.kr/album/images/200/40835/4083586.jpg?version=20230314012829.0"></a></td>
					<td>파이팅 해야지(Feat.이영지)</td>
					<td>부석순 1st Single Album 'SECOND WIND'</td>
					<td>♡ 151,188</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage8 = document.getElementById("myImage8");
	
						myImage8.addEventListener("mouseenter", function() {
						  myImage8.classList.add("hovered");
						});
	
						myImage8.addEventListener("mouseleave", function() {
						  myImage8.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>9</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage9" src="https://image.bugsm.co.kr/album/images/200/204638/20463897.jpg?version=20220609133908.0"></a></td>
					<td>우리들의 블루스</td>
					<td>IM HERO</td>
					<td>♡ 91,626</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage9 = document.getElementById("myImage9");
	
						myImage9.addEventListener("mouseenter", function() {
						  myImage9.classList.add("hovered");
						});
	
						myImage9.addEventListener("mouseleave", function() {
						  myImage9.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>10</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage10" src="https://cdnimg.melon.co.kr/cm2/album/images/109/23/444/10923444_20220502140600_500.jpg/melon/resize/120/quality/80/optimize"></a></td>
					<td>다시 만날 수 있을까</td>
					<td>IM HERO</td>
					<td>♡ 74,083</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage10 = document.getElementById("myImage10");
	
						myImage10.addEventListener("mouseenter", function() {
						  myImage10.classList.add("hovered");
						});
	
						myImage10.addEventListener("mouseleave", function() {
						  myImage10.classList.remove("hovered");
						});
					</script>
				</tr>
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					<td>11</td>
					<td>ㅡ</td>
					<td><a href="#"><img id="myImage11" src="https://image.bugsm.co.kr/album/images/200/205278/20527897.jpg?version=20221119010336.0"></a></td>
					<td>London Boy</td>
					<td>Polaroid</td>
					<td>♡ 49,573</td>
					<td><a href="#"><img src="img/hjsplaylogo.png" class="logo1"></a></td>
					<td><a href="#"><img src="img/hjsputlogo.png" class="logo2"></a></td>
					<td><a href="#"><img src="img/hjsdownlogo.png" class="logo3"></a></td>
					<td><a href="#"><img src="img/hjsmuvelogo.png" class="logo4"></a></td>
					<script>
						var myImage11 = document.getElementById("myImage11");
	
						myImage11.addEventListener("mouseenter", function() {
						  myImage11.classList.add("hovered");
						});
	
						myImage11.addEventListener("mouseleave", function() {
						  myImage11.classList.remove("hovered");
						});
					</script>
				</tr>
					
				<!-- <script>
				
				var images = document.getElementsByClassName("myImage");
		
				for (var i = 0; i < images.length; i++) {
		  		images[i].addEventListener("mouseenter", function() {
		    		this.classList.add("hovered");
		  		});
		
		  		images[i].addEventListener("mouseleave", function() {
		    		this.classList.remove("hovered");
		  		});
				}
				</script> -->
			</tbody>
		</table>
</div>


</body>
</html>