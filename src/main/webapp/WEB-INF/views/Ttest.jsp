<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
"${trackInfos }"
		


</body>
</html>