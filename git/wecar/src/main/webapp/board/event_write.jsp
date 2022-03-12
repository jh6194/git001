<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="../inc/header.jsp" %>

<div class="container">
	<h3>작성</h3>
		<hr/>
		<form action="eventWrite.board" method="post" id="writeForm" enctype="multipart/form-data">
		   <fieldset>
			<div class="form-group">
			  <label for="ename">작성자</label>
			  <input type="text" name="ename" id="ename" class="form-control" <c:if test="${!empty user}">value = "${user.name}"</c:if>> 
			</div>
						
			<div class="form-group">
			  <label for="epass">비밀번호</label>
			  <input type="password" name="epass" id="epass" class="form-control" value = "1234"> 
			  <span>(*) 수정, 삭제시 필수 (기본셋팅 : 1234)</span>
			</div>
																			
			<div class="form-group">
			  <label for="etitle">제목</label>
			  <input type="text" name="etitle" id="etitle" class="form-control"> 
			</div>
				
			<div class="form-group">
			  <label for="econtent">내용</label>
			  <textarea name="econtent" id="econtent" cols="60" rows="10" class="form-control"></textarea>
			</div>
			
			<div class="form-group">
			  <label for="file">첨부파일</label>
			  <input type="file" name="eimg" id="file" class="form-control"> 
			</div>
							
			<div class="form-group  text-right">
				<input type="submit"   value="입력"  class="btn btn-primary">
				<input type="reset"    value="취소"  class="btn btn-default">  
				<a href="eventList.board"   class="btn btn-default">목록보기</a>
			</div>
		 </fieldset>		
	</form>
</div>

<script>	
	$(function() {
		$("#writeForm").on("submit", function()	{
			if($("#ename").val()==""){
				alert("작성자를 입력하세요");
				$("#ename").focus();
				return false;
			}else if($("#epass").val()==""){
				alert("비밀번호를 입력하세요");
				$("#epass").focus();
				return false;
			}else if($("#etitle").val()==""){
				alert("제목을 입력하세요");
				$("#etitle").focus();
				return false;
			}else if($("#econtent").val()==""){
				alert("내용을 입력하세요");
				$("#econtent").focus();
				return false;
			}
		});
	});
</script>

<%@include  file="../inc/footer.jsp" %>