<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container">
			<h3>차량관리</h3>
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
					<thead><tr><th scope = "col">차량번호</th><th scope = "col">제조사</th><th scope = "col">모델</th><th scope = "col">차종</th><th scope = "col">연식</th><th scope = "col">연료</th><th scope = "col">위치</th><th scope = "col">등록일</th><th scope = "col">금액</th></tr></thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><a href = "detail.car?cno=${list.cno}">${list.cno}</a></td>					
								<td>${list.brname}</td>						
								<td>${list.model}</td>					
								<td>${list.tname}</td>					
								<td>${list.vehicle_year}</td>					
								<td>${list.fname}</td>
								<td>${list.lname}</td>					
								<td>${list.cdate}</td>				
								<td>${list.cprice}</td>
							</tr>										
						</c:forEach>
					</tbody>
				</table>
				
				<div class = "form-group text-right">
					<a href = "insertView.car" class = "btn btn-primary form-group">차량등록</a>
				</div>
				
			</div>
	
		</div>
		<div class = "col-sm-1"></div>
	</div>
      
<%@ include file = "../inc/footer.jsp"%>