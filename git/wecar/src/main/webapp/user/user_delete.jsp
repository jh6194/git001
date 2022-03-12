<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-11 container">
		<h3>회원정보</h3>
		</div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-2 container panel panel-default deleteInfo">
		
			<div class = "col-sm-6 form-group">
			<P>아이디 : ${userinfo.id}</P>
			</div>
	
			<div class = "col-sm-6 form-group">
			<P>등급 : ${userinfo.rank}</P>
			</div>
		
		</div>
		<div class = "col-sm-9"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-11 container">
		<h3>회원탈퇴</h3>
		</div>
	</div>
	
	<form action="userDeleteDo.we" method = "post" id = "deleteForm">
	<fieldset>
	<input type = "hidden" value = "${userinfo.uno}" name = "deleteNo"/>
	<input type = "hidden" value = "-1" id = "deletePNo"/>
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-8 container panel panel-default">
			
			<div class = "row">
				<div class = "col-sm-4 deletePanel">
					<div class = "form-group">
					<label for = "deletePass">비밀번호</label>
					<input class = "form-control" type = "password" id = "deletePass" name = "deletePass" placeholder = "비밀번호를 입력해주세요." maxlength='20'/>
					<span id = "PassCheck"></span>
					</div>
				</div>
				
				<div class = "col-sm-8"></div>
			</div>
			
			<div class = "row">
				<div class = "col-sm-12 form-group">				
					<label for = "textarea">유의사항</label>
					<textarea  class = "terms" readonly="readonly" cols="10" rows = "8" id = "textarea">
회원탈퇴시 유의사항
					</textarea>
				</div>
			</div>
			
			<div class = "row">
			<div class = "col-sm-12 text-right">
				<label for = "checkbox">위 내용에 동의하십니까?</label>
				<input type = "checkbox" id = "checkbox" name = "checkbox" value  = "y"/>
				<label for = "checkbox">동의함</label>
			</div>
			</div>
			
			<div class = "row">
			<div class = "col-sm-12 text-right form-group">
				<input class = "btn btn-danger" type = "button" value = "탈퇴" title = "회원탈퇴" id = "delete-deleteBtn"/>
			</div>
			</div>
			
		</div>
		<div class = "col-sm-3"></div>
	</div>
	</fieldset>
	</form>
	
	<!-- modal -->
	<!-- modal -->
	
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalLabel">회원 탈퇴</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 탈퇴하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-danger" value = "탈퇴" id = "modalDeleteBtn"/>
	       	<input type="button" class="btn btn-default" data-dismiss="modal" value = "취소"/>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(function() {
			$("#deletePass").keyup(function() {
				$.ajax({
					url:"${pageContext.request.contextPath}/WUpassCheck"
					,type:"post"
					,dataType:"text"
					,data:{"pass":$("#deletePass").val(), "uno":"${userinfo.uno}"}
					,success:function(data) {
						if (data == 1) {
							$("#PassCheck").text("비밀번호가 일치합니다.");
							$("#PassCheck").css("color", "blue");
							$("#deletePNo").val(1);
						} else {
							$("#PassCheck").text("비밀번호가 일치하지 않습니다.");
							$("#PassCheck").css("color", "red");	
							$("#deletePNo").val(-1);
						}
					},error:function(xhr,text,Status,errorThrown) {
						$("#deletePass").html(textStauts + "(HTTP-"+xht.status+"/"+errorThrown)
					}
				});
			});
			
			$("#delete-deleteBtn").click(function() {
				if($("#deletePass").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#deletePass").focus();
					return false; 
				} else if($("#deletePNo").val() == -1) {
					$("#deletePass").focus();
					return false;
				} else if($(":checkbox[name='checkbox']:checked").length == 0) {
					alert("안내사항에 동의하지 않았습니다.");
					$("#checkbox").focus();
					return false;
				} else {
					$("#deleteModal").modal();
				}
			});
			
			$("#modalDeleteBtn").on("click", function() {
				$("#deleteForm").submit();
			});
		});
	</script>
      
<%@ include file = "../inc/footer.jsp"%>