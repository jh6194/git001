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
h1 {
	font-size: x-large;
	font-weight: bolder;
}
.btn {
	width: 40%;
	padding: 20px 6px 20px 12px;
    font-weight: 800;
    font-size: 18px;
    background-color: #e9f0f2;
    margin: 30px 0 50px 0;
}
.btn-default:hover {
	background-color: royalblue;
    color: white;
}
#btn2 {
	width: 25%;
	padding: 12px 6px 12px 12px;
    font-weight: 800;
    font-size: 18px;
    background-color: royalblue;
    margin: 35px 0 20px 0;
}
#btn1 {
	background-color: royalblue;
	color: white;
}
.hidden { position:absolute; left:-9999%; width:1px; height:1px; overflow:hidden; line-height:0; }
</style>

</head>
<body>
	<div class = "row">
		<div class = "col-sm-12 container text-left">
			<h1 class = "panel-heading">아이디/비밀번호 찾기</h1>
			<h2 class = "hidden">주메뉴</h2>
		</div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8 text-center">
			<a href = "findPopIdView.we" class = "btn btn-default">아이디 찾기</a>
			<input type = "reset" class = "btn btn-default" value = "비밀번호 찾기" id = "btn1"/>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
	<!-- 이름 -->
	<!-- 이름 -->
	
	<form action="findPopPassEmailView.we" method = "post" id = "PassfindForm">
		<fieldset>
	
	<div class = "row container">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8 form-group">
			<label for = "findPassId">아이디</label>
			<input class = "form-control input-lg" type = "text" id = "findPassId" name = "findPassId" placeholder = "아이디를 입력해주세요."/>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
	<!-- 이메일 -->
	<!-- 이메일 -->
	
	<div class = "row container">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8 form-group">
			<label for = "findPassEmail">이메일</label>
			<input class = "form-control input-lg" type = "email" id = "findPassEmail" name = "findPassEmail" placeholder = "이메일을 입력해주세요."/>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8  form-group text-center">
			<input class = "btn btn-primary" type = "submit" value = "확인" id = "btn2"/>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
		</fieldset>
	</form>
	
	
	
</body>
</html>