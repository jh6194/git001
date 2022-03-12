<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file = "../inc/header.jsp" %>

<style>
.star span{ text-decoration: none; color: gray; font-size: xx-large;}
.star span.on{ color: royalblue; }
label {font-size: x-large;}
</style>

<div class="container">
	<h3> 후기 작성 </h3>
	<form action="${pageContext.request.contextPath}/review/write" method="post" id="form" enctype="multipart/form-data">
		<fieldset>
		<input type="hidden" name="uno" id="uno" value="${user.uno}"/>
		<input type="hidden" name="sname" id="sname" value="${user.id}"/>
		<input type="hidden" name="cno" id="cno" value="${cno}"/>
		<input type="hidden" name="rno" id="rno" value="${param.rno}"/>
		<div class="panel panel-default" style="padding: 30px;">
			<div class="form-group star">
				<label>별점
				<input type="hidden" id="star" name="star" value="">
				<span data-value="1">★</span>
				<span data-value="2">★</span>
				<span data-value="3">★</span>
				<span data-value="4">★</span>
				<span data-value="5">★</span>
				</label>
			</div>
			<div class="form-group">
				<label for="scontent">내용</label>
				<textarea  id="scontent" name="scontent" rows="6" cols="6" class="form-control" style="resize:none" placeholder="10자 이상"></textarea>
			</div>
			<div class="form-group">
				<label for="sfile">파일 업로드</label>		
				<input type="file" name="file" id="sfile" class="form-control" />
			</div>
			<div class="form-group text-right">
				<input type="submit" value="입력" title="입력" class="btn btn-primary">
				<a href="https://jh6194.cafe24.com/wecar/detail.reserve?rno=${param.rno}" title="돌아가기" class="btn btn-default">취소</a>
			</div>
		</div>
		</fieldset>
	</form>
</div>
<script>
	// 별점
	$('.star span').click(function(){ 
		 $(this).parent().children("span").removeClass("on");    
		 $(this).addClass("on").prevAll("span").addClass("on");
		 $('#star').val($(this).attr("data-value"));
	});

	$("#form").on("submit", function(){
		if($("#star").val()==""){ alert("별점을 선택해주세요."); $(".star span").focus(); return false; }
		else if($("#scontent").val().length < 10){ alert("10자 이상 입력해주세요."); $("#scontent").focus(); return false; }
	});

</script>

<%@ include file = "../inc/footer.jsp" %>