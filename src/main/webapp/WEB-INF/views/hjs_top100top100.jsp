<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>top100 top100</title>
</head>
<link rel="stylesheet" href="/hjs_top100top100.css">
<link rel="stylesheet" href="/footer.css?after">

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

<body>
<!-- Ÿ��Ʋ �ΰ� -->
<div class="section_1"></div>
	<h1>Top100</h1>

<!-- ��¥ -->
<div class="section_2">
<%
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd a h:mm");
        String formattedDateTime = dateFormat.format(currentDate);
    %>
</div>
	<h2><%= formattedDateTime %></h2>
	
<!-- ��Ʈ top100 -->
<div class="section_3">
	<div class="music_btn">
	
			<button class="suffle_listen">���õ��</button>
			<button class="all_listen">��ε��</button>
			<button class="listen">���</button>
			<button class="put">���</button>
			<button class="down">�ٿ�</button>
			<button class="FLAC">FLAC</button>
			<button class="present">����</button>
	</div>		
		<table>		
			<thead>				
					<th><input type="checkbox" name="check" id="checkbox">
                            <div class="checkmark"></div></th>
					<th>����</th>
					<th>��</th>
					<th></th>
					<th>������</th>
					<th>�ٹ�</th>
					<th>Like</th>
					<th>���</th>
					<th>���</th>
					<th>�ٿ�</th>
					<th>�º�</th>
				</tr>
			</thead>			
    	<tbody>    	
    	<c:forEach var="trackInfo_like" items="${trackInfos_Like}" begin="0" end="99" varStatus="loop">				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>					
					<td>
						${loop.index + 1}
					</td>
					
					<td>��</td>
					<td>
						 <div class="track">
          				 <img src="${trackInfo_like.album_image}">
        				 	<div class="caption">
                			<p>${trackInfo_like.title}</p>
                			<p>${trackInfo_like.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${trackInfo_like.title}</p>
				      <p>${trackInfo_like.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${trackInfo_like.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${trackInfo_like.like_count}</p>
					</td>
					<td><a href="#"><img src="img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td>
					<!-- ��� ��ư -->
					    <c:if test="${rank == null || rank < 1}">
					        <a href="#" onclick="showLoginAlert()">
					            <img src="img/hjs_put.png" alt="���" style="border: none; width: 20px; height: 20px;">
					        </a>
					    </c:if>
					    <c:if test="${rank != null && rank >= 1}">
					    		<!--  onclick �̺�Ʈ jsp �ҷ����� �Լ��� �°� �� �������ּ���! -->
					        <a href="#" onclick="addTrack('${trackInfo.track_id}')">
					            <img src="img/hjs_put.png" alt="���" style="border: none; width: 20px; height: 20px;">
					        </a>
							<script>
							    function showLoginAlert() {
							        alert("�α����� �ʿ��մϴ�.");
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
					    </c:if>
					<!-- ��������� ��� ��ư�Դϴ� -->		
					</td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4" style="border: none; width: 20px; height: 20px;"></a></td>					
				</tr>    	 
    	 </c:forEach>    	
				</tbody>
		</table>   
</div>
</body>

<!--  ���ƴ� Footer -->
<footer>
    <hr>
    <div>
        <ui class="footernav">
            <li><a href="#" class ="footer_text">�̿���</a></li>
            <li><a href="#" class ="footer_text">��ġ��ݼ��� �̿���</a></li>
            <li><a href="#" class ="footer_text">��������ó����ħ</a></li>
            <li><a href="#" class ="footer_text">����/���θ��</a></li>
            <li><a href="#" class ="footer_text">�̸����ּҹ���</a></li>
            <li><a href="#" class ="footer_text">��Ʈ�ʼ���</a></li>
            <li><a href="#" class ="footer_text">���ǻ���</a></li>
        </ui>
    </div>

    <hr id="hr">

    <div class="info">
        <p>(��)���Ժ��������θ�Ʈ</p>
        <p>�������� �޸ձ���</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>

    <div class="info2">
        <p>(��)���Ժ��������θ�Ʈ</p>
        <p>�������� �޸ձ���</p>
        <p>sksksksksk</p>
        <p>sdkgdnskldgnlds</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
        <p>dkfsjkldf : dskgjlskglk</p>
    </div>    
</footer>
</html>
    			
    			
 