<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file = "../inc/header.jsp" %>

	<div class = "row">
		<div class = "col-sm-12 br"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-12 container">
			<h3 class = "text-center login-head">로그인</h3>
		</div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<form action = "loginDo.we" method = "post" id = "loginForm">
		<fieldset>
	
	<!-- 아이디 저장 -->
	<!-- 아이디 저장 -->
	
	<div class = "row">
		<div class = "col-sm-4"></div>
		<div class = "col-sm-4 form-group login-form">
			<label for = "loginId">아이디</label>
			<input class = "form-control input-lg" type = "text" id = "loginId" name = "loginId" placeholder = "아이디를 입력해주세요." <c:if test="${!empty cookie.remember.value}">value = "${cookie.remember.value}"</c:if>/>
		</div>
		<div class = "col-sm-4"></div>
	</div>
	

		
	<div class = "row">
		<div class = "col-sm-4"></div>
		<div class = "col-sm-4 form-group login-form">
			<label for = "loginPass">비밀번호</label>
			<input class = "form-control input-lg" type = "password" id = "loginPass" name = "loginPass" placeholder = "비밀번호를 입력해주세요."/>
		</div>
		<div class = "col-sm-4"></div>
	</div>
	

	
	<div class = "row">
		<div class = "col-sm-4"></div>
		<div class = "col-sm-2 form-group">
			<input type = "checkbox" id = "idRemember" name = "idRemember" value  = "y" <c:if test="${!empty cookie.remember.value}">checked</c:if>/>
			<label for = "idRemember">아이디 저장</label>
		</div>
		
		<div class = "col-sm-2 login-find text-center">
			<a href = "javascript:showPopId();" class = "btn btn-link btn-xs width50"  title = "아이디 찾기" >아이디 찾기</a>
			<a href = "javascript:showPopPass();" class = "btn btn-link btn-xs width50" id = "loginPwRight" title = "비밀번호 찾기">비밀번호 찾기</a>
		</div>
		<div class = "col-sm-4"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-4"></div>
		<div class = "col-sm-4 form-group text-center login-form">
			<input class = "btn btn-primary btn-block" type = "submit" value = "로그인" title = "로그인"/>
		</div>
		<div class = "col-sm-4"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-4"></div>
		
		<div class = "col-sm-1 form-group">
			<a href = "userInsertView.we" title = "회원가입">회원가입</a>
		</div>
		
		<div class = "col-sm-3 simpleLogin">
			<div style = "display: block;" class = "text-right">
				<!-- <a style = "margin-right: 2%;" href = "https://kauth.kakao.com/oauth/authorize?client_id=0b3cb059ddb5bbed723a8bf94a8295b3&redirect_uri=http://localhost:8080/wecar/KakaoLogin&response_type=code"> -->
				<a style = "margin-right: 2%;" href = "https://kauth.kakao.com/oauth/authorize?client_id=0b3cb059ddb5bbed723a8bf94a8295b3&redirect_uri=https://jh6194.cafe24.com/wecar/KakaoLogin&response_type=code">
					<img alt="카카오 로그인" src="${pageContext.request.contextPath}/inc/kakao_login.png"> 
				</a>
				<a href = "#">
					<img alt="네이버 로그인" src="${pageContext.request.contextPath}/inc/naver_login.png">
				</a>
			</div>
		</div> 
		
		<div class = "col-sm-4"></div>
	</div>
	
	<!--  -->
	<!--  -->
	
	<div class = "row">
		<div class = "col-sm-4"></div>
		<div class = "col-sm-4 form-group">
			<p><img alt="위카 고객센터" src="/wecar/inc/wecall.png"><p>
		</div>
		<div class = "col-sm-4"></div>
	</div>
	
		</fieldset>
	</form>
	
	<script>
		$(function() {
			$("#loginForm").on("submit", function() {
				if($("#loginId").val()=="") {
					alert('아이디를 입력해주세요.');
					$("#loginId").focus();
					return false;
				} else if($("#loginPass").val()=="") {
					alert('비밀번호를 입력해주세요.');
					$("#loginPass").focus();
					return false;
				}
			});
		});
		
		function showPopId() { window.open("findPopIdView.we", "아이디 찾기", "width=600, height=600, left=650, top=50"); }
		function showPopPass() { window.open("findPopPassView.we", "비밀번호 찾기", "width=600, height=600, left=650, top=50"); }
	</script>
	
<%@ include file = "../inc/footer.jsp" %>