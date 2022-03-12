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
	margin: 40px 0 30px 0;
}
.hidden { position:absolute; left:-9999%; width:1px; height:1px; overflow:hidden; line-height:0; }
.ps { font-size: 11px; color: gray; }
</style>

<script>
	/* 공백제거 */
	/* 공백제거 */
		
	function noSpaceForm(obj) {
	    var str_space = /\s/;  
	    if(str_space.exec(obj.value)) {
	        obj.value = obj.value.replace(' ','');
	        return false;
	    }
	}
</script>

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
			<h3 class = "panel-heading">변경할 비밀번호를 입력해주세요.</h3>
		</div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<form action="findPopPassDoView.we" method = "post" id = "PassChangeForm">
		<fieldset>
	
	<div class = "row container">
		<div class = "col-sm-2"></div>
		<div class = "col-sm-8">
			<div class = "form-group">
				<label for = "afterPass">비밀번호</label>
				<input class = "form-control input-lg" type = "password" id = "afterPass" name = "afterPass" placeholder = "비밀번호를 입력해주세요." required maxlength='20' pattern='^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$' title = "영문,숫자,특수문자 조합 8-20자" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
				<strong class = "ps">*영문, 숫자, 특수문자를 조합한 8~20자로 입력해주세요.</strong>
				<input type = "hidden" value = "${param.hiddenId}" name = "hiddenId"/>
			</div>
			
            <div class = "form-group">
            	<label for = "afterPassCheck">비밀번호 확인</label>
	            <input class = "form-control input-lg" type = "password" id = "afterPassCheck" name = "afterPassCheck" placeholder = "비밀번호를 다시 입력해주세요." required maxlength='20'/>
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
			$("#PassChangeForm").on("submit", function() {
				if($("#afterPass").val() != $("#afterPassCheck").val()) {
				alert('비밀번호가 일치하지 않습니다.');
				$("#afterPassCheck").focus();
				return false;
			}
		});
	});
	</script>
	
</body>
</html>