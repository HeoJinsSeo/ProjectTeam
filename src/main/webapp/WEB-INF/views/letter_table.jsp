<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>letter_table</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="footer.css">
<link rel="stylesheet" type="text/css" href="Mainpage.css">
<link rel="stylesheet" type="text/css" href="letter.css">
</head>

<header>
	<%@ include file="header.jsp"%>
</header>
<body>
	<!--보류   <div class="qna">
    <header>
      <button class="tab active" onclick="openTab(event, 'qna')">Q&A</button>
      <button class="tab" onclick="openTab(event, 'community')">커뮤니티</button>
    </header>
     -->
	<div class="latterBox">
		<table id="letterTable">
			<thead>
				<tr>
					<th class="order">순서</th>
					<th class="date">작성시간</th>
					<th class="title">글제목</th>
					<th class="white">작성자</th>
					<th class="like"><i class="material-icons">thumb_up</i></th>
				</tr>
			</thead>
			<tbody>
				<%-- java 로 테이블 생성 --%>
				<c:forEach begin="${pageNumber+1}" end="${pageNumber+10}" var="i" varStatus="status">
					<tr id="targetElement">
						<td class="order">${i}</td>
						<td class="date">${letter[status.index].getDate()}</td>
						<td class="title"
							onclick="redirectTolette_show('${letter[status.index].getTitle()}', '${letter[status.index].getWriter()}')">${letter[status.index].getTitle()}</td>
						<td class="writer">${letter[status.index].getWriter()}</td>
						<td class="like">${letter[status.index].getLike()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="postAll">
			<div class="pageClick">
				<button onclick="previousPage()">이전 페이지</button>
				<div class="pageNumber">
					<div class="numberStyle" id="pageButtons" onclick="pageShow()"></div>
				</div>
				<button onclick="nextPage()">다음 페이지</button>
			</div>
			<form action="table_button" method="post">
				<select id="filterSelect">
					<option value="">전체</option>
					<option value="option1">옵션 1</option>
					<option value="option2">옵션 2</option>
					<option value="option3">옵션 3</option>
				</select> <input type="text">
				<button type="submit" name="buttonId" value="searchButton">찾기</button>
				<button type="submit" name="buttonId" value="writeButton">글쓰기</button>
			</form>
		</div>
	</div>
	<!-- 보류    <div id="community" class="tab-content">
      <table>
        <tr>
          <th>커뮤니티</th>
        </tr>
      </table>
    </div> 
  </div>-->
</body>

<footer> </footer>
<script type="text/javascript">
/*================================================<  >*/
    var currentPage = Math.ceil(${length} / 10); // 페이지 수 계산
    var pageButtons = document.getElementById('pageButtons');//페이지 버튼묶음
    for (var i = 1; i <= currentPage; i++) {
        var button = document.createElement('button');
        button.type = 'button';
        button.id = 'button' + i;
        button.textContent = i; // 번호 표시
        button.classList.add('checkbox-button');
        
        button.addEventListener('click', function(event) {
        //	location.href =  '/letter_table?pageNumber='+pageNumber
        	 var pageNumber = parseInt(event.target.textContent);	
			console.log(pageNumber)
        	  // AJAX 요청을 통해 서버로 pageNumber 전송
        	  var xhr = new XMLHttpRequest();
        	  xhr.open('POST', '/letter_table?pageNumber='+pageNumber); // 서버 엔드포인트 설정
        	  xhr.setRequestHeader('Content-Type', 'application/json');
        	  xhr.onreadystatechange = function() {
        	    if (xhr.readyState === XMLHttpRequest.DONE) {
        	      if (xhr.status === 200) {
        	        // 요청이 성공적으로 완료된 경우 처리
        	        console.log('요청 성공');
        	      } else {
        	        // 요청이 실패한 경우 처리
        	        console.error('요청 실패');
        	      }
        	    }
        	  };
        	  var data = JSON.stringify({ "pageNumber": pageNumber }); // 전송할 데이터를 JSON 형태로 변환
        	  xhr.send(data);
        	});
        pageButtons.appendChild(button);
   		}
    
        
function pageShow(){
	
}
        
function previousPage() {
	if (currentPage > 1){
		currentPage--;
  showPage(currentPage);
  }
}


function nextPage() {
    if (currentPage < totalPages) {
      currentPage++;
      showPage(currentPage);
    }
  }
        
        
        
        
        
        
        
        
        
 /*       if (i === null) 
            var message = document.createElement('p');
        message.textContent = '게시물이 없습니다.';
        pageButtons.appendChild(message);
        }


        pageButtons.appendChild(button);
        button.addEventListener('click', function(event) {
        	 let btn = event.target
        	 pageNumber = btn.textContent

             // 선택된 버튼의 동작 수행
        });
    }*/
    
</script>
<!--  선아님 Footer -->
<footer>
<jsp:include page="footer.jsp"></jsp:include>   
</footer>
</html>