<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>우리 모두의 차 WECAR</title>
<link rel="shortcut icon" href = "${pageContext.request.contextPath}/inc/icon.png" type = "image/x-icon">
<link rel="icon" 		  href = "${pageContext.request.contextPath}/inc/icon.png" type = "image/x-icon">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body {
	background-color:#e9f0f2;
	font-family: Arial, Helvetica, sans-serif;
}
h3 {
    margin-top: 30px;
    margin-bottom: 20px;
    font-weight: revert;
    font-size: 28px;
}
textarea {
	resize: none;
	font-size: 10px;
}
span { color:gray; }
pre {
	border: none;
	background: none;
}

.logo img { width: 103px; margin: -9px 0 0 20px; }
.navbar-brand { padding: 0px 15px; }
.container-fluid { background-color: white; }
.navbar {
    margin-bottom: 0px;
	font-size: smaller;
	font-weight: bolder;
	font-family: Arial, Helvetica, sans-serif;
}
.navbar-inverse {border: 0px;}
.navbar-nav>li>a { padding: 25px 0 0 0;}
.navbar-inverse .navbar-nav>li>a { color:#333333; }
.navbar-inverse .navbar-nav>li>a:hover, .navbar-inverse .navbar-nav>li>a:focus { color:deepskyblue; }
.nav a {
	padding: 0 5px 0 5px;
    margin: 0 5px 0 5px;
}
.nav-menu a {
	font-size: large;
	margin: 0 40px 0 40px;
}
.wellcom {
 	padding: 20px 5px 0 5px;
	margin: 6px 6px 0 0; 
}
.hidden { position:absolute; left:-9999%; width:1px; height:1px; overflow:hidden; line-height:0; }
.ps { font-size: 11px; color: gray; }
.login-head {
	font-size:60px;
	font-weight: normal;
}
.br { margin: 40px 0 40px 0; }
.login-form { margin: 15px 0 15px 0; }
.input-lg { border: 0px; }
.login-find {
    font-size: smaller;
    color:black;
    display: flex;
    justify-content: end;
}
.login-find > input{
    text-align: end;
    width: 30%;
}
.login-btn { width:70%; }
#insertPost, #emailNumAnswer, #iEA { margin-bottom: -60px; }
.btn-link {
	color:black;
	margin-right: 0px;
}login-head
.width50{
    position: relative;
    width:50%;
    margin: 0px;
    padding: 0px;;
}
.btn-lg { padding: 10px 30px; }
.row {margin-right: 0px; margin-left: 0px;}
#double {
	font-weight: 500;
    font-size: 13px;
    -webkit-text-stroke-width: thin;
    margin-left: 30px;
}
.terms{
    display: block;
    width: 100%;
    height: auto;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
}
.mypage-myinfo p {
	margin: 20px 0 20px;
	font-size: 15px;
    font-weight: 500;
}
.mypage label { margin-top: 15px; }
#mypage-UpdateBtn {
	width: 10%;
	padding: 10px 0 10px 0;
}
#mypage-passCheckP, #mypage-passCheckI, #mypage-passCheckE {
	font-weight: 500;
    font-size: 13px;
    -webkit-text-stroke-width: thin;
}
.mypage-h4 { font-weight: revert; }
.deleteInfo p {
	margin: 18px 0 5px;
	text-align: center;
}
.deletePanel { margin-top: 18px; }
#delete-deleteBtn { width: 6%; }
.userSearch { margin-top: 35px; }
.detail p {
	margin: 20px 0 20px;
	font-size: 15px;
    font-weight: 500;
}
.detail label { margin-top: 15px; }
#detail-updateBtn, #detail-deleteBtn, #detail-listBtn {
	width: 10%;
	padding: 10px 0 10px 0;
}
.listSearch { margin-top: 35px; }
#listBtn { margin-top: 15px; }
.simpleLogin img {
	width: 190px;
	height: 45px;
}
.footer { background-color: #f8f8f8; }
.footer ul { 
	list-style: none; 
	display: flex;
}
.footer .footer_menu ul { margin-top: 4%; }
.footer .footer_menu li { margin-right: 2%; }
.footer .footer_menu a {
	font-size: 16px;
    font-weight: 400;
    color: #666;
}
.footer__inner p {
	margin-left: 40px;
    color: #888;
    font-size: 14px;
}
.footer .footer_contents{
	margin-top:  2%;
	margin-bottom: 3%;
}
.footer strong {
	color: #9999;
	margin-left: 95%;
	font-size: 20px;
}
</style>

</head>
  <body>

<!-- enb logo -->
<!-- enb logo -->
<nav class="navbar navbar-inverse row header">
  <div class="container-fluid">
    <div class = "col-sm-4 clearfix">
    	<h1 class = "logo text-center">
			<a class="navbar-brand" href = "https://jh6194.cafe24.com/wecar_spring/main/view" title = "사이트홈페이지로 바로가기 링크">
				<img alt="위카" src="${pageContext.request.contextPath}/inc/LOGO.png">
			</a>
		</h1>
    </div>
    
    
    <!-- enb gnb -->
    <!-- enb gnb -->
    
    
    <c:choose>
    <c:when test="${user.id == 'jh6194'}">  
    <div class = "col-sm-5 clearfix">
    <h2 class="hidden">주메뉴</h2>
    <ul class="nav-menu nav navbar-nav">
		<li><a href="${pageContext.request.contextPath}/noticeList.board">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/list.car">차량관리</a></li>
		<li><a href="${pageContext.request.contextPath}/list.reserve">예약관리</a></li>
		<li><a style="color:orange;" href="${pageContext.request.contextPath}/eventList.board">피드백</a></li>
    </ul>
    </div>
    
    <div class = "col-sm-3 clearfix">
    <ul class="nav navbar-nav navbar-right nav-submenu">   
      <li><p class = "wellcom">안녕하세요 관리자님!</p></li>
      <li><a href="${pageContext.request.contextPath}/logout.we">로그아웃</a></li>
      <li><a href="${pageContext.request.contextPath}/userList.manager">회원관리</a></li>
      <li><a href="${pageContext.request.contextPath}/serviceCenter.we">고객센터</a></li>
    </ul>
    </div>
    </c:when>
    


    
    <c:when test="${user.id != null}">
    <div class = "col-sm-5 clearfix">
    <h2 class="hidden">주메뉴</h2>
    <ul class="nav-menu nav navbar-nav">
		<li><a href="${pageContext.request.contextPath}/noticeList.board">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/search.car">예약하기</a></li>
		<li><a href="${pageContext.request.contextPath}/list.reserve">예약확인</a></li>
		<li><a style="color:orange;" href="${pageContext.request.contextPath}/eventList.board">피드백</a></li>
    </ul>
    </div>
    
    <div class = "col-sm-3 clearfix">
    <ul class="nav navbar-nav navbar-right nav-submenu">   
      <li><p class = "wellcom">안녕하세요 ${user.id}님!</p></li>
      <li><a href="${pageContext.request.contextPath}/logout.we">로그아웃</a></li>
      <li><a href="${pageContext.request.contextPath}/mypageView.we">마이페이지</a></li>
      <li><a href="${pageContext.request.contextPath}/serviceCenter.we">고객센터</a></li>
    </ul>
    </div>
    </c:when>
    


	<c:otherwise>
    <div class = "col-sm-5 clearfix">
    <h2 class="hidden">주메뉴</h2>
    <ul class="nav-menu nav navbar-nav">
		<li><a href="${pageContext.request.contextPath}/noticeList.board">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath}/search.car">예약하기</a></li>
		<li><a href="${pageContext.request.contextPath}/list.reserve">예약확인</a></li>
		<li><a style="color:orange;" href="${pageContext.request.contextPath}/eventList.board">피드백</a></li>
    </ul>
    </div>
    
    <div class = "col-sm-3 clearfix">
    <ul class="nav navbar-nav navbar-right nav-submenu">   
      <li><a href="${pageContext.request.contextPath}/loginView.we">로그인</a></li>
      <li><a href="${pageContext.request.contextPath}/serviceCenter.we">고객센터</a></li>
    </ul>
    </div>
	</c:otherwise>    
    </c:choose>
    
  </div>
</nav>