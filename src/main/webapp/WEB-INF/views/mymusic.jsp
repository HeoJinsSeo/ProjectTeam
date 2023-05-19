<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/footer.css">
<link rel="stylesheet" href="/hjs_top100top100.css">
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<body>

<!-- 타이틀 로고 -->
<div class="section_1"></div>
	<h1>마이뮤직</h1>

	
<!-- 내가 담은 노래 -->
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">셔플듣기</button>
			<button class="all_listen">모두듣기</button>
			<button class="listen">듣기</button>
			<button class="down">다운</button>
			<button class="FLAC">FLAC</button>
			<button class="present">선물</button>
	</div>		
		<table>		
			<thead>				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th>번호</th>
					<th>ㅡ</th>
					<th></th>
					<th>곡정보</th>
					<th>앨범</th>
					<th>좋아요</th>
					<th>듣기</th>
					<th>뺴기</th>
					<th>다운</th>
					<th>뮤비</th>
				</tr>
			</thead>			
    	<tbody>    	
    	<c:forEach var="selectedTrack" items="${selectedTracks}" begin="0" end="99" varStatus="loop">				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>					
					<td>
						${loop.index + 1}
					</td>
					
					<td>ㅡ</td>
					<td>
						 <div class="track">
          				 <img src="${selectedTrack.album_image}">
        				 	<div class="caption">
                			<p>${selectedTrack.title}</p>
                			<p>${selectedTrack.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${selectedTrack.title}</p>
				      <p>${selectedTrack.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${selectedTrack.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${selectedTrack.like_count}</p>
					</td>					 
					<td><a href="#"><img src="img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="/removeTrack?trackId=${selectedTrack.track_id}&action=remove"><img src="img/hjs_remove.png" class="logo2" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4" style="border: none; width: 20px; height: 20px;"></a></td>				
					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>   
</div>

</body>
</html>