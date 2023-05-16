<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.study.springboot.MainController" %>
<%@ page import="com.study.springboot.TrackInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrackInfos</title>
</head>
<style>
	.chart-item {
        margin: 10px;
        border: 1px solid black;
        padding: 10px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .chart-item img {
        margin-right: 10px;
        width: 100px;
        height: 100px;
    }
    .chart-item .title {
        font-size: 20px;
        font-weight: bold;
    }
    .chart-item .artist {
        margin-top: 5px;
        font-size: 18px;
    }
    .chart-item .album {
        margin-top: 5px;
        font-size: 16px;
    }
    .chart-item .likes {
        margin-top: 5px;
        font-size: 16px;
    }
    .chart-item .date {
        margin-top: 5px;
        font-size: 16px;
    }
</style>
<body>

<c:forEach var="trackInfo" items="${trackInfos}">
  <c:if test="${trackInfo.title == '사랑하기 싫어'}">
    <span>
    	<img width="156" height="156" src="${trackInfo.album_image}">
    </span>
    <p>Title : ${trackInfo.title}</p>
    <p>Artist : ${trackInfo.artist}</p>
    <p>Album : ${trackInfo.album}</p>
    <p>Release_date : ${trackInfo.release_date}</p>
    <p>Likes : ${trackInfo.like_count}</p>
    <p>Genre : ${trackInfo.genre}</p>
    <p>Style : ${trackInfo.style}</p>
    <a href="${trackInfo.news1 }" target="_blank">기사1</a>
    <p>Lyrics : ${trackInfo.lyrics }</p>
  </c:if>
</c:forEach>

</body>
</html>