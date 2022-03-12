<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file = "/inc/header.jsp" %>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container">
			<h3>2차 시연회</h3>
		</div>
		<div class = "col-sm-3"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container panel panel-default">
		
			<div class = "col-sm-12 container panel panel-default table-responsive">
				<table class="table table-striped col-sm-12">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
						<tr>
						<td>${list.eno}</td>
						<td><a href="eventDetail.board?eno=${list.eno}">${list.etitle}</a></td>
						<td>${list.ename}</td>
						<td>${list.edate}</td>
						<td>${list.ehit}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="form-group text-right col-sm-12" id = "listBtn">
					<a href="eventWrite_view.board" class="btn btn-primary " title="글쓰기폼">글쓰기 </a>
				</div>
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>

<%@ include file = "/inc/footer.jsp" %>