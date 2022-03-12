<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 우편번호찾기 :	https://postcode.map.daum.net/guide -->	
	<div class = "container panel panel-info">
	   <div class="row form-group">
			<div class="col-sm-2">
			   <label for="postcode">우편번호</label>
			</div>
			
			<div class="col-sm-4">
			   <input type="text" id="postcode" name="postcode" class="form-control" />
			</div>
			
			<div class="col-sm-6">
			   <input type="button" id="post" value="우편번호" class="btn btn-danger" />
			</div>
	   </div>
	   
		<div class="row form-group">
			<div class="col-sm-2">
				<label for="address">상세주소</label>
			</div>
			
			<div class="col-sm-4">
				<input type="text" id="address" name="address" class="form-control" />
			</div>
			
			<div class="col-sm-6">
				<input type="text" id="address2" name="address2" placeholder="상세주소를 입력해주세요." class="form-control" />
			</div>
		</div>
	</div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(function() {
			$("#post").on("click", function() {
				new daum.Postcode({
					oncomplete : function(data) {
						$("#postcode").val(data.zonecode);
						$("#address").val(data.address);
						$("#address2").focus();
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
						// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		         	}
		      	}).open();
		   	});
		});
</script>
	
<!-- SMTP 개념
		-SMTP 프로토콜 : Simple Mail Transfer Protocol
		인터넷상에서 이메일을 전송하기 위해 사용되는 통신규약
		
		-SMTP 서버를 구축하기 위해 물리적서버(예:리눅스, 유닉스,,,) 구축하여 서버를 설치해야함.
		-네이버와 구글 계정에 대한 SMTP 제공을 해주기 때문에 이것을 이용하려고 함.
	 
	ㅁ 개발순서
		1. JavaMail 라이브러리를 다운로드받고 프로젝트에 import
		   https://mvnrepository.com/artifact/javax.mail/mail/1.4.7
		   https://mvnrepository.com/artifact/javax.activation/activation/1.1
		2. 구글 또는 네이버 smtp 환경설정
		3. 개발시작 -->

</body>
</html>