<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="../inc/header.jsp" %>

<div class="container">
	<h3>공지사항 작성</h3>
		<hr/>
		<form action="noticeWrite.board" method="post" id="writeForm" enctype="multipart/form-data">
		   <fieldset>
			<div class="form-group">
			  <label for="bname">작성자</label>
			  <input type="text" name="bname" id="bname" class="form-control" value = "관리자" readonly> 
			</div>
						
			<div class="form-group">
			  <label for="bpass">비밀번호</label>
			  <input type="password" name="bpass" id="bpass" class="form-control"> 
			  <span>(*) 수정, 삭제시 필수</span>
			</div>
																			
			<div class="form-group">
			  <label for="btitle">제목</label>
			  <input type="text" name="btitle" id="btitle" class="form-control"> 
			</div>
				
			<div class="form-group">
			  <label for="bcontent">내용</label>
			  <textarea name="bcontent" id="bcontent" cols="60" rows="10" class="form-control"></textarea>
			</div>
			
			<div class="form-group">
			  <label for="file">첨부파일</label>
			  <input type="file" name="bimg" id="file" class="form-control"> 
			</div>
							
			<div class="form-group  text-right">
				<input type="submit"   value="입력"  class="btn btn-primary">
				<input type="reset"    value="취소"  class="btn btn-default">  
				<a href="noticeList.board"   class="btn btn-default">목록보기</a>
			</div>
		 </fieldset>		
	</form>
</div>

<script>	
	$(function() {
		$("#writeForm").on("submit", function()	{
			if($("#bpass").val()==""){
				alert("비밀번호를 입력하세요");
				$("#bpass").focus();
				return false;
			}else if($("#btitle").val()==""){
				alert("제목을 입력하세요");
				$("#btitle").focus();
				return false;
			}else if($("#bcontent").val()==""){
				alert("내용을 입력하세요");
				$("#bcontent").focus();
				return false;
			}
		});
	});
</script>

<%@include  file="../inc/footer.jsp" %>