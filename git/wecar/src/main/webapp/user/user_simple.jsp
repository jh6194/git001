<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp" %>

	<div class = "row">
		<div class = "col-sm-2"></div>
		
			<div class = "col-sm-4">
				<div class = "row">
					<h3>카카오 로그인</h3>
				</div>
				
				<form action = "kakaoDo.we" method = "post" id = "kakaoForm">
					<fieldset>
					<input type = "hidden" value = "${userinfo.uno}" name = "uno"/>
						<div class = "row panel panel-default">
							<div style = "margin-top:12px" class = "col-sm-12 form-group container">
								<label for = "kemail">등록된 이메일</label>
								<input class = "form-control form-group" type = "text" id = "kemail" value = "${userinfo.kakao}" readonly/>
								
								<label for = "kakao">카카오 이메일</label>
								<input class = "form-control form-group" type = "email" id = "kakao" name = "kakao" placeholder = "이메일을 입력해주세요." maxlength="50"/>
								<div class = "text-right">
									<input class = "btn btn-primary text-right" type = "submit" value = "등록"/>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
				
				<div class = "row">
					<h3>네이버 로그인</h3>
				</div>
				
				<form action="" method = "post" id = "naverForm">
					<fieldset>
						<div class = "row panel panel-default">
							<div style = "margin-top:12px" class = "col-sm-12 form-group container">
								<label for = "nemail">등록된 이메일</label>
								<input class = "form-control form-group" type = "text" id = "nemail" value = " " readonly/>
								
								<label for = "naver">네이버 이메일</label>
								<input class = "form-control form-group" type = "email" id = "naver" name = "naver" placeholder = "이메일을 입력해주세요." maxlength="50"/>
								<div class = "text-right">
									<input class = "btn btn-primary" type = "submit" value = "등록"/>								
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		
		<div class = "col-sm-6"></div>
	</div>
	
	<script>
		$(function() {
			$("#kakaoForm").on("submit", function() {
				if($("#kakao").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#kakao").focus();
					return false;
				}
			});
			
			$("#naverForm").on("submit", function() {
				if($("#naver").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#naver").focus();
					return false;
				}
			});
		});
	</script>

<%@ include file = "../inc/footer.jsp" %>