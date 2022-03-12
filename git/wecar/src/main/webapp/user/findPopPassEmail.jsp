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
    margin-top: 25px;
    margin-bottom: 30px;
    font-weight: bolder;
    font-size: 20px;
}
.btn {
    font-weight: 800;
    font-size: 16px;
}
#btn {
	background-color: royalblue;
	color: white;
	width: 25%;
	padding: 10px 0px 10px 0px;
	margin: 30px 0 30px 0;
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
	
	<div class = "row">
		<div class = "col-sm-12 container text-left">
			<h3 class = "panel-heading">비밀번호 변경을 위해서 이메일 인증을 진행해주세요.</h3>
		</div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<form action="findPopPassDo.we" method = "post" id = "PassEmailForm">
		<fieldset>
	
	<div class = "row container">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8">
			<div class = "form-group">
				<label for = "PassEmail">이메일</label>
				<div style="display: flex;">
					<input style="margin-right: 2%;" class = "form-control input-lg" type = "text" id = "PassEmail" name = "PassEmail" value = "${param.findPassEmail}" readonly/>
					<input style="height:35px; margin-top: 5px;" class = "btn btn-primary" type = "button" value = "인증요청" id = "pENsend" name = "pENsend"/>
				</div>
				<input type = "hidden" value = "${param.findPassId}" name = "hiddenId"/>
			</div>
			
            <div class = "form-group">
            	<label for = "PassEmailNum">인증번호</label>
            	<div style="display: flex;">
		            <input style="margin-right: 2%;" class = "form-control input-lg" type = "text" id = "PassEmailNum" name = "PassEmailNum" placeholder = "인증번호를 입력해주세요."/>
		            <input type = "hidden" id = "pEN"/>
		            <input type = "hidden" id = "pENcheck" value = "-1"/>
		            <input style="height:35px;display:none; margin-right: 1%; margin-top: 5px;" class = "btn btn-primary" type = "button" value = "인증" id = "pENreceive" name = "pENreceive"/>
		            <input style="height:35px;display:none; margin-top: 5px;" class = "btn btn-primary" type = "button" value = "재전송" id = "pENresend" name = "pENresend"/>
				</div>
			 </div>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8  form-group text-center">
			<input class = "btn btn-primary" type = "submit" value = "확인" id = "btn"/>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	
		</fieldset>
	</form>
	
	<script>
		$(function() {
			$("#pENsend").on("click", function() {
				$.ajax({
					url:"${pageContext.request.contextPath}/mail.we"
					,type:"post"
					,dataType:"text"
					,data:{ "email":$("#PassEmail").val() }
					,success:function(data) {
						alert("인증번호가 발송되었습니다.");
						$("#pENsend").hide();
						$("#pENreceive").show();
						$("#pENresend").show();
						$("#pEN").val(data);
					},error: function(xhr,text,Status,errorThrown) {
						$("#PassEmailNum").html(textStauts + "(HTTP-"+xht.status+"/"+errorThreown);
					}
				});
			});
				
		 	$("#pENresend").on("click", function() {
				$.ajax({
					url:"${pageContext.request.contextPath}/mail.we"
					,type:"post"
					,dataType:"text"
					,data:{ "email":$("#PassEmail").val() }
					,success:function(data) {
						alert("인증번호가 재발송되었습니다.");
						$("#pEN").val(data);
					},error: function(xhr,text,Status,errorThrown) {
						$("#PassEmailNum").html(textStauts + "(HTTP-"+xht.status+"/"+errorThreown);
					}
				});
			});
			
			$("#pENreceive").on("click", function() {
				if ($("#pEN").val() == $("#PassEmailNum").val()) {
					alert("인증에 성공하였습니다.");
					$("#pENreceive").attr("disabled", "disabled");
					$("#pENresend").attr("disabled", "disabled");
					$("#PassEmailNum").attr("readonly", "readonly");
					$("#pENcheck").val(1);
				} else {
					alert("인증에 실패하였습니다.");
				}
			});
			
			$("#PassEmailForm").on("submit", function() {
				if($("#pENcheck").val() == -1) {
					alert('이메일 인증이 필요합니다.');
					$("#PassEmailNum").focus();
					return false;
				}
			});
		});
	</script>
	
</body>
</html>