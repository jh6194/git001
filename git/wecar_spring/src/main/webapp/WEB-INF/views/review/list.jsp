<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../inc/header.jsp" %>

<script>
$(function(){
	var result = "${result}";
	if(result == "실패"){ alert(result + "관리자에게 문의바랍니다."); }
	else if(result.length != 0) { alert(result); }
});
</script>

<style>
.star { color: royalblue; }
</style>

<div class="row">
	<div class = "col-sm-1"></div>
	<div class = "col-sm-10">
		<div class="row">
			<h3>후기 관리</h3>
			<c:forEach items="${list}" var="list">
				<div style="padding:30px; height: 400px;" class="col-sm-6 panel panel-default">
					<p style="font-size: 18px; font-weight: 500;}"><a style="color:black;" href="https://jh6194.cafe24.com/wecar/searchDetail.car?cno=${list.cno}&pdate=1">${list.cno} (${list.model})</a></p>
					<div>
						<c:forEach begin="1" end="5" step="1" varStatus="st">
							<span <c:if test="${st.count <= list.star}">class="star"</c:if>>★</span>
						</c:forEach>
						<span style="font-size:15px; margin-left:10px; color:royalblue;"> ${list.star}.0 / 5.0</span>
						<span style="margin-left:70%;"><a href="${pageContext.request.contextPath}/review/delete?sno=${list.sno}" class="btn btn-danger">삭제</a></span>
					</div>
					<hr/>
					<c:if test="${list.sfile != '####'}">
						<img style="max-width: 300px;" src="${pageContext.request.contextPath}/resources/upload/${list.sfile}" alt="${list.sfile}"/>
					</c:if>
					<pre>${list.scontent}</pre>
					<p class="sdate">작성일 : ${list.sdate}</p>
				</div>
			</c:forEach>
		</div>
		
		<div class="row text-center">
			<ul class="pagination">
				<c:if test="${paging.startButton >= paging.bottomlist}"> <li><a href="${pageContext.request.contextPath}/review/list?pstartno=${(paging.startButton-1)*paging.onePageLimit}&uno=${list[0].uno}" title="이동" class="btn">이전</a></li> </c:if>
				<c:forEach var="btn" begin="${paging.startButton}" end="${paging.endButton}">
					<li <c:if test="${btn == paging.currentButton}"> class="active" </c:if>><a href="${pageContext.request.contextPath}/review/list?pstartno=${(btn-1)*paging.onePageLimit}&uno=${list[0].uno}" title="이동" class="btn">${btn}</a></li> 
				</c:forEach>	
				<c:if test="${paging.endButton < paging.pageAll}"> <li><a href="${pageContext.request.contextPath}/review/list?pstartno=${paging.endButton*paging.onePageLimit}&uno=${list[0].uno}" title="이동" class="btn">다음</a></li> </c:if>
			</ul>
		</div>
	</div>
	<div class = "col-sm-1"></div>
</div>

<%@ include file = "../inc/footer.jsp" %>