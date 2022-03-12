<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file = "/inc/header.jsp" %>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container">
		<h3>공지사항</h3>
		</div>

		<div class = "col-sm-2 container listSearch">
			<div class="input-group">
					<input type="text" class="form-control" placeholder="검색" name="search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				</div>
			</div>
		</div>
		<div class = "col-sm-1"></div>
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
						<c:forEach items="${paging.list10}" var="list" varStatus="st">
						<tr>
						<td>${paging.pageTotal-paging.pstartno-st.index}</td>
						<td><a href="noticeDetail.board?bno=${list.bno}">${list.btitle}</a></td>
						<td>${list.bname}</td>
						<td>${list.bdate}</td>
						<td>${list.bhit}</td>
						</tr>
						</c:forEach>
					</tbody>
					
					<tfoot>
						<tr><td colspan = "5" class = "text-center">
							<ul class="pagination">
								<c:if test="${paging.startBtn >= paging.bottomlist}">
									<li><a href="${pageContext.request.contextPath}/noticeList.board?pstartno=${(paging.startBtn-2)*paging.onePageLimit}">  이전 </a></li>
								</c:if>
								
								<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}">
									<li <c:if test="${i==paging.currentBtn}"> class = "active" </c:if>>
									<a href="${pageContext.request.contextPath}/noticeList.board?pstartno=${(i-1)*paging.onePageLimit}">  ${i} </a></li>
								</c:forEach>
								
								<c:if test="${paging.pageAll > paging.endBtn}">
									<li><a href="${pageContext.request.contextPath}/noticeList.board?pstartno=${paging.endBtn*paging.onePageLimit}">  다음 </a></li>
								</c:if>
							</ul>
						</td></tr>
					</tfoot>
				</table>
				<c:if test="${user.id == 'jh6194'}">
				<div class="form-group text-right col-sm-12" id = "listBtn">
					<a href="noticeWrite_view.board" class="btn btn-primary " title="글쓰기폼">글쓰기 </a>
				</div>
				</c:if>
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>

<%@ include file = "/inc/footer.jsp" %>