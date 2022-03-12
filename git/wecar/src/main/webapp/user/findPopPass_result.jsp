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
h3 {
    margin-top: 30px;
    margin-bottom: 30px;
    font-weight: bolder;
    font-size: 28px;
}
.btn {
	width: 30%;
	padding: 10px 5px 10px 5px;
    font-weight: 800;
    font-size: 18px;
    background-color: #e9f0f2;
    margin: 40px 0 30px 0;
}
#btn {
	background-color: royalblue;
	color: white;
}
.hidden { position:absolute; left:-9999%; width:1px; height:1px; overflow:hidden; line-height:0; }
p { margin: 55px 0 20px;}
</style>

</head>
<body>
	<div class = "row">
		<div class = "col-sm-12 container text-left">
			<h1 class = "panel-heading">아이디/비밀번호 찾기</h1>
			<h2 class = "hidden">주메뉴</h2>
		</div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-12 container text-center">
			<p><img alt="위카" src="${pageContext.request.contextPath}/inc/logo.jpg"></p>
		</div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-12 container text-center">
			<h3>비밀번호 변경 완료</h3>
		</div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-12 container text-center">
			<Strong>'확인' 버튼 클릭시 창이 닫힙니다.</Strong>
		</div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8  form-group text-center">
			<a href = "javascript:WinClose();" class = "btn btn-primary" id = "btn">확인</a>
		</div>
		<div class = "col-sm-2"></div>
	</div>

	<script>
			function WinClose(){ window.open('','_self').close(); }
	</script>
	
</body>
</html>