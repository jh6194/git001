<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file = "../inc/header.jsp" %>

<style>
.panel {
	padding: 15px;
}
</style>

	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<div style = "margin-top:12%; margin-bottom:12%;" class = "row panel panel-default">
				<div style = "margin-top:3%; margin-bottom:3%;" class = "col-sm-12 text-center form-group">
					<h3 style = "color:dodgerblue; font-size:40px;">예약이 완료되었습니다.</h3>
					<p style = "margin-top:30px;">확인을 클릭하면 예약정보 확인 페이지로 이동됩니다.</p>
					<a style = "margin-top:20px; width:15%; height:35px;" href = "select.reserve" class = "btn btn-primary">확인</a>
				</div>
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>

<%@ include file = "../inc/footer.jsp" %>