<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp" %>
	
	<br/>
	<div class = "row">
		<div class = "col-sm-3"></div>
		
		<div class = "col-sm-6">
			<div class = "row form-group">
				<h3>Kakao 로그인</h3>
			</div>
			
			<div class = "row panel panel-default">
				<div class = "row">
					<div class = "col-sm-6 container">
						<br/>
						<div class = "form-group">
							<strong>이름 : ${nickname}</strong>
						</div>
						<div class = "form-group">
							<strong>이메일 : ${email}</strong>
						</div>
					</div>
					
					<div class = "col-sm-6 form-group container">
						<br/>
						<img style = "width: 400px; height: 400px;" alt="profile_image" src="${profile_image}"/>
					</div>
				</div>
				
				<div class = "row">
					<form action="kakaoLogin.we" method="post">
						<fieldset>
						<input type = "hidden" value = "${email}" name = "kakaoEmail"/>
							<div class = "text-right form-group" style = "margin-right: 2%">
								<input class = "btn btn-primary" type = "submit" title = "로그인" value = "로그인"/>
								<a href = "loginView.we" title = "뒤로" class = "btn btn-default">돌아가기</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		
		<div class = "col-sm-3"></div>
	</div>

<%@ include file = "../inc/footer.jsp" %>