<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="../inc/header.jsp" %>

<div class="container">
	<h3>수정</h3>
		<hr/>
		<form action="eventEdit.board?eno=${select.eno}" method="post"  id="editForm" enctype="multipart/form-data">
		   <fieldset>
			<div class="form-group">
			  <label for="ename">작성자</label>
			  <input type="text"   name="ename"   id="ename"   class="form-control"   value="${select.ename}"> 
			</div>	
					
			<div class="form-group">
			  <label for="epass">비밀번호</label>
			  <input type="password"   name="epass"   id="epass"   class="form-control" > 
			  <span>(*) 수정, 삭제시 필수</span>
			</div>		
																	
			<div class="form-group">
			  <label for="etitle">제목</label>
			  <input type="text"   name="etitle"   id="etitle"   class="form-control"  value="${select.etitle}"> 
			</div>	
			
			<div class="form-group">
			  <label for="econtent"  >내용</label>
			  <textarea name="econtent"  id="econtent"  cols="60"  rows="10"   class="form-control" >${select.econtent}</textarea>
			</div>
			
			<div class="form-group">
			  <label for="after_eimg">첨부파일</label>
			  <input type="file" name="after_eimg" id="after_eimg" class="form-control">
			  <input type="text" name="before_eimg" value = "${select.eimg}" class="form-control" readonly>
			</div>
					
			<div class="form-group  text-right">
				<input type="submit"   value="입력"   class="btn btn-primary"  >  
				<a href="eventDetail.board?eno=${select.eno}"   class="btn btn-default">취소</a>  
				<a href="eventList.board"   class="btn btn-default">목록보기</a>
			</div>
		 </fieldset>		
	</form>
</div>

<script>	
	$(function()	{
		$("#editForm").on("submit",	function()	{
			if($("#epass").val()==""){
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