<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file = "../inc/header.jsp"%>

<script>
	/* 공백제거 */
	/* 공백제거 */
		
	function noSpaceForm(obj) {
	    var str_space = /\s/;  
	    if(str_space.exec(obj.value)) {
	        obj.value = obj.value.replace(' ','');
	        return false;
	    }
	}
</script>

	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-4 container">
		<h3>${detail.name}님 정보</h3>
		</div>
		<div class = "col-sm-1"></div>
		<div class = "col-sm-5 container">
		<h3>최근이력</h3>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-4 container panel panel-default detail">
		
			<div class = "col-sm-6">
			<P>아이디 : ${detail.id}</P>
			<P>이름 : ${detail.name}</P>
			<P>생년월일 : ${detail.birth}</P>
			<P>휴대전화 : ${detail.phone}</P>
			</div>
	
			<div class = "col-sm-6">
			<P>이메일 : ${detail.email}</P>
			<P>주소 : ${detail.post} ${detail.address} ${detail.address_detail}</P>
			<P>등급 : ${detail.rank}</P>
			<P>가입날짜 : ${detail.date}</P>
			</div>
		
		</div>
		<div class = "col-sm-1"></div>
		<div class = "col-sm-5 container panel panel-default table-responsive">
			<table class="table">
				<thead><tr><th scope = "col">예약일시</th><th scope = "col">차종</th><th scope = "col">상태</th></tr></thead>
				<tbody id = "recent"></tbody>
			</table>
			<div style="margin: 10px 10px 15px 0px;" class="text-right">
				<a href="https://jh6194.cafe24.com/wecar_spring/review/list?pstartno=0&uno=${detail.uno}" class="btn btn-primary">후기관리</a>
			</div>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container">
		<h3>정보 수정</h3>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	
	<form action="#" method = "post" id = "updateForm">
	<fieldset>
	<input type = "hidden" value = "${detail.uno}" name = "detailUno"/>
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10 container panel panel-default detail">
		
			<div class = "col-sm-6">
				<div class = "form-group">
				<label for = "updatePass">변경할 비밀번호</label>
				<input class = "form-control" type = "password" id = "updatePass" name = "updatePass" placeholder = "변경할 비밀번호를 입력해주세요." maxlength='20' onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
				<div class = "form-group">
					<label for = "updateEmail">이메일</label>
					<input class = "form-control" type = "email" id = "updateEmail" name = "updateEmail" placeholder = "이메일을 입력해주세요." value = "${detail.email}"/>
				</div>
					<label for = "updateRank">등급</label>
					<select id = "updateRank" name = "updateRank">
						<option value = "5" <c:if test="${detail.rank == 5}">selected</c:if>>5</option>
						<option value = "4" <c:if test="${detail.rank == 4}">selected</c:if>>4</option>
						<option value = "3" <c:if test="${detail.rank == 3}">selected</c:if>>3</option>
						<option value = "2" <c:if test="${detail.rank == 2}">selected</c:if>>2</option>
						<option value = "1" <c:if test="${detail.rank == 1}">selected</c:if>>1</option>
						<option value = "0" <c:if test="${detail.rank == 0}">selected</c:if>>0</option>
					</select>
				</div>
			</div>
			
			<div class = "col-sm-6">
				<div class = "form-group">
						<label for = "updatePhone">휴대전화</label>
						<input class = "form-control" type = "text" id = "updatePhone" name = "updatePhone" placeholder = "ex)01012345678" value = "${detail.phone}" maxlength='11' pattern="^[0-9]{11}$" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
						<label for = "updatePostcode">주소</label>		
					<div style="display: flex;" class = "form-group">
						<input style="margin-right: 2.5%;" class = "form-control" type = "text" id = "updatePostcode" name = "updatePostcode" placeholder = "우편번호" value = "${detail.post}" readonly/>
						<input class = "btn btn-primary" type = "button" value = "우편번호" title = "우편번호 검색" id = "updatePost"/>
					</div>
					
					<div class = "form-group">
						<input class = "form-control" type = "text" id = "updateAddress1" name = "updateAddress1" placeholder = "주소" value = "${detail.address}" readonly/>	
					</div>
					
					<div class = "form-group">	
						<input class = "form-control" type = "text" id = "updateAddress2" name = "updateAddress2" placeholder = "상세주소를 입력해주세요." value = "${detail.address_detail}"/>
					</div>
					
					<div class = "form-group text-right">
						<input class = "btn btn-primary" type = "button" value = "수정" title = "수정하기" id = "detail-updateBtn"/>
						<input class = "btn btn-danger" type = "button" value = "삭제" title = "삭제하기" id = "detail-deleteBtn"/>
						<a href = "userList.manager" class = "btn btn-default" title = "목록으로 이동" id = "detail-listBtn">목록</a>
					</div>
				</div>
			</div>
			<div class = "col-sm-1"></div>
		</div>
	</div>
	</fieldset>
	</form>

	<!-- Modal -->
	<!-- Modal -->
	
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">회원 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 수정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-primary" value = "수정" id = "modalUpdateBtn"/>
	       	<input type="button" class="btn btn-default" data-dismiss="modal" value = "취소"/>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="deleteModalLabel">회원 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-danger" value = "삭제" id = "modalDeleteBtn"/>
	       	<input type="button" class="btn btn-default" data-dismiss="modal" value = "취소"/>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			// 가격 형태 변환
			function priceToString(price) {
				return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}
			
			$(function() {
				// 최근이력
				var html = "";
				<c:forEach items="${list}" var="list">
					var state = "";
					switch ("${list.state}") {
						case '0':	state = "예약";	break;
						case '1':	state = "인수";	break;
						case '2':	state = "반납";	break;
						case '3':	state = "반납";	break;
					}
					
					html += '<tr>'
					html += '<td><a href = "detail.reserve?rno=${list.rno}">${list.rno}</a></td>'
					html += '<td>${list.pdate}</td>'
					html += '<td>${list.rdate}</td>'
 					html += '<td>'+priceToString(${list.rprice})+'원</td>'
					html += '<td>'+state+'</td>'	
					html += '</tr>'				
				</c:forEach>
				$("#recent").html(html);			
				
				/* 우편번호 */
				/* 우편번호 */
				
				$("#updatePost").on("click", function() {
					new daum.Postcode({
						oncomplete : function(data) {
							$("#updatePostcode").val(data.zonecode);
							$("#updateAddress1").val(data.address);
							$("#updateAddress2").focus();
			         	}
			      	}).open();
			   	});
				
				/* modal */
				/* modal */
				
				$("#detail-updateBtn").click(function(){
					if($("#updateEmail").val() == "") {
						alert('이메일을 입력해주세요.');
						$("#updateEmail").focus();
						return false;
					} else if($("#updatePhone").val() == "") {
						alert('휴대전화를 입력해주세요.');
						$("#updatePhone").focus();
						return false;
					} else if($("#updatePostcode").val() == "") {
						alert('우편번호를 입력해주세요.');
						$("#updatePostcode").focus();
						return false;
					} else if($("#updateAddress1").val() == "") {
						alert('주소를 입력해주세요.');
						$("#updateAddress1").focus();
						return false;
					} else if($("#updateAddress2").val() == "") {
						alert('상세주소를 입력해주세요.');
						$("#updateAddress2").focus();
						return false;
					} else {
						$("#updateModal").modal();
					}
				});
								
				$("#modalUpdateBtn").on("click", function() {
					if($("#updatePass").val() == "") {
						$("#updateForm").attr('action', 'userInfoUpdate.manager');
					} else {
						$("#updateForm").attr('action', 'userPassUpdate.manager');
					}
					$("#updateForm").submit();
				});
				
				
				$("#detail-deleteBtn").click(function(){
					$("#deleteModal").modal();
				});
				
				$("#modalDeleteBtn").on("click", function() {
					$("#updateForm").attr('action', 'userDelete.manager');	
					$("#updateForm").submit();
				});
			});
		</script>
      
<%@ include file = "../inc/footer.jsp"%>