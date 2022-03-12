<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container">
			<h3>예약이력</h3>
		</div>

		<div class = "col-sm-2 container userSearch">
			<form action="userSearch.manager" method = "post" id = "searchName">
			<fieldset>
			<div class="input-group">
					<input type="text" class="form-control" placeholder="검색" name="search" required>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				</div>
			</div>
			</fieldset>
			</form>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container panel panel-default">
		
			<div class = "col-sm-12 container panel panel-default table-responsive">
				
				<table class="table">
					<thead><tr><th scope = "col">예약번호</th><th scope = "col">모델</th><th scope = "col">금액</th><th scope = "col">위치</th><th scope = "col">인수날짜</th><th scope = "col">반납날짜</th><th scope = "col">상태</th></tr></thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><a href = "detail.reserve?rno=${list.rno}">${list.rno}</a></td>					
								<td>${list.model}</td>						
								<td class = "rprice">${list.rprice}원</td>					
								<td>${list.lname}</td>					
								<td>${list.pdate}</td>					
								<td>${list.rdate}</td>						
								<td>
									<c:choose>
										<c:when test="${list.state == 0}">예약</c:when>
										<c:when test="${list.state == 1}">인수</c:when>										
										<c:otherwise>반납</c:otherwise>			
									</c:choose>
								</td>
							</tr>										
						</c:forEach>
					</tbody>
				</table>				
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
<%@ include file = "../inc/footer.jsp"%>