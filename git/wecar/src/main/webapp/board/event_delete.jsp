<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="../inc/header.jsp" %>

<div class="container">
		<h3>삭제</h3>
		<form action="eventDelete.board?eno=${param.eno}" method="post"   id="deleteForm"> 
			<div class="form-group">
			  <label for="epass"  >비밀번호</label>
			  <input type="password"   name="epass"   id="epass"   class="form-control" > 
			  <span>(*) 삭제시 필수입니다. </span>
			</div>
			
			<div class="form-group">
				<input type="submit" value=" 확인 "   class="btn btn-danger" />
				<a class="btn btn-default" href="eventDetail.board?eno=${param.eno}">취소</a>  
			</div>	
		</form>
</div>

<script>
	$(function()	{
		$("#deleteForm").on("submit", function()	{
			if($("#epass").val()==""){
				alert("비밀번호을 입력해주세요");
				$("#epass").focus();
				return false;
			}
		});
	});
</script>
<%@include file="../inc/footer.jsp" %>