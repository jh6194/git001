<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container">
			<h3>회원검색</h3>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container panel panel-default">
		
			<div class = "col-sm-12 container panel panel-default table-responsive">
				<div class = "form-group">
					<table class="table">
						<thead><tr><th scope = "col">번호</th><th scope = "col">ID</th><th scope = "col">이름</th><th scope = "col">생년월일</th><th scope = "col">연락처</th><th scope = "col">주소</th><th scope = "col">등급</th></tr></thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list}" var="list">
									<tr><td>${list.uno}</td><td>${list.id}</td><td><a href = "userDetail.manager?uno=${list.uno}" title = "상세보기">${list.name}</a></td><td>${list.birth}</td><td>${list.phone}</td><td>${list.post} ${list.address} ${list.address_detail}</td><td>${list.rank}</td></tr>
									</c:forEach>
								</c:when>
								
								<c:otherwise>
									<tr><td colspan = "7" class = "text-center">검색된 회원이 없습니다.</td></tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
				<div class = "form-group text-right">
					<a href = "userList.manager" class = "btn btn-default" title = "회원관리로 이동">돌아가기</a>
				</div>
			</div>
	
		</div>
		<div class = "col-sm-1"></div>
	</div>
      
<%@ include file = "../inc/footer.jsp"%>