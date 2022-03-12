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
	width: 30%;
    padding: 10px 0px 10px 0px;
    font-weight: 800;
    font-size: 18px;
    margin: 60px 30px 0px 30px;
}
.result {
	font-weight: 700;
    font-size: large;
    text-align: center;
    margin-top: 150px;
}
</style>

</head>
<body>
	<div class = "row">
		<div class = "col-sm-12 container text-left">
			<h1 class = "panel-heading">아이디/비밀번호 찾기</h1>
		</div>
	</div>

	<!-- 결과 -->
	<!-- 결과 -->
	
	<div class = "row container">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8 form-group result">
		<p>${userFindId}</p>
		</div>
		<div class = "col-sm-2"></div>
	</div>

	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-3"></div>
		<div class = "col-sm-6  form-group text-center">	
			<a href = "javascript:WinClose();" class = "btn btn-primary">로그인</a>
			<a href = "findPopPassView.we" class = "btn btn-primary">비밀번호 찾기</a>
		</div>
		<div class = "col-sm-3"></div>
	</div>
	
	<script>
		function WinClose(){ window.open('','_self').close(); }
	</script>
	
</body>
</html>