<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>연애 기사 매거진</title>
<link rel="stylesheet" href="/hjs_magazine.css">
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
</head>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

<body>


<!-- 메인 타이틀 -->
<div class="section_1_title">
	<h3 class="fade-in">하입봇 매거진</h3>

</div>


<!-- 메인 타이틀의 소개 -->
<div class="section_2_banner">
	<h4 class="fade-out">하입봇의 HOT한 연예가 소식</h4>
	
	<img src="" alt>
</div>


<!-- 연애기사 리스트 -->
<div id="section_3_pagelist">
	<div class="wrap_list">
		<table>
<% 
	Date currentDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
%>
<c:forEach var="trackInfo_2023" items="${trackInfos_2023}" begin="0" end="9" >	
			<tr>

	  			<td>
<%
//  			for (int i = 0; i < 10; i++) {
			out.print(dateFormat.format(currentDate) + "<br>");
			currentDate.setDate(currentDate.getDate() - 1);
// 			}
%>
      			</td>
				<td><div class="track">
          			<img src="${trackInfo_2023.album_image}"></div></td>
				<td><div class="caption">
                	<p><a href="${trackInfo_2023.news1}">${trackInfo_2023.news1}</a>
                 	<p><a href="${trackInfo_2023.news2}">${trackInfo_2023.news2}</a>
                	<p><a href="${trackInfo_2023.news3}">${trackInfo_2023.news3}</a> 
                	<script>
					/* $.ajax({
						  url: 'Header set Access-Control-Allow-Origin "*"', '${trackInfo_2023.news1}',
						  type: 'GET',
						  dataType: 'html',
						  success: function(response) {
						    // HTML 응답을 받았을 때 처리할 로직
						    var articleContent = $(response).find('article').text();
						    var lines = articleContent.split('\n');
						   
						    // 처음 두 줄 기사 추출
						    var firstTwoLines = lines.slice(0, 2);
						    
						    // 화면에 표시
						    var result = firstTwoLines.join('<br>');
						    $('#article-preview').html(result);
						  },
						  error: function(xhr, status, error) {
						    // 오류 처리 로직
						    console.log('Error:', status, error);
						  }
						});
					 */
					</script>
					                	
                	</p>
                	<%-- <p><a href="${trackInfo_2023.news2}">${trackInfo_2023.news2}</a></p>
                	<p><a href="${trackInfo_2023.news3}">${trackInfo_2023.news3}</a></p>
 --%>                	</div></td>
			</tr>
</c:forEach>			
		</table>
	</div>
</div>



<!-- 페이지 이동 네비게이션 -->
<div id="section_4_navigation">
	 <li><a href="#">1</a></li>
     <li><a href="#">2</a></li>
     <li><a href="#">3</a></li>
</div>
<%-- <%
    TrackInfo trackInfo_2023 = new TrackInfo(); 
%>
<script>
$.ajax({
	  url: '${trackInfo_2023.news1}',
	  type: 'GET',
	  dataType: 'html',
	  success: function(response) {
	    // HTML 응답을 받았을 때 처리할 로직
	    var articleContent = $(response).find('article').text();
	    var lines = articleContent.split('\n');
	   
	    // 처음 두 줄 기사 추출
	    var firstTwoLines = lines.slice(0, 2);
	    
	    // 화면에 표시
	    var result = firstTwoLines.join('<br>');
	    $('#article-preview').html(result);
	  },
	  error: function(xhr, status, error) {
	    // 오류 처리 로직
	    console.log('Error:', status, error);
	  }
	});

</script>
 --%>
 
</body>
<footer>
<jsp:include page="footer.jsp"></jsp:include>   
</footer>
</html>