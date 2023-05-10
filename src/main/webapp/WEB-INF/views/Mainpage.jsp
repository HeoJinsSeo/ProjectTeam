<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .buy_ticket_btn,
    .login_btn,
    .signup_btn,
    .music_chart_btn,
    .new_music_btn,
    .genre_music_btn,
    .star_magazine_btn,
    .popular_music_video_btn,
    .music_4u_btn,
    .board_btn,
    .my_music_btn {
        background-color: white;
        border: none;
        color: gray;
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
    }
    
    .buy_ticket_btn:hover,
    .login_btn:hover,
    .signup_btn:hover,
    .music_chart_btn:hover,
    .new_music_btn:hover,
    .genre_music_btn:hover,
    .star_magazine_btn:hover,
    .popular_music_video_btn:hover,
    .music_4u_btn:hover,
    .board_btn:hover,
    .my_music_btn:hover {
      background-color: #ffffff;
      color: #000000;
      font-weight: bold;
	}
	
	.util_menu {
	  display: flex;
	}
	
    .head_top_left {
    	margin-top: auto;
        float: left;
    }

    .head_top_right {
    	margin-top: auto;	
        float: right;
    }
    .head_bottom_left {
    margin-top: auto;
        float: left;
    }

    .head_bottom_right {
    margin-top: auto;
        float: right;
    }  

    .user_states {
        font-weight: bold;
    }
	.head_middle {
	    display: flex;
	    align-items: center;
	}
	.logo {
	    flex-shrink: 0;
	    width: 200px;
	    height: 100px;
	}
	.search_box {
	    margin-left: 16px;
	    width: 450px;
	    height: 36px;
	    padding: 4px;
	    border-radius: 4px;
	    border: 1px solid gray;
	    font-size: 16px;
	}

</style>
</head>
<header>
<div id="util_menu">
	<div class="head_top_left">
		<a title="이용권구매"><button class="buy_ticket_btn">이용권구매</button></a>
	</div>
	<div class="head_top_right">
		<a title="환영코드"><span class="user_states">방문객 </span>님 환영합니다!</a>
		<a title="로그인"><button class="login_btn">로그인</button></a>
		<a title="회원가입"><button class="signup_btn">회원가입</button></a>
	</div>
	<div class="head_middle">
        <img src="/logo2.jpg" alt="로고" class="logo">
        <input type="text" placeholder="곡 또는 가수를 입력하세요" class="search_box">
	</div>
    <div class="head_bottom_left">
      <button class="music_chart_btn">뮤직차트</button>
      <button class="new_music_btn">최신음악</button>
      <button class="genre_music_btn">장르음악</button>
      <button class="star_magazine_btn">스타매거진</button>
      <button class="popular_music_video_btn">인기 뮤직비디오</button>
      <button class="music_4u_btn">뮤직4U</button>
      <button class="board_btn">게시판</button>
      <hr class = "head_division_line">
    </div>
    <div class="head_bottom_right">
      <button class="my_music_btn">마이뮤직</button>
      <hr class = "head_division_line">
    </div>	
</div>
</header>

<body>

</body>
</html>