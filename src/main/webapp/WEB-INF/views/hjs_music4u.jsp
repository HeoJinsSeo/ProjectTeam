<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>music4u</title>
</head>
<link rel="stylesheet" href="/hjs_music4u.css">

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<body>
 
    <!-- Ÿ��Ʋ ���� -->
    <div class="section_1">
    	<h1>MUSIC FOR YOU~��</h1>
    	<br>
    </div>
    
    <!-- �̹����� �Ұ� -->
    <div class="section_2">
    	<div class="title_img">
    		<a href="#" ><img src="https://cdnimg.melon.co.kr/svc/images/melondj/playlist/508844633_org.jpg?tm=20230515034004/melon/resize/x236/quality/80/optimize" alt></a>
    	</div>
    	<div class="title_logo">
    		<h3>������ �ؿ��� ����! ��Ƽ��Ʈ �÷������̼�</h3>
    		<h4>2023.05.15</h4>
    		<h4>���ƿ�</h4>
    	</div>
    
    </div>
    
    <!-- �Ұ��� -->
    <div class="section_3">
    	<h3>�Ұ���</h3>
    	<h4>  ����X�ؿ� ��Ƽ��Ʈ����, �����Ұ� �ż��� ����! �Ϻ��� �ɹ̸� �����ִ�, �� �÷������̼�!

            K���� �λ����� ����/�ؿ� �������� ������ �� �̻� ���� ���� �ƴϰ� �� ����. 
            
            ���߿����� �ѱ��� ���縦 ���� ���� �ҵ鿡�Դ� �ݰ�����, �ؿ� �ҵ鿡�Դ� �ż����� �ִ� 
            
            ��Ʈ���� ����帱�Կ�. �ٸ� ���ٸ� ������ ��Ƽ��Ʈ���� ���� ���� Ȳ�� �ó����� ���� 
            
            �ŷ����� �÷���, �ٷ� ����������!</h4>
    </div>
    
    <!-- �÷��� ����Ʈ -->
    <div class="section_4">
    	<h3>�÷��̸���Ʈ</h3>
    	
    	<div class="music_btn">
	
			<input type="text" placeholder="�帣�� �˻��� �ּ���" id="search_box">
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
					<th></th>
					<th>������</th>
					<th>�ٹ�</th>
					<th>���ƿ�</th>
					<th>���</th>
					<th>���</th>
					<th>�ٿ�</th>
					<th>�º�</th>
				</tr>
			</thead>
			
    	<tbody>    	
    	<c:forEach var="trackInfo_2023" items="${trackInfos_2023}" begin="0" end="9" varStatus="loop">
				
				<tr>
					<td><input type="checkbox" name="check" id="checkbox">
                            <span class="checkmark"></span></td>
					
					<td>
						${loop.index + 1}
					</td>
					<!--  ������ �̹��� �߰� -->
					<td><a href="/musicInfo?track_id=${trackInfo_2023.track_id}" id="info"><img src = "/img/music_info_icon2.jpg" style="border: none; width: 25px; height: 30px;"></a></td>
			
					
					<td>
						 <div class="track">
          				 <img src="${trackInfo_2023.album_image}">
        				 	<div class="caption">
                			<p>${trackInfo_2023.title}</p>
                			<p>${trackInfo_2023.artist}</p>
            				</div>
        				 </div>
					</td>
					<td>
					<div class="caption1">
				      <p>${trackInfo_2023.title}</p>
				      <p>${trackInfo_2023.artist}</p>
				    </div>
					</td>
					<td>
					<div class="caption2">
      				<p>${trackInfo_2023.album}</p>
      				</div>
					</td>
					<td>
					<div class="caption3">
     				<p>${trackInfo_2023.like_count}</p>
					</td>
					<td><a href="#"><img src="img/hjs_play.png" class="logo1" style="border: none; width: 20px; height: 20px;"></a></td>
					<td>		<!-- ��� ��ư -->
		    <c:if test="${rank == null || rank < 1}">
		        <a href="#" onclick="showLoginAlert()">
		            <img src="/img/hjs_put.png" alt="���" style="border: none; width: 20px; height: 20px;">
		        </a>
		    </c:if>
		    <c:if test="${rank != null && rank >= 1}">
		    		<!--  onclick �̺�Ʈ jsp �ҷ����� �Լ��� �°� �� �������ּ���! -->
		        <a href="#" onclick="addTrack('${trackInfo_2023.track_id}')">
		            <img src="/img/hjs_put.png" alt="���" style="border: none; width: 20px; height: 20px;">
		        </a>
		        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			    <script>
			        function showLoginAlert() {
			            alert("�α����� �ʿ��մϴ�.");
			        }
			        // ajax ������� ����
			        function addTrack(trackId) {
			            $.ajax({
			                url: '/addTrack',
			                type: 'POST',
			                data: { addTrack: trackId },
			                success: function(response) {
			                    alert("���� ��� ����!"); // ���� ��� ������ �˸�â ����
			                    console.log(response);  
			                },
			                error: function(error) {
			                    alert("�̹� ��� �ִ� �����Դϴ�!"); // �̹� ��� �ִ� �����Ͻ� �˸�â ����
			                    console.log(error);  
			                }
			            });
			        }
			    </script>
		    </c:if>
		<!-- ��������� ��� ��ư�Դϴ� -->	</td>
					<td><a href="#"><img src="img/hjs_down.png" class="logo3" style="border: none; width: 20px; height: 20px;"></a></td>
					<td><a href="#"><img src="img/hjs_muve.png" class="logo4" style="border: none; width: 20px; height: 20px;"></a></td>
					
				</tr>
    	 
    	 </c:forEach>
    	
				</tbody>
		</table>   
	
	
    </div>
   
   
</body>
<footer>
<jsp:include page="footer.jsp"></jsp:include>   
</footer>
</html>