<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>letter_table</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
html{text-align: center;}
table{position: relative; width: 100%; background-color: #e6e6e6;
        border-collapse: collapse;}
tr, td, th { border: 1px solid black;}
.title{width: 60%}
</style>
<body>
  <div class="qna">
    <header>
      <button class="tab active" onclick="openTab(event, 'qna')">Q&A</button>
      <button class="tab" onclick="openTab(event, 'community')">커뮤니티</button>
    </header>
    
    <div id="qna" class="tab-content active">
      <table>
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
			        <tr>
						<td class="order">${i}</td>
						<td class="date">${letter[status.index].getDate()}</td>
						<td class="title" onclick="redirectTolette_show('${letter[status.index].getTitle()}', '${letter[status.index].getWriter()}')">${letter[status.index].getTitle()}</td>
						<td class="white">${letter[status.index].getWriter()}</td>
						<td class="like">${letter[status.index].getLike()}</td>
			        </tr>
		    </c:forEach>
        </tbody>
      </table>
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
    <div id="community" class="tab-content">
      <table>
        <tr>
          <th>커뮤니티</th>
        </tr>
      </table>
    </div>
  </div>
</body>
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

    
</script>
</html>