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
			<h3>내 정보</h3>
		</div>
		<div class = "col-sm-1"></div>
		<div class = "col-sm-5 container">
			<h3>최근이력</h3>
		</div>
		<div class = "col-sm-1"></div>
	</div>
	
	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-4 container panel panel-default mypage-myinfo">
		
			<div class = "col-sm-6">
				<P>아이디 : ${userinfo.id}</P>
				<P>이름 : ${userinfo.name}</P>
				<P>생년월일 : ${userinfo.birth}</P>
				<P>휴대전화 : ${userinfo.phone}</P>
			</div>
	
			<div class = "col-sm-6">
				<P>이메일 : ${userinfo.email}</P>
				<P>주소 : ${userinfo.post} ${userinfo.address} ${userinfo.address_detail}</P>
				<P>등급 : ${userinfo.rank}</P>
			</div>
			
			<div class = "row">
				<div class = "col-sm-12 text-right form-group">
				<a href = "kakaoView.we" class = "btn btn-primary" title = "간편 로그인 관리">간편 로그인 관리</a>
				<a href = "userDeleteView.we" class = "btn btn-danger" title = "회원탈퇴">회원탈퇴</a>
				</div>
			</div>
		
		</div>
		<div class = "col-sm-1"></div>
		<div class = "col-sm-5 container panel panel-default table-responsive">
			
			<table class="table">
				<thead><tr><th scope = "col">예약번호</th><th scope = "col">인수일</th><th scope = "col">반납일</th><th scope = "col">금액</th><th scope = "col">상태</th></tr></thead>
				<tbody id = "recent"></tbody>
			</table>
			<div style="margin: 10px 10px 15px 0px;" class="text-right">
				<a href="https://jh6194.cafe24.com/wecar_spring/review/list?pstartno=0&uno=${userinfo.uno}" class="btn btn-primary">후기관리</a>
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

	<div class = "row">
		<div class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<div class = "col-sm-5 container panel panel-default">
				<form action="mypagePassDo.we" method = "post" id = "passUpdateForm">
				<fieldset>
				<input type ="hidden" value = "${userinfo.uno}" name = "hiddenNo">
				<input type ="hidden" value = "1" id = "passCheckPNo">
					<h4 class = "mypage-h4">비밀번호 변경</h4>
					<div class = "form-group mypage">
						<div>
							<label for = "nowPassP">현재 비밀번호</label>
							<input class = "form-control pw" type = "password" id = "nowPassP" name = "nowPassP" placeholder = "현재 비밀번호를 입력해주세요." maxlength='20'/>
							<span id = "mypage-passCheckP"></span>
						</div>
						<div>
							<label for = "afterPass">변경할 비밀번호</label>
							<input class = "form-control" type = "password" id = "afterPass" name = "afterPass" placeholder = "변경할 비밀번호를 입력해주세요." maxlength='20' onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
							<strong class = "ps">*영문, 숫자, 특수문자를 조합한 8~20자로 입력해주세요.</strong>
						</div>
						<label for = "afterPassRe">변경할 비밀번호 확인</label>
						<input class = "form-control" type = "password" id = "afterPassRe" name = "afterPassRe" placeholder = "변경할 비밀번호를 다시 입력해주세요." maxlength='20'/>
					</div>
					
					<div class = "form-group text-right">		
						<input class = "btn btn-primary" type = "button" value = "수정" title = "수정하기" id = "passUpdateBtn"/>
					</div>
	 			</fieldset>
				</form>  
			</div>
		<div class = "col-sm-1"></div>
			
			
			
			<div class = "col-sm-6 container panel panel-default" >
				<form action="mypageInfoDo.we" method = "post" id = "infoUpdateForm">
				<fieldset>
				<input type ="hidden" value = "${userinfo.uno}" name = "hiddenNo">
				<input type ="hidden" value = "1" id = "passCheckINo">
					<div class = "form-group mypage">
					<h4 class = "mypage-h4">개인정보 변경</h4>
						<div>
							<label for = "nowPassI">현재 비밀번호</label>
							<input class = "form-control pw" type = "password" id = "nowPassI" name = "nowPassI" placeholder = "현재 비밀번호를 입력해주세요." maxlength='20'/>
							<span id = "mypage-passCheckI"></span>
						</div>	
						<label for = "afterPhone">휴대전화</label>
						<input class = "form-control" type = "text" id = "afterPhone" name = "afterPhone" placeholder = "ex)01012345678" value = "${userinfo.phone}" maxlength='11' onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
						
						<label for = "afterPostcode">주소</label>		
						<div style="display: flex;" class = "form-group">
							<input style="margin-right: 2.5%;" class = "form-control" type = "text" id = "afterPostcode" name = "afterPostcode" value = "${userinfo.post}" placeholder = "우편번호" readonly/>
							<input class = "btn btn-primary" type = "button" value = "우편번호" title = "우편번호 검색" id = "afterPost" />
						</div>
						
						<div class = "form-group">
							<input class = "form-control" type = "text" id = "afterAddress1" name = "afterAddress1" value = "${userinfo.address}" placeholder = "주소" readonly/>	
						</div>
						
						<div class = "form-group">	
							<input class = "form-control" type = "text" id = "afterAddress2" name = "afterAddress2" placeholder = "상세주소를 입력해주세요." value = "${userinfo.address_detail}" maxlength='50'/>
						</div>
						
						<div class = "form-group text-right">		
							<input class = "btn btn-primary" type = "button" value = "수정" title = "수정하기" id = "infoUpdateBtn"/>
						</div>
					</div>
				</fieldset>
				</form> 
				</div>
			</div>
			
			<div class = "col-sm-1"></div>
		</div>
	
	<div class = "row">
		<div class = "col-sm-6"></div>
		<div class = "col-sm-5 container panel panel-default mypage">
 		<form action="mypageEmailDo.we" method = "post" id = "emailUpdateForm">
		<fieldset>
		<input type ="hidden" value = "${userinfo.uno}" name = "hiddenNo">
		<input type ="hidden" value = "1" id = "passCheckENo">
			<h4 class = "mypage-h4">이메일 변경</h4>
			<div>
				<label for = "nowPassE">현재 비밀번호</label>
				<input class = "form-control pw" type = "password" id = "nowPassE" name = "nowPassE" placeholder = "현재 비밀번호를 입력해주세요." maxlength='20'/>
				<span id = "mypage-passCheckE"></span>
			</div>
			
			<label for = "updateEmail">이메일</label>
			<div style="display: flex;">
				<input style="margin-right: 2%;" class = "form-control" type = "email" id = "updateEmail" name = "updateEmail" placeholder = "이메일을 입력해주세요." value = "${userinfo.email}" maxlength='50'/>
				<input style="height:35px;" class = "btn btn-primary" type = "button" value = "인증요청" id = "uENsend" name = "uENsend"/>
			</div>
			
			<div class = "form-group">
	            <label for = "updateEmailNum">인증번호</label>
		        <div style="display: flex;">
					<input style="margin-right: 2%;" class = "form-control" type = "text" id = "updateEmailNum" name = "updateEmailNum" placeholder = "인증번호를 입력해주세요." maxlength='8'/>
					<input type = "hidden" id = "uEN"/>
					<input type = "hidden" id = "uENcheck" value = "-1"/>
					<input style="height:35px;display:none; margin-right: 1%;" class = "btn btn-primary" type = "button" value = "인증" id = "uENreceive" name = "uENreceive"/>
					<input style="height:35px;display:none;" class = "btn btn-primary" type = "button" value = "재전송" id = "uENresend" name = "uENresend"/>		        
			    </div>
			</div>
			
			<div class = "form-group text-right">		
				<input class = "btn btn-primary" type = "button" value = "수정" title = "수정하기" id = "emailupdateBtn"/>
			</div>
 			</fieldset>
			</form> 
		</div>
		
		<div class = "col-sm-1"></div>
	</div>
	
	<!-- Modal -->
	<!-- Modal -->
	
	<div class="modal fade" id="passUpdateModal" tabindex="-1" role="dialog" aria-labelledby="passUpdateModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">회원 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 수정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-primary" value = "수정" id = "passModalUpdateBtn"/>
	       	<input type="button" class="btn btn-default" data-dismiss="modal" value = "취소"/>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="infoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="infoUpdateModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">회원 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 수정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-primary" value = "수정" id = "infoModalUpdateBtn"/>
	       	<input type="button" class="btn btn-default" data-dismiss="modal" value = "취소"/>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="emailUpdateModal" tabindex="-1" role="dialog" aria-labelledby="emailUpdateModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">회원 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>정말 수정하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<input type="submit" class="btn btn-primary" value = "수정" id = "emailModalUpdateBtn"/>
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
			
			// 최근이력
			$(function() {
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
				
				$("#afterPost").on("click", function() {
					new daum.Postcode({
						oncomplete : function(data) {
							$("#afterPostcode").val(data.zonecode);
							$("#afterAddress1").val(data.address);
							$("#afterAddress2").focus();
			         	}
			      	}).open();
			   	});
				
				/* 이메일 인증 */
				/* 이메일 인증 */
						
				var j = "";
		 			$("#uENsend").on("click", function() {
						$.ajax({
							url:"${pageContext.request.contextPath}/mail.we"
							,type:"post"
							,dataType:"text"
							,data:{ "email":$("#updateEmail").val() }
							,success:function(data) {
								j = $("#updateEmail").val();
								alert("인증번호가 발송되었습니다.");
								$("#uENsend").hide();
								$("#uENreceive").show();
								$("#uENresend").show();
								$("#uEN").val(data);
							},error: function(xhr,text,Status,errorThrown) {
								$("#updateEmailNum").html(textStauts + "(HTTP-"+xht.status+"/"+errorThreown);
							}
						});
					});
						
				 	$("#uENresend").on("click", function() {
						$.ajax({
							url:"${pageContext.request.contextPath}/mail.we"
							,type:"post"
							,dataType:"text"
							,data:{ "email":$("#updateEmail").val() }
							,success:function(data) {
								j = $("#updateEmail").val();
								alert("인증번호가 재발송되었습니다.");
								$("#updateEmailNum").removeAttr("readonly", "readonly");
								$("#uEN").val(data);
								$("#uENcheck").val(-1);
							},error: function(xhr,text,Status,errorThrown) {
								$("#updateEmailNum").html(textStauts + "(HTTP-"+xht.status+"/"+errorThreown);
							}
						});
					});
					
					$("#uENreceive").on("click", function() {
						if ($("#uEN").val() == $("#updateEmailNum").val()) {
							alert("인증에 성공하였습니다.");
							$("#updateEmail").attr("readonly", "readonly");
							$("#updateEmailNum").attr("readonly", "readonly");
							$("#uENreceive").attr("disabled", "disabled");
							$("#uENcheck").val(1);
						} else {
							alert("인증에 실패하였습니다.");
						}
					});
					
					/* modal */
					/* modal */
					
					$("#nowPassP").keyup(function() {	// keyup : 사용자가 키를 놓을때 이벤트 발생
						$.ajax ({
							url:"${pageContext.request.contextPath}/WUpassCheck"
							,type:"post"
							,dataType:"text"
							,data:{"pass":$("#nowPassP").val(), "uno":"${userinfo.uno}"}
							,success:function(data) {
								if (data == 1) {
									$("#mypage-passCheckP").text("비밀번호가 일치합니다.");
									$("#mypage-passCheckP").css("color", "blue");
									$("#passCheckPNo").val(1);	// 비밀번호 일치 확인을 위한 hidden값
								} else {
									$("#mypage-passCheckP").text("비밀번호가 일치하지 않습니다.");
									$("#mypage-passCheckP").css("color", "red");	
									$("#passCheckPNo").val(-1);
								}
							},error: function(xhr,text,Status,errorThrown) {
								$("#mypage-passCheckP").html(textStauts + "(HTTP-"+xht.status+"/"+errorThrown)
							}
						}); 
					});
					
					var passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
					$("#passUpdateBtn").click(function(){
						if($("#nowPassP").val() == "") {
							alert('현재 비밀번호를 입력해주세요.');
							$("#nowPassP").focus();
							return false;
						} else if ($("#passCheckPNo").val() == -1) {
							$("#nowPassP").focus();
							return false;
						} else if($("#afterPass").val() == "") {
							alert('변경할 비밀번호를 입력해주세요.');
							$("#afterPass").focus();
							return false;
						} else if(!passwordRule.test($('#afterPass').val())){
							alert('사용불가능한 비밀번호 입니다.');
							$("#afterPass").focus();
							return false;
						} else if($("#afterPassRe").val() == "") {
							alert('변경할 비밀번호를 입력해주세요.');
							$("#afterPassRe").focus();
							return false;
						} else if($("#afterPass").val() != $("#afterPassRe").val()) {
							alert('비밀번호가 일치하지 않습니다.');
							$("#afterPassRe").focus();
							return false;
						} else {
							$("#passUpdateModal").modal();
						}
					});
					
					
					$("#nowPassI").keyup(function() {
						$.ajax ({
							url:"${pageContext.request.contextPath}/WUpassCheck"
							,type:"post"
							,dataType:"text"
							,data:{"pass":$("#nowPassI").val(), "uno":"${userinfo.uno}"}
							,success:function(data) {
								if (data == 1) {
									$("#mypage-passCheckI").text("비밀번호가 일치합니다.");
									$("#mypage-passCheckI").css("color", "blue");
									$("#passCheckINo").val(1);
								} else {
									$("#mypage-passCheckI").text("비밀번호가 일치하지 않습니다.");
									$("#mypage-passCheckI").css("color", "red");	
									$("#passCheckINo").val(-1);
								}
							},error: function(xhr,text,Status,errorThrown) {
								$("#mypage-passCheckI").html(textStauts + "(HTTP-"+xht.status+"/"+errorThrown)
							}
						}); 
					});
					
					$("#infoUpdateBtn").click(function() {			
						if($("#nowPassI").val() == "") {
							alert('현재 비밀번호를 입력해주세요.');
							$("#nowPassI").focus();
							return false;
						} else if ($("#passCheckINo").val() == -1) {
							$("#nowPassI").focus();
							return false;
						} else if($("#afterPhone").val() == "") {
							alert('휴대전화를 입력해주세요.');
							$("#afterPhone").focus();
							return false;
						} else if($("#afterPostcode").val() == "") {
							alert('우편번호를 입력해주세요.');
							$("#afterPostcode").focus();
							return false;
						} else if($("#afterAddress1").val() == "") {
							alert('주소를 입력해주세요.');
							$("#atrerAddress1").focus();
							return false;
						} else if($("#afterAddress2").val() == "") {
							alert('상세주소를 입력해주세요.');
							$("#afterAddress2").focus();
							return false;
						} else {
							$("#infoUpdateModal").modal();
						}
					});
					
					
					$("#nowPassE").keyup(function() {
						$.ajax ({
							url:"${pageContext.request.contextPath}/WUpassCheck"
							,type:"post"
							,dataType:"text"
							,data:{"pass":$("#nowPassE").val(), "uno":"${userinfo.uno}"}
							,success:function(data) {
								if (data == 1) {
									$("#mypage-passCheckE").text("비밀번호가 일치합니다.");
									$("#mypage-passCheckE").css("color", "blue");
									$("#passCheckENo").val(1);
								} else {
									$("#mypage-passCheckE").text("비밀번호가 일치하지 않습니다.");
									$("#mypage-passCheckE").css("color", "red");	
									$("#passCheckENo").val(-1);
								}
							},error: function(xhr,text,Status,errorThrown) {
								$("#mypage-passCheckE").html(textStauts + "(HTTP-"+xht.status+"/"+errorThrown)
							}
						}); 
					});
					
					$("#emailupdateBtn").click(function(){						
						if($("#nowPassE").val() == "") {
							alert('현재 비밀번호를 입력해주세요.');
							$("#nowPassE").focus();
							return false;
						} else if ($("#passCheckENo").val() == -1) {
							$("#nowPassE").focus();
							return false;
						} else if($("#updateEmail").val() == "") {
							alert('이메일을 입력해주세요.');
							$("#updateEmail").focus();
							return false;
						} else if($("#uENcheck").val() == -1 || j != $("#updateEmail").val()) {
							alert('이메일 인증을 진행해주세요.');
							return false;
						} else {
							$("#emailUpdateModal").modal();
						}
					});
					
	
					$("#passModalUpdateBtn").on("click", function() {
						$("#passUpdateForm").submit();
					});
					
					$("#infoModalUpdateBtn").on("click", function() {
						$("#infoUpdateForm").submit();
					});
					
					$("#emailModalUpdateBtn").on("click", function() {
						$("#emailUpdateForm").submit();
					});
				});
		</script>
      
<%@ include file = "../inc/footer.jsp"%>