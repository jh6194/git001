<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container">
		<h3>회원관리</h3>
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
					<thead><tr><th scope = "col">번호</th><th scope = "col">ID</th><th scope = "col">이름</th><th scope = "col">생년월일</th><th scope = "col">연락처</th><th scope = "col">주소</th><th scope = "col">등급</th></tr></thead>
					<tbody>
					<c:forEach items="${paging.list10}" var="list" varStatus="st">
					<tr><td>${paging.pageTotal-paging.pstartno-st.index}</td><td>${list.id}</td><td><a href = "userDetail.manager?uno=${list.uno}" title = "상세보기">${list.name}</a></td><td>${list.birth}</td><td>${list.phone}</td><td>${list.post} ${list.address} ${list.address_detail}</td><td>${list.rank}</td></tr>
					</c:forEach>
					</tbody>
					
					<tfoot>
						<tr><td colspan = "7" class = "text-center">
							<ul class="pagination">
								<c:if test="${paging.startBtn >= paging.bottomlist}"> <!-- 시작버튼 >= 버튼수 이면 이전버튼 생성  -->
									<li><a href="${pageContext.request.contextPath}/userList.manager?pstartno=${(paging.startBtn-2)*paging.onePageLimit}">  이전 </a></li>
								</c:if>
								
								<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}">
									<li <c:if test="${i==paging.currentBtn}"> class = "active" </c:if>>
									<a href="${pageContext.request.contextPath}/userList.manager?pstartno=${(i-1)*paging.onePageLimit}">  ${i} </a></li>
								</c:forEach>
								
								<c:if test="${paging.pageAll > paging.endBtn}">	<!-- 전체페치지 > 끝버튼 이면 다음버튼을 생성 -->
									<li><a href="${pageContext.request.contextPath}/userList.manager?pstartno=${paging.endBtn*paging.onePageLimit}">  다음 </a></li>
								</c:if>
							</ul>
						</td></tr>
					</tfoot>
				</table>
				
			</div>
	
		</div>
		<div class = "col-sm-1"></div>
	</div>
      
<%@ include file = "../inc/footer.jsp"%>