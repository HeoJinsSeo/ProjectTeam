<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>letter_table</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="footer.css">
    <link rel="stylesheet" type="text/css" href="Mainpage.css">
    <link rel="stylesheet" type="text/css" href="letter.css">
</head>
<style>
.checkbox-button {
  margin-right: 5px;
}

.checkbox-button:checked {
  background-color: #ccc;
}

button:hover{background-color: skyblue;}
button:active{background-color: #blue;}
</style>

<%--다른 파일으로부터의 접근--%> 
<header>
    <%@ include file="header.jsp" %> <!---->
</header> 
<body>
<!--보류   <div class="qna">
    <header>
      <button class="tab active" onclick="openTab(event, 'qna')">Q&A</button>
      <button class="tab" onclick="openTab(event, 'community')">커뮤니티</button>
    </header>
     -->
    <div id="qna" class="tab-content active">
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
		    <c:forEach begin="1" end="${length}" var="i" varStatus="status">
			        <tr id="targetElement">
						<td class="order">${i}</td>
						<td class="date">${letter[status.index].getDate()}</td>
						<td class="title" onclick="redirectTolette_show('${letter[status.index].getTitle()}', '${letter[status.index].getWriter()}')">${letter[status.index].getTitle()}</td>
						<td class="white">${letter[status.index].getWriter()}</td>
						<td class="like">${letter[status.index].getLike()}</td>
			        </tr>
		    </c:forEach>
        </tbody>
      </table>
      <button onclick="previousPage()">이전 페이지</button>
      <div id="pageButtons"></div>
      
      <button onclick="nextPage()">다음 페이지</button>
      <form action="table_button" method="post" >
        <select id="filterSelect">
          <option value="">전체</option>
          <option value="option1">옵션 1</option>
          <option value="option2">옵션 2</option>
          <option value="option3">옵션 3</option>
        </select>
        <input type="text">
        <button type="submit" name="buttonId" value="searchButton">찾기</button>
        <button type="submit" name="buttonId" value="writeButton">글쓰기</button>
      </form>
    </div>
<!-- 보류    <div id="community" class="tab-content">
      <table>
        <tr>
          <th>커뮤니티</th>
        </tr>
      </table>
    </div> 
  </div>-->
  <button onclick="toggleCheckbox()">

</button>
</body>

<footer>
</footer>
<script type="text/javascript">
function openTab(event, tabName) {
    // 모든 탭 내용을 숨김
    var tabContents = document.getElementsByClassName("tab-content");
    for (var i = 0; i < tabContents.length; i++) {
      tabContents[i].style.display = "none";
    }

    // 모든 탭 버튼 비활성화
    var tabButtons = document.getElementsByClassName("tab");
    for (var i = 0; i < tabButtons.length; i++) {
      tabButtons[i].classList.remove("active");
    }

    // 선택한 탭 내용 표시 및 해당 탭 버튼 활성화
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.classList.add("active");
    }
function redirectTolette_show(title, writer) {
    var encodedTitle = encodeURIComponent(title);
    var encodedWriter = encodeURIComponent(writer);
    window.location.href = '/letter_show?title=' + encodedTitle + '&writer=' + encodedWriter;
  }
/*================================================<  >*/

var currentPage = Math.ceil(${length} / 10); // 페이지 수 계산
var pageButtons = document.getElementById('pageButtons');
var initialPage = 1; // 처음 로딩될 때의 페이지 번호 (첫 번째 페이지)

for (var i = 1; i <= currentPage; i++) {
  var button = document.createElement('button');
  button.type = 'button';
  button.id = 'button' + i;
  button.textContent = i; // 번호 표시
  button.classList.add('checkbox-button');

  if (i === initialPage) {
    button.classList.add('active'); // 처음 로딩될 때 선택된 페이지 버튼에 클래스 추가
  }

  button.addEventListener('click', function(event) {
    var buttons = pageButtons.getElementsByTagName('button');
    for (var j = 0; j < buttons.length; j++) {
      buttons[j].classList.remove('active'); // 다른 버튼 클래스 제거
    }
    event.target.classList.add('active'); // 선택된 버튼에 클래스 추가

    // 선택된 버튼의 동작 수행
    var pageNumber = parseInt(event.target.textContent);
    var startIdx = (pageNumber - 1) * 10; // 시작 인덱스 계산
    var endIdx = startIdx + 9; // 종료 인덱스 계산

    // 모든 데이터 행을 가져와서 순회하면서 표시 여부 결정
    var targetElements = document.querySelectorAll('#targetElement');
    for (var i = 0; i < targetElements.length; i++) {
      var element = targetElements[i];
      if (i >= startIdx && i <= endIdx) {
        element.style.display = ''; // 해당 범위에 속하는 데이터는 표시
      } else {
        element.style.display = 'none'; // 해당 범위에 속하지 않는 데이터는 숨김
      }
    }
  });

  pageButtons.appendChild(button);
}
//처음 로딩 시 1페이지에서 10번째까지의 데이터 표시
var targetElements = document.querySelectorAll('#targetElement');
for (var i = 0; i < targetElements.length; i++) {
  var element = targetElements[i];
  if (i >= startIdx && i <= endIdx) {
    element.style.display = ''; // 해당 범위에 속하는 데이터는 표시
  } else {
    element.style.display = 'none'; // 해당 범위에 속하지 않는 데이터는 숨김
  }

  if (i === endIdx) {
    break; // 10번째 엘리먼트까지만 처리하고 반복문 종료
  }
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
</script>
</html>