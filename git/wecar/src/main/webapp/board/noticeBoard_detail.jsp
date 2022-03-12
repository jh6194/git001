<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "/inc/header.jsp" %>

	<div class = "row container">
		<div class = "col-sm-3"></div>
		<div class = "col-sm-8">
		<h3 class = "panel-body">공지사항 상세보기</h3>
		<hr/>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	
	<div class = "row">
		<div class = "col-sm-2"></div>
		<div class = "container panel col-sm-8">
			<div class = "row col-sm-12">
				<h4>제목: ${select.btitle}</h4>
				<hr/>
			</div>
			
			<div class = "row">
				<div class = "col-sm-9">
					<span>작성자: ${select.bname}</span>
				</div>
				
				<div class = "col-sm-3 text-right">
					<span>작성날짜: ${select.bdate}</span>
				</div>
			</div>
			
			<div class = "row form-group col-sm-12 text-right">
				<span>조회수: ${select.bhit}</span>
				<hr/>
			</div>
			
			
			<div class = "row form-group">
				<div class = "col-sm-12">
					<p><img alt="${select.bimg}" src="${pageContext.request.contextPath}/board/upload/${select.bimg}"><p>
					<pre>${select.bcontent}</pre>
				</div>
			</div>


			<div class = "row">
				<div class="text-right form-group">
					<hr/>
					<c:if test="${user.id == 'jh6194'}">
						<a href="noticeEdit_view.board?bno=${select.bno}"  class="btn btn-primary" >수정</a> 
						<a href="noticeDelete_view.board?bno=${select.bno}"  class="btn btn-danger" >삭제</a>
					</c:if>
						<a href="noticeList.board"  class="btn btn-default" >목록보기</a> 
				</div>	
			</div>
		</div>
		<div class = "col-sm-2"></div>
	</div>
	

<%@ include file = "/inc/footer.jsp" %>